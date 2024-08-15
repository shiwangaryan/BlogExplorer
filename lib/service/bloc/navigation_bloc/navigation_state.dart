abstract class NavigationState {}

class NavigationStateChanged extends NavigationState {
  final int index;
  NavigationStateChanged(this.index);
}