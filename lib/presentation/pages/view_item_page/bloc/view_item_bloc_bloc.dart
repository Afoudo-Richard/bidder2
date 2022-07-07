import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_item_bloc_event.dart';
part 'view_item_bloc_state.dart';

class ViewItemBlocBloc extends Bloc<ViewItemBlocEvent, ViewItemBlocState> {
  ViewItemBlocBloc() : super(ViewItemBlocInitial()) {
    on<ViewItemBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
