import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnavigationbar_state.dart';

class BottomnavigationbarCubit extends Cubit<int> {
  BottomnavigationbarCubit() : super(0);

  void updateSelected(int selectedIndex) => emit(selectedIndex);
}
