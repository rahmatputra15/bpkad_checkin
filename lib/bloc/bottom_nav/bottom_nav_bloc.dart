import 'package:bpkad_checkin/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:bpkad_checkin/bloc/bottom_nav/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(index: 0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
