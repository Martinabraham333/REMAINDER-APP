import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remainder_event.dart';
part 'remainder_state.dart';
part 'remainder_bloc.freezed.dart';

class RemainderBloc extends Bloc<RemainderEvent, RemainderState> {
  RemainderBloc() : super(_Initial()) {
    on<RemainderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
