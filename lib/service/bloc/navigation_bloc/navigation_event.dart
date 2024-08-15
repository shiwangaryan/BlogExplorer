abstract class NavigationEvent {}

class NavigationChangeTo extends NavigationEvent {
  final int index;
  NavigationChangeTo(this.index);
}