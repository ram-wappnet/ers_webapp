import '../../../export.dart';
import '../../../shared/services/preferences.service.dart';
import 'admin_tab_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit()
      : super(AdminState(
          currentTab: NavigationTab.values[Preferences.getTab()],
        )) {
    if (state is NavigationTab) {
      _loadState();
    }
  }
  var scaffoldDrawerKey = GlobalKey<ScaffoldState>(debugLabel: "drawer");
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "key2");

  ValueNotifier<bool> isOpen = ValueNotifier<bool>(true);

  bool isHover = false;

  int isSelectedHover = 0;
  String pageName = "Dashboard";

  void selectTab(NavigationTab tab) {
    emit(state.copyWith(currentTab: tab));
    _saveState(tab);
  }

  Future<void> _saveState(NavigationTab tab) async {
    Preferences.saveTab(tab.index);
  }

  Future<void> _loadState() async {
    final index = Preferences.getTab();
    printErsLog(NavigationTab.values[index].toString());
    emit(state.copyWith(currentTab: NavigationTab.values[index]));
  }

  void toggleMenu() {
    isOpen.value = !isOpen.value;
  }
}
