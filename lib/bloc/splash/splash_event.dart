part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class NavigateToLogin extends SplashEvent {
  const NavigateToLogin();

  @override
  List<Object> get props => [];
}
