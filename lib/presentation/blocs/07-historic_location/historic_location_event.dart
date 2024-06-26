part of 'historic_location_bloc.dart';

class HistoricLocationEvent extends Equatable {
  const HistoricLocationEvent();

  @override
  List<Object> get props => [];
}


class NewLocation extends HistoricLocationEvent {

  final ( double lat, double lng ) location;

  const NewLocation({required this.location});

  @override
  List<Object> get props => [location];

}
