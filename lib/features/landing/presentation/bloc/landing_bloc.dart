import 'package:flutter_bloc/flutter_bloc.dart';
import 'landing_event.dart';
import 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitial()) {
    on<LandingStarted>((event, emit) async {
      emit(LandingLoading());
      await Future.delayed(const Duration(seconds: 1)); // Simulate loading
      emit(LandingLoaded());
    });
  }
}
