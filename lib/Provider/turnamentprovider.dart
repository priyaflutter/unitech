// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:toast/toast.dart';
// import 'package:http/http.dart' as http;
// import 'package:unitech/Provider/viewdataprovider.dart';
// import 'package:unitech/Registration.dart';
// import 'package:unitech/Tournamentt/Registrationform.dart';
// import 'package:unitech/Tournamentt/viewlist.dart';
// import 'package:unitech/model/tunament_body.dart';
//
// class turnament with ChangeNotifier {
//   bool titlestatus = false;
//   bool mobilestatus = false;
//   bool Emailstatus = false;
//   bool Addressstaus = false;
//   bool datestatus = false;
//   bool timestatus = false;
//   bool teamstatus = false;
//   bool feesstatus = false;
//   bool winnerpricestatus = false;
//   bool Runnerstatus = false;
//   bool descripationstatus = false;
//   bool rulesstatus = false;
//   DateTime tt = DateTime.now();
//   final form = GlobalKey<FormState>();
//
//
//   String img = "";
//   CroppedFile? croppedFile;
//   double mailstrength = 0;
//   RegExp emailValid = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   List<String> turnamenticon = [
//     "⚽",
//     "🏐",
//     "🏸",
//     "🏑",
//     "🏏",
//     "🏊‍♀",
//     "🏋️‍♂",
//     "🏀",
//     "🚴‍♀",
//     "🤹",
//     "🎮",
//     "🧗‍♀"
//   ];
//   List<String> turnamentname = [
//     "Football",
//     "Basketball",
//     "Tennis",
//     "Hockey",
//     "Cricet",
//     "Swimming",
//     "Gym",
//     "Volleyball",
//     "Rideing",
//     "Snoocker",
//     "Game",
//     "Tracking"
//   ];
//   List<String> selecttick = List.filled(12, "");
//   String tick = "✔";
//   bool selection = false;
//
//
//
//   bool validatemail(String mail) {
//     String Email = mail.trim();
//
//     if (Email.isEmpty) {
//       mailstrength = 0;
//       notifyListeners();
//     } else if (Email.length < 6) {
//       mailstrength = 1 / 4;
//       notifyListeners();
//     } else if (Email.length < 8) {
//       mailstrength = 2 / 4;
//       notifyListeners();
//     } else {
//       if (emailValid.hasMatch(Email)) {
//         mailstrength = 4 / 4;
//         notifyListeners();
//         return true;
//       } else {
//         mailstrength = 3 / 4;
//         notifyListeners();
//         return false;
//       }
//     }
//     return false;
//   }
//
//   String token='http://gameon.unitechitsolution.in/api_partner/add-tournament-partner';
//
//   Getpref() async {
//
//    Registration.pref=await SharedPreferences.getInstance();
//    token =Registration.pref!.getString('login')??"";
//    notifyListeners();
//   }
//   Settoken(BuildContext context) async {
//
//     Registration.pref = await SharedPreferences.getInstance();
//     Registration.pref!.setString('login', token);
//     notifyListeners();
//
//   }
//
//   Getimage(BuildContext context) {
//     showAnimatedDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     final ImagePicker picker = ImagePicker();
//                     final XFile? photo =
//                         await picker.pickImage(source: ImageSource.camera);
//
//                     img = photo!.path;
//
//                     print("========${img}");
//
//                     croppedFile = await ImageCropper().cropImage(
//                       sourcePath: photo.path,
//                       uiSettings: [
//                         AndroidUiSettings(
//                             toolbarTitle: 'Cropper',
//                             toolbarColor: Colors.deepOrange,
//                             toolbarWidgetColor: Colors.white,
//                             initAspectRatio: CropAspectRatioPreset.original,
//                             lockAspectRatio: false),
//                         IOSUiSettings(
//                           title: 'Cropper',
//                         ),
//                       ],
//                     );
//
//                     img = croppedFile!.path;
//                     print(croppedFile.runtimeType);
//
//                     Navigator.pop(context);
//                     notifyListeners();
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(shape: BoxShape.circle),
//                       height: 75,
//                       child: Image(
//                         image: AssetImage("images/camera.png"),
//                         fit: BoxFit.fill,
//                       )),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     final ImagePicker picker = ImagePicker();
//                     // Pick an image
//                     final XFile? image =
//                         await picker.pickImage(source: ImageSource.gallery);
//
//                     img = image!.path;
//
//                     print("========${img}");
//
//                     croppedFile = await ImageCropper().cropImage(
//                       sourcePath: image.path,
//                       uiSettings: [
//                         AndroidUiSettings(
//                             toolbarTitle: 'Cropper',
//                             toolbarColor: Colors.deepOrange,
//                             toolbarWidgetColor: Colors.white,
//                             initAspectRatio: CropAspectRatioPreset.original,
//                             lockAspectRatio: false),
//                         IOSUiSettings(
//                           title: 'Cropper',
//                         ),
//                       ],
//                     );
//
//                     img = croppedFile!.path;
//                     print(croppedFile.runtimeType);
//
//                     Navigator.pop(context);
//                     notifyListeners();
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(shape: BoxShape.circle),
//                       height: 100,
//                       child: Image(image: AssetImage("images/gallary.jpg"))),
//                 )
//               ],
//             ),
//           ],
//         );
//       },
//       animationType: DialogTransitionType.slideFromBottomFade,
//       curve: Curves.fastOutSlowIn,
//       duration: Duration(seconds: 1),
//     );
//   }
//
//   Future<void> Submitt(BuildContext context,Function callback, Tunament_model tunameny_model) async {
//       List<int> ii = File(img).readAsBytesSync();
//       String imagepath = base64Encode(ii);
//       print(tunameny_model.toJson());
//       var url = Uri.parse('http://gameon.unitechitsolution.in/api_partner/add-tournament-partner');
//       var response = await http.post(url,
//           body: tunameny_model.toJson(),
//           headers: {'Authorization': 'Bearer Q5kDI88yaxXyuPZuAxKoMk64ejT3nlpbVto5RlBa1TeKILoaew',
//       });
//       print('Success:::::${response.body}');
//       var val = jsonDecode(response.body);
//       print('Success:::::${val["success"]}');
//       print('Success:::::${response.statusCode}');
//       if (response.statusCode==208) {
//         callback(true);
//         notifyListeners();
//       } else {
//         callback(false);
//         notifyListeners();
//       }
//       callback(false);
//       notifyListeners();
//   }
//
//   Selecticon(int index) {
//     if (selection == true) {
//       print("000000000000");
//       selecttick[index] = tick;
//       selection = false;
//       print("1111111");
//       notifyListeners();
//     } else {
//       selecttick[index] = "";
//       selection = true;
//       notifyListeners();
//     }
//   }
//
//   Getlocation(BuildContext context) async {}
// }
