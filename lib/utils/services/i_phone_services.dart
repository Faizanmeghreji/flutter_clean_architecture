import 'package:practical_one/models/user_model.dart';

abstract class IPhoneServices {
  openDialer(String mobileNumber);

  openEmail(UserModel userModel);
}
