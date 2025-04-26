import 'package:coffee_app/core/constants/hive_constants.dart';
import 'package:coffee_app/core/database/cache/hive_service.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/home/data/models/category_model.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<CategoryModel> categoryList = [];
  List<CoffeeModel> coffeeList = [];
  List<CoffeeModel> favList = [];
  List<CoffeeModel> cartList = [];
  int coffeeSizeCurrentIndex = 0;
  int categoryCurrentIndex = 0;
  Set<String> favSet = {};

  //change categoryCurrent Index
  void changeCategoryCurrentIndex({
    required int index,
    required String categoryName,
  }) async {
    {
      categoryCurrentIndex = index;
      await getCoffeesByCategory(categoryName: categoryName);
    }
  }

  // change coffeeSizeCurrentIndex
  void changeCoffeeSizeCurrentIndex({required int index}) {
    coffeeSizeCurrentIndex = index;
    emit(HomeInitialState());
  }

  //get categories of coffees
  Future<void> getCoffeesCategory({required String categoryName}) async {
    emit(HomeGetCategoriesLoadingState());
    try {
      categoryList =
          _getFromDB(
            listName: HiveConstants.categoryList,
          ).cast<CategoryModel>();
      await getCoffeesByCategory(categoryName: categoryName);
      emit(HomeGetCategoriesSuccessState());
    } catch (e) {
      emit(HomeGetCategoriesFailureState(error: e.toString()));
    }
  }

  //get Coffees By His Category
  Future<void> getCoffeesByCategory({required String categoryName}) async {
    coffeeList.clear();
    emit(HomeGetCoffeesLoadingStates());
    try {
      coffeeList =
          _getFromDB(listName: HiveConstants.coffeeList).cast<CoffeeModel>();
      coffeeList.removeWhere((element) => element.categoryName != categoryName);
      getFavCoffees();
      emit(HomeGetCoffeesSuccessState());
    } catch (e) {
      emit(HomeGetCoffeesFailureState(error: e.toString()));
    }
  }

  //get Favortie Coffees
  Future<void> getFavCoffees() async {
    favList.clear();
    favSet.clear();
    emit(HomeGetFavLoadingState());
    try {
      favList = _getFromDB(listName: HiveConstants.favList).cast<CoffeeModel>();
      for (var element in favList) {
        favSet.add(element.imagePath);
      }
      emit(HomeGetFavtSuccessState());
    } catch (e) {
      emit(HomeGetFavFailureState(error: e.toString()));
    }
  }

  //get Cart Coffees
  Future<void> getCartCoffees() async {
    cartList.clear();
    emit(HomeGetCartLoadingState());
    try {
      cartList =
          _getFromDB(listName: HiveConstants.cartList).cast<CoffeeModel>();

      emit(HomeGetCarttSuccessState());
    } catch (e) {
      emit(HomeGetCartFailureState(error: e.toString()));
    }
  }

  //Add Coffee To Cart
  Future<void> addCoffeeToCart({required CoffeeModel coffeeModel}) async {
    emit(HomeAddOrRemoveToCartLoadingState());
    try {
      if (cartList.contains(coffeeModel)) {
        emit(
          HomeAddOrRemoveToCartFailureState(
            error: AppStrings.addedToCartFailure,
          ),
        );
        return;
      }
      cartList.add(coffeeModel);
      _putInDBt(cartList, HiveConstants.cartList);
      emit(HomeAddOrRemoveToCartSuccessState());
    } catch (e) {
      emit(HomeAddOrRemoveToCartFailureState(error: e.toString()));
    }
  }

  //Remove Coffee To Cart
  Future<void> removeCoffeeFromCart({required CoffeeModel coffeeModel}) async {
    emit(HomeAddOrRemoveToCartLoadingState());
    try {
      cartList.remove(coffeeModel);
      _putInDBt(cartList, HiveConstants.cartList);
      emit(HomeAddOrRemoveToCartSuccessState());
    } catch (e) {
      emit(HomeAddOrRemoveToCartFailureState(error: e.toString()));
    }
  }

  //to increment quantity of coffee
  Future<void> incrementQuantity({required CoffeeModel coffeeModel}) async {
    List<CoffeeModel> list =
        _getFromDB(listName: HiveConstants.coffeeList).cast<CoffeeModel>();
    _removeItemFromDB(list, coffeeModel);
    list.add(coffeeModel.copyWith(quantity: coffeeModel.quantity + 1));
    _putInDBt(list, HiveConstants.coffeeList);
    coffeeModel.quantity = coffeeModel.quantity + 1;
    emit(HomeInitialState());
  }

  //to decremtn quantity of coffee
  Future<void> decrementQuantity({required CoffeeModel coffeeModel}) async {
    if (coffeeModel.quantity == 1) return;
    List<CoffeeModel> list =
        _getFromDB(listName: HiveConstants.coffeeList).cast<CoffeeModel>();
    _removeItemFromDB(list, coffeeModel);
    list.add(coffeeModel.copyWith(quantity: coffeeModel.quantity - 1));
    _putInDBt(list, HiveConstants.coffeeList);
    coffeeModel.quantity = coffeeModel.quantity - 1;
    emit(HomeInitialState());
  }

  Future<void> addOrRemoveFavorites({required CoffeeModel coffeeModel}) async {
    emit(HomeAddOrRemoveToFavLoadingState());
    try {
      if (favSet.contains(coffeeModel.imagePath)) {
        favSet.remove(coffeeModel.imagePath);
        _removeItemFromDB(favList, coffeeModel);
        _putInDBt(favList, HiveConstants.favList);
      } else {
        favSet.add(coffeeModel.imagePath);
        favList.add(coffeeModel);
        _putInDBt(favList, HiveConstants.favList);
      }
      emit(HomeAddOrRemoveToFavtSuccessState());
    } catch (e) {
      emit(HomeAddOrRemoveToFavFailureState(error: e.toString()));
    }
  }

  void _removeItemFromDB(List<CoffeeModel> list, CoffeeModel coffeeModel) {
    return list.removeWhere(
      (element) =>
          element.imagePath == coffeeModel.imagePath &&
          element.categoryName == coffeeModel.categoryName,
    );
  }

  List<dynamic> _getFromDB({required String listName}) {
    return List.from(
      HiveService.get(
        boxName: HiveConstants.boxName,
        key: listName,
        defaultValue: [],
      ),
    );
  }

  Future<void> _putInDBt(List<CoffeeModel> list, String listName) {
    return HiveService.put(
      boxName: HiveConstants.boxName,
      key: listName,
      value: list,
    );
  }
}
