import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_body_state.dart';

class NavigationBodyCubit extends Cubit<NavigationBodyState> {
  NavigationBodyCubit() : super(NavigationBodyInitial());

  int selectedIndex = 0;
  showBody(int index) {
    if (index < 4) {
      selectedIndex = index;
      emit(ShowNavigationBody());
    }
  }
}
