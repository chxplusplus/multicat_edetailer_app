import 'package:equatable/equatable.dart';

abstract class LandingState extends Equatable {
  const LandingState();
  
  @override
  List<Object> get props => [];
}

class LandingInitial extends LandingState {}
class LandingLoading extends LandingState {}
class LandingLoaded extends LandingState {}
