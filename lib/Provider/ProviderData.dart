import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unitech/loginpage.dart';

class ProviderData with ChangeNotifier{
  String image = "";
  CroppedFile? croppedFile;
  static SharedPreferences? pref;

  bool namestatus = false;
  bool mailstatus = false;
  bool passstatus = false;
  bool mobilestatus = false;

  bool show = false;



  getcamera() async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    image = photo!.path;

    croppedFile = await ImageCropper().cropImage(
      sourcePath: photo.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    image = croppedFile!.path;
    notifyListeners();
  }

  getgallery() async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

    image = photo!.path;

    croppedFile = await ImageCropper().cropImage(
      sourcePath: photo.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    image = croppedFile!.path;
    notifyListeners();
  }

  showw() {
    if (show == false) {
      show = true;
      notifyListeners();
    } else {
      show = false;
      notifyListeners();
    }
  }

  double password_strength = 0;
  double mailstrength = 0;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  bool validatePassword(String pass) {
    String password = pass.trim();

    if (password.isEmpty) {
      password_strength = 0;
      notifyListeners();
    } else if (password.length < 6) {
      password_strength = 1 / 4;
      notifyListeners();
    } else if (password.length < 8) {
      password_strength = 2 / 4;
      notifyListeners();
    } else {
      if (pass_valid.hasMatch(password)) {
        password_strength = 4 / 4;
        notifyListeners();
        return true;
      } else {
        password_strength = 3 / 4;
        notifyListeners();
        return false;
      }
    }
    return false;
  }
  bool validatemail(String mail) {
    String Email = mail.trim();

    if (Email.isEmpty) {
      mailstrength  = 0;
      notifyListeners();
    } else if (Email.length < 6) {
      mailstrength  = 1 / 4;
      notifyListeners();
    } else if (Email.length < 8) {
      mailstrength  = 2 / 4;
      notifyListeners();
    } else {
      if (emailValid.hasMatch(Email)) {
        mailstrength  = 4 / 4;
        notifyListeners();
        return true;
      } else {
        mailstrength  = 3 / 4;
        notifyListeners();
        return false;
      }
    }
    return false;
  }




}
