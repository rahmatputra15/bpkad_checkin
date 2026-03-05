class BottomNavState {
  final int index;

  BottomNavState({required this.index});

  BottomNavState copyWith({int? index}) {
    return BottomNavState(index: index ?? this.index);
  }
}
