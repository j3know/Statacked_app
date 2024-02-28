import 'package:stacked/stacked.dart';
import 'package:stacked_2/app/app.locator.dart';
import 'package:stacked_2/model/user_model.dart';
import 'package:stacked_2/services/user_service.dart';

import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UsersService>();
  final _navigationDetails = locator<NavigationService>();

  late Future<List<User>> _users;

  Future<List<User>> get users => _users;

  UsersViewModel() {
    getUsersFromServices();
  }

  void getUsersFromServices() {
    _users = _userService.fetchUserData();
    rebuildUi();
  }

  String getAddressAll(User user) {
    return '${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode}';
  }

  void navigateBack() {
    _navigationService.back();
  }
}
