import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/utils/services/i_phone_services.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneServices extends IPhoneServices{
  @override
  openDialer(String mobileNumber) async {

      var url = Uri.parse("tel:$mobileNumber");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }

  }

  @override
  openEmail(UserModel userModel) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: userModel.email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Greetings',
        'body':'${userModel.name} Happy new year',
      }),
    );

    launchUrl(emailLaunchUri);

  }
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}