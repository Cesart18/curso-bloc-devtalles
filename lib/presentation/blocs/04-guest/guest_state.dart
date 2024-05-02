part of 'guest_bloc.dart';

enum GuestFilter { all, invited, noInvited }

class GuestState extends Equatable {

  final GuestFilter filter;
  final List<Todo> guests;


  const GuestState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  GuestState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,

  }) => GuestState(
      filter: filter ?? this.filter,
      guests: guests ?? this.guests,
  );


  List<Todo> get filteredGuest {

    switch( filter ){
      case GuestFilter.all:
      return guests;
      case GuestFilter.invited:
      return guests.where((e) => e.done ).toList();
      case GuestFilter.noInvited:
      return guests.where((e) => !e.done).toList();
    }

  }
  int get howManyGuests => filteredGuest.length;
  
  @override
  List<Object> get props => [ filter, guests ];
}


