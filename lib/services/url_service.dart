
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{

  //   const url = 'https://uz.linkedin.com/in/muhammadjon-yo-ldoshev-40313a244';
  //

 static Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: "+998930069001",
    );
    await launchUrl(launchUri);
  }
 static Future<void> makeLinkedIn() async {
   final Uri launchUri = Uri(
     scheme: 'https',
     path: "uz.linkedin.com/in/muhammadjon-yo-ldoshev-40313a244",
   );
   await launchUrl(launchUri);
 }
 static Future<void> makeFacebook() async {
   final Uri launchUri = Uri(
     scheme: 'https',
     path: "facebook.com/Muhammadjon Flutter",
   );
   await launchUrl(launchUri);
 }
 static Future<void> makeGithub() async {
   final Uri launchUri = Uri(
     scheme: 'https',
     path: "github.com/Xojimuhammad",
   );
   await launchUrl(launchUri);
 }
}