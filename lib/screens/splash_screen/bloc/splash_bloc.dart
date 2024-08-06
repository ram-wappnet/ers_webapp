import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';
part 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<LoadSplash>(
      (event, emit) => _mapStartSplashScreenToState(event, emit),
    );
  }
  Future<void> _mapStartSplashScreenToState(
      SplashEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashLoaded()); // Rep
  }
}
