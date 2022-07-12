import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toast/toast.dart';
import 'package:unitech/Widget/Coustom_Textfiled.dart';

import 'Registration.dart';

class otpscreen extends StatefulWidget {
  String mobileno1;
  String otp;


  otpscreen(this.mobileno1, this.otp);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onback,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                icon: Icon(Icons.mobile_friendly_outlined)),
          ),
        ),
      ),
    );
  }

  void moveToNextScreen(BuildContext p1) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  Future<String> validateOtp(String otp) async {

    if(otp==widget.otp)
      {
        Toast.show("Otp Successfully", duration: Toast.lengthShort, gravity: Toast.center);
        Navigator.pop(context);

      }
    else{
      Toast.show("Otp Incorrect", duration: Toast.lengthShort, gravity: Toast.center);
    }

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

    //TODO
    // await Future.delayed(Duration(milliseconds: 2000));
    //
    // FirebaseAuth auth = FirebaseAuth.instance;
    //
    // String smsCode = '${otp}';
    //
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: widget.verifyid, smsCode: smsCode);
    // try {
    //   await auth.signInWithCredential(credential).then((value) {
    //     Toast.show("Otp Sucessfull",
    //         duration: Toast.lengthShort, gravity: Toast.center);
    //     Navigator.pop(context);
    //   });
    // } on Exception catch (e) {
    //   Toast.show("OTP Invaild",
    //       duration: Toast.lengthShort, gravity: Toast.center);
    // }
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

class otpscreenn extends StatefulWidget {
  String mobileno1;
  String verifyid;

  otpscreenn(this.mobileno1, this.verifyid);

  @override
  State<otpscreenn> createState() => _otpscreennState();
}

class _otpscreennState extends State<otpscreenn> {
  String _verificationCode = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
  }
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;


    return Scaffold(
      body: SingleChildScrollView(  physics: NeverScrollableScrollPhysics(),
        child: WillPopScope(onWillPop: onback,
          child: SafeArea(
              child: Container(
            height: theight,
            width: twidth,
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: theight * 0.50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(theight * 0.10),
                            bottomLeft: Radius.circular(theight * 0.10),
                          ),
                          gradient: LinearGradient(
                              stops: [
                                0.0,
                                0.4
                              ],
                              colors: [
                                Color(0xff1c3980).withOpacity(0.10),
                                Color(0xFF827CDB).withOpacity(0.60)
                              ],
                              begin: FractionalOffset.topRight,
                              end: FractionalOffset.bottomLeft),
                        ),
                      ),
                    ),
                    Container(
                      height: theight * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: theight * 0.10,
                          ),
                          Center(
                              child: Icon(
                            Icons.mobile_friendly_outlined,
                            size: theight * 0.10,
                          )),
                          SizedBox(
                            height: theight * 0.05,
                          ),
                          Text(
                            "Verify your Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: theight * 0.03),
                          ),
                          Text(
                            "${widget.mobileno1}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: theight * 0.02),
                          ),
                          Text(
                            "Enter your OTP code here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: theight * 0.02,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: theight*0.20,),
                Container(
                  height: theight * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: PinCodeTextField(
                      length: 6,
                      appContext: context,
                      obscureText: false,
                      showCursor: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 45,
                        fieldWidth: 45,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(0),
                        selectedColor: Theme
                            .of(context)
                            .primaryColor,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Color(0xFFF4F7FC),
                        inactiveColor: Color(0x30192D6B),
                        activeColor: Color(0x50192D6B),
                        activeFillColor: Color(0xFFF4F7FC),
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (value) => _verificationCode = value,
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                         Submit();
                    },
                    child: Container(margin: EdgeInsets.all(theight*0.02),
                      height: theight * 0.08,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFF827CDB)),
                      child: Center(child: Text("SUBMIT")),
                    ))
              ],
            ),
          )),
        ),
      ),
    );
  }

  // TextEditingController a = TextEditingController();
  // TextEditingController b = TextEditingController();
  // TextEditingController c = TextEditingController();
  // TextEditingController d = TextEditingController();
  // TextEditingController e = TextEditingController();
  // TextEditingController f = TextEditingController();
  // String list1="";
  // List<String> list=[];

  // Otpbutton(TextEditingController otp) {
  //   return Flexible(
  //     child: TextField(
  //         onChanged: (value) {
  //           print("===================${value}");
  //           if (value.length == 1) {
  //             FocusScope.of(context).nextFocus();
  //           }
  //           list.add(value);
  //           print("333333=====${list}");
  //           list1=list.join();
  //         },
  //         autofocus: true,
  //         controller: otp,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 20),
  //         keyboardType: TextInputType.number,
  //         decoration: InputDecoration(
  //           border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
  //           fillColor: Color(0xfff3f3f4),
  //           filled: true,
  //         )),
  //   );
  // }

  Future<String> Submit() async {

    await Future.delayed(Duration(milliseconds: 2000));

    FirebaseAuth auth = FirebaseAuth.instance;

    String smsCode = '${_verificationCode}';

    print("111====${_verificationCode}");


    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verifyid, smsCode: smsCode);
    try {
      await auth.signInWithCredential(credential).then((value) {
        Toast.show("Otp Successfully", duration: Toast.lengthShort, gravity: Toast.center);
           Navigator.pop(context);
      });
    } on Exception catch (e) {
      Toast.show("OTP Invalid",
          duration: Toast.lengthShort, gravity: Toast.center);
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
