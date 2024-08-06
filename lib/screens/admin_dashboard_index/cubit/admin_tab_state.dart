enum NavigationTab { dashboard, feedback, review, employee }

class AdminState {
  final NavigationTab currentTab;

  AdminState({
    required this.currentTab,
  });

  AdminState copyWith({
    NavigationTab? currentTab,
    Map<NavigationTab, bool>? hoverStates,
  }) {
    return AdminState(
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
