// user_details_viewmodel.dart

import 'package:stacked/stacked.dart';
import 'package:stacked_2/model/user_model.dart';

class UserDetailsViewModel extends BaseViewModel {
  User _user;

  UserDetailsViewModel(User user) : _user = user;

  // Getter methods for accessing user details in the view
  int get userId => _user.id;
  String get userName => _user.name;
  String get userEmail => _user.email;
  String get userPhone => _user.phone;
}
