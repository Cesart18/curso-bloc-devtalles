import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guest_event.dart';
part 'guest_state.dart';

const uuid = Uuid();

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc() : super(GuestState(
    guests: [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    ]
  )) {

    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });

    on<AddGuest>(_addGuestHandler);
    on<ToggleGuest>(_toggleGuestHandler);
  }
   void changeFilter( GuestFilter newFilter ) {

    add(SetCustomFilterEvent(newFilter));

    }

    void addGuest() {
        final newGuest = Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null);
      add(AddGuest(newGuest: newGuest));

    }

    void toggleGuest( String id ){
      add(ToggleGuest(id: id));
    }
    void _addGuestHandler( AddGuest event ,Emitter<GuestState> emit ) {
      
        emit(state.copyWith(guests: [...state.guests, event.newGuest]));
    }
    void _toggleGuestHandler( ToggleGuest event ,Emitter<GuestState> emit ) {

      final newGuests = state.guests.map((guest) {
        if( guest.id == event.id ){
          return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null
          );
        }
          return guest;
      }).toList();

    emit(state.copyWith(guests: newGuests));
    }
}
