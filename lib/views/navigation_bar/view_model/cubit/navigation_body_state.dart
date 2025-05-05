part of 'navigation_body_cubit.dart';

@immutable
sealed class NavigationBodyState {}

final class NavigationBodyInitial extends NavigationBodyState {}
final class ShowNavigationBody extends NavigationBodyState {
}
