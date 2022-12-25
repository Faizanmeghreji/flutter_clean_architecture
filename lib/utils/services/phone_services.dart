import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/utils/services/i_phone_services.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneServices extends IPhoneServices{
  @override
  openDialer(String mobileNumber) async {
    final Uri _phoneUri = Uri(
        scheme: "tel",
        path: mobileNumber
    );
      if (await canLaunchUrl(_phoneUri)) {
        await launchUrl(_phoneUri);
      } else {
        throw UnimplementedError('Unable to call');
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