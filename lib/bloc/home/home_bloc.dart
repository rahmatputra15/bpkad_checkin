import 'package:bpkad_checkin/bloc/home/home_event.dart';
import 'package:bpkad_checkin/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
  }
}
