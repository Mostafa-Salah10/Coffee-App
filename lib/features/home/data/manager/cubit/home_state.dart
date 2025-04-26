part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeGetCoffeesSuccessState extends HomeState {}

final class HomeGetCoffeesLoadingStates extends HomeState {}

final class HomeGetCoffeesFailureState extends HomeState {
  final String error;

  HomeGetCoffeesFailureState({required this.error});
}

final class HomeGetCategoriesSuccessState extends HomeState {}

final class HomeGetCategoriesLoadingState extends HomeState {}

final class HomeGetCategoriesFailureState extends HomeState {
  final String error;

  HomeGetCategoriesFailureState({required this.error});
}

final class HomeAddOrRemoveToCartSuccessState extends HomeState {}

final class HomeAddOrRemoveToCartLoadingState extends HomeState {}

final class HomeAddOrRemoveToCartFailureState extends HomeState {
  final String error;

  HomeAddOrRemoveToCartFailureState({required this.error});
}
final class HomeAddOrRemoveToFavtSuccessState extends HomeState {}

final class HomeAddOrRemoveToFavLoadingState extends HomeState {}

final class HomeAddOrRemoveToFavFailureState extends HomeState {
  final String error;

  HomeAddOrRemoveToFavFailureState({required this.error});
}
final class HomeGetFavtSuccessState extends HomeState {}

final class HomeGetFavLoadingState extends HomeState {}

final class HomeGetFavFailureState extends HomeState {
  final String error;

  HomeGetFavFailureState({required this.error});
}
final class HomeGetCarttSuccessState extends HomeState {}

final class HomeGetCartLoadingState extends HomeState {}

final class HomeGetCartFailureState extends HomeState {
  final String error;

  HomeGetCartFailureState({required this.error});
}

final class HomeIncrementORDecrementQuantityState extends HomeState {
  final int quantity;

  HomeIncrementORDecrementQuantityState({required this.quantity});
}
