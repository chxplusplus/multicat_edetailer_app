import 'package:equatable/equatable.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object> get props => [];
}

class LandingStarted extends LandingEvent {}
class NavigateToDetails extends LandingEvent {}
