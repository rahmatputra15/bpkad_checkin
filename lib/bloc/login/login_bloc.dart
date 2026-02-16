import 'package:bpkad_checkin/bloc/login/login_event.dart';
import 'package:bpkad_checkin/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
  }
}
