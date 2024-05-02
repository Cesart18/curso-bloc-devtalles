part of 'guest_bloc.dart';

sealed class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}


final class SetAllFiltertEvent extends GuestEvent{}
final class SetInvitedFilterEvent extends GuestEvent{}
final class SetNotInvitedFilterEvent extends GuestEvent{}

final class SetCustomFilterEvent extends GuestEvent{

  final GuestFilter newFilter;
  const SetCustomFilterEvent(this.newFilter);
  

}

final class AddGuest extends GuestEvent{
  final Todo newGuest;

  const AddGuest({required this.newGuest});

}

final class ToggleGuest extends GuestEvent{
  final String id;

  const ToggleGuest({required this.id});

}