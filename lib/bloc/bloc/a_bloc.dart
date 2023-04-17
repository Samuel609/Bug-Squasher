import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'a_event.dart';
part 'a_state.dart';

class ABloc extends Bloc<AEvent, AState> {
  ABloc() : super(AInitial()) {
    on<AEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
