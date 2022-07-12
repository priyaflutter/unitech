import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unitech/Screen/Registration.dart';
import 'package:unitech/View_Data/ListData.dart';
import 'package:unitech/Screen/loginpage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Register(),
    builder: EasyLoading.init(),
  ));
}



// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false,
//     home: splash(),
//     builder: EasyLoading.init(),
//
//   ));
// }
//splash

class splash extends StatefulWidget {

  static SharedPreferences? pref;
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  bool login = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Getvalue();
  }

  Future<void> Getvalue() async {

    splash.pref =await SharedPreferences.getInstance();

    setState(() {
      login= splash.pref!.getBool("loginstatus")??false;
    });


    Future.delayed(Duration(seconds:5)).then((value) {

      if (login) {

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            print("viewwww");
            return listdata();
          },
        ));

      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            print("loginnnnnnnn");
            return loginpage();
          },
        ));
      }
    });
  }

  @override                                 
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double tappbar = kToolbarHeight;
    double tstatusbar = MediaQuery.of(context).padding.top;
    double tnavigation = MediaQuery.of(context).padding.bottom;

    double bodyheight = theight - twidth - tstatusbar - tnavigation;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
             SizedBox(height: bodyheight*0.20,),
            Container(
              height: bodyheight * 0.70,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/loginnimage.gif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(height: bodyheight*0.30,),
            Container(
              height: bodyheight * 0.10,
              width: twidth * 0.10,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            SizedBox(height: bodyheight*0.10,),
            Center(
              child: Text(
                "Please Wait",
                style: TextStyle(
                    fontSize: bodyheight * 0.05, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )),
      ),
    );
  }
}


//TODO device id
//TODO send otp php link mobile check
//TODO viewdata update profile
//TODO Controller name in provider
//TODO same Navigator issue with parameter and without paramater
