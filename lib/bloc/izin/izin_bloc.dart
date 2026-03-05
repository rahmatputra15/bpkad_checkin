import 'package:bpkad_checkin/bloc/izin/izin_event.dart';
import 'package:bpkad_checkin/bloc/izin/izin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IzinBloc extends Bloc<IzinEvent, IzinState> {
  IzinBloc() : super(IzinState()) {
    on<IzinEvent>((event, emit) {});
  }
}
