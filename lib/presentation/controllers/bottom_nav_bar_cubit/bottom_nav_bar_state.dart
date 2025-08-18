part of 'bottom_nav_bar_cubitt.dart';

sealed class BottomNavBarState extends Equatable {
  final int currentIndex;

  const BottomNavBarState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class InitialState extends BottomNavBarState {
  const InitialState() : super(currentIndex: 0);
}

class ChangeState extends BottomNavBarState {
  const ChangeState(int currentIndex) : super(currentIndex: currentIndex);
}
