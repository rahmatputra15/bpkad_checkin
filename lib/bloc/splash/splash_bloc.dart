import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<NavigateToLogin>((event, emit) async {
      await Future.delayed(Duration(seconds: 3));
      emit(NavigateToLoginState());
    });
  }
}
