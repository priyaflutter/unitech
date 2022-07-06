import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:toast/toast.dart';

import 'Registration.dart';

class otpscreen extends StatefulWidget {
  
  String mobileno1;
  String verifyid;

  otpscreen(this.mobileno1, this.verifyid);



  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    WillPopScope(onWillPop: onback,
      child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
        child: Container(height:MediaQuery.of(context).size.height,
          child: OtpScreen.withGradientBackground(
            topColor: Color(0xffd4c9cc),
            bottomColor: Colors.grey,
            otpLength: 6,
            validateOtp: validateOtp,
            routeCallback: moveToNextScreen,
            themeColor: Colors.white,
            titleColor: Colors.white,
            title: "Phone Number Verification",
            subTitle: "Enter the code sent to \n +91${widget.mobileno1}",
            icon: Icon(Icons.mobile_friendly_outlined)
          ),
        ),
      ),
    ),);
  }

  void moveToNextScreen(BuildContext p1) {

      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>Register()));

  }

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));

    FirebaseAuth auth = FirebaseAuth.instance;

    String smsCode = '${otp}';

    // Create a PhoneAuthCredential with the code
    // PhoneAuthCredential credential =
    // await PhoneAuthProvider.credential(verificationId: widget.verifyid, smsCode: smsCode);
    //
    // print("credential::::$credential");
    //
    // if (widget.verifyid==false ) {
    //
    //   return "Wrong Otp! \n Please Enter Vaild OTP";
    // } else {
    //   await auth.signInWithCredential(credential);
    //   Navigator.pop(context);
    //   return "true";
    // }

    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: widget.verifyid, smsCode: smsCode);
    try {
      await auth.signInWithCredential(credential).then((value){
        Toast.show("Otp Sucessfull",
            duration: Toast.lengthShort,
            gravity: Toast.center);
        Navigator.pop(context);
      });
    } on Exception catch (e) {
      Toast.show("OTP Invaild",
          duration: Toast.lengthShort,
          gravity: Toast.center);
    }
    return "true";
  }
  
  Future<bool> onback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Register();
      },
    ));

    return Future.value(true);
  }

}
