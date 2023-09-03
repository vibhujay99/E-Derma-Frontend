import 'package:e_derma/models/user_model.dart';

class GlobalUser{
  static User currentUser = User(name:'', email: '', phoneNum: '', dateOfBirth: '');

  static String authToken = '';

}