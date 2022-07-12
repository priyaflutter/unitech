import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:unitech/Provider/ProviderData.dart';
import 'package:http/http.dart' as http;
import 'package:unitech/Screen/Registration.dart';
import 'package:unitech/Screen/Tournament_Registration.dart';
import 'package:unitech/View_Data/ListData.dart';
import 'package:unitech/main.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final ProviderData provider = ProviderData();

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double tappbar = kToolbarHeight;
    double tstatusbar = MediaQuery.of(context).padding.top;
    double tnavigation = MediaQuery.of(context).padding.bottom;

    double bodyheight = theight - twidth - tstatusbar - tnavigation;

    return Scaffold(
      body: ChangeNotifierProvider<ProviderData>(
          create: (context) => provider,
          child: Consumer<ProviderData>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: bodyheight * 0.30,
                      ),
                      Card(
                        child: Container(
                          height: bodyheight * 0.65,
                          margin: EdgeInsets.fromLTRB(
                              bodyheight * 0.05, 0, bodyheight * 0.05, 0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextField(
                                  onTap: () {
                                    provider.mobilestatus = false;
                                  },
                                  controller: mobileno,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 5,
                                      )),
                                      hintText: "Enter Mobile Number",
                                      hintStyle: TextStyle(color: Colors.black),
                                      prefixIcon: Icon(Icons.phone,
                                          color: Colors.black),
                                      errorText: provider.mobilestatus
                                          ? "Please Enter MobileNo"
                                          : null),
                                ),

                                // Form( key: form,
                                //   child: TextFormField(
                                //     onChanged: (value) {
                                //       provider.mailstatus = false;
                                //       form.currentState!.validate();
                                //     },
                                //     validator: (value) {
                                //
                                //       if (value!.isEmpty) {
                                //         return "Please enter mail ID";
                                //       } else {
                                //         bool result = provider.validatemail(value);
                                //         if (result) {
                                //           return null;
                                //         } else {
                                //           return "$p1";
                                //         }
                                //       }
                                //     },
                                //     controller: mail,
                                //     textInputAction: TextInputAction.next,
                                //     obscureText: provider.show,
                                //     decoration: InputDecoration(
                                //         prefixIcon:Icon(Icons.mail,color: Colors.black,) ,
                                //         enabledBorder: OutlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Colors.black, width: 2)),
                                //         focusedBorder: OutlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Colors.black, width: 2)),
                                //         border: OutlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Colors.black, width: 2)),
                                //         hintText: "Enter Email",
                                //         hintStyle: TextStyle(color: Colors.black),
                                //         errorText: provider.passstatus
                                //             ? "Please Enter Email"
                                //             : null),
                                //   ),
                                // ),

                                Form(
                                  key: formKey,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      provider.passstatus = false;
                                      formKey.currentState!.validate();
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter password";
                                      } else {
                                        bool result =
                                            provider.validatePassword(value);
                                        if (result) {
                                          return null;
                                        } else {
                                          return "$p";
                                        }
                                      }
                                    },
                                    controller: password,
                                    textInputAction: TextInputAction.done,
                                    obscureText: provider.show,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.password,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              provider.showw();
                                            },
                                            icon: Icon(provider.show
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                        hintText: "Enter Password",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        errorText: provider.passstatus
                                            ? "Please Enter Password"
                                            : null),
                                  ),
                                ),

                                InkWell(
                                  onTap: () async {
                                    if (mobileno.text.isEmpty ||
                                        password.text.isEmpty) {
                                      setState(() {
                                        provider.mobilestatus = true;
                                        provider.passstatus = true;
                                      });
                                    } else {
                                      Map map = {
                                        'mobile': mobileno.text,
                                        'password': password.text,
                                        'device_id': "Device"
                                      };

                                      var url = Uri.parse(
                                          'http://gameon.unitechitsolution.in/api_partner/login-partner');
                                      var response = await http.post(url, body: map);
                                      print('Response status: ${response.statusCode}');
                                      print('Response body: ${response.body}');

                                      var logindata = jsonDecode(response.body);

                                      if (logindata["success"] == true) {

                                        EasyLoading.show(status: "loading").then((value) {

                                          Toast.show("LogIn Sucessfully",
                                              duration: Toast.lengthShort,
                                              gravity: Toast.center);

                                        }).whenComplete(() {
                                          EasyLoading.dismiss();
                                        });

                                        Future.delayed(Duration(seconds: 2))
                                            .then((value) {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                                                return Registration();
                                          },));

                                        });
                                      } else {
                                        Toast.show("Invaild Email & Password",
                                            duration: Toast.lengthShort,
                                            gravity: Toast.center);
                                      }

                                      // view = viewdata.fromJson(logindata);
                                      
                                      splash.pref!.setBool("loginstatus", true);

                                    }
                                  },
                                  child: Container(
                                    height: bodyheight * 0.14,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: bodyheight * 0.05,
                      ),
                      FadeInDown(
                        duration: Duration(seconds: 3),
                        child: Text(
                          "If Don't Have Account",
                          style: TextStyle(
                            fontSize: bodyheight * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: bodyheight * 0.05,
                      ),
                      FadeInDown(
                        duration: Duration(seconds: 3),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Register();
                                },
                              ));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.05,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black))),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }

  TextEditingController mail = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
  }

  // viewdata? view;
  String verify = "";

  final formKey = GlobalKey<FormState>();
  final form = GlobalKey<FormState>();
  String p = '''Password should contain Capital,small letter & Number & 
Special Character''';
  String p1 = '''Email should contain Capital,small letter & Number &
@ Must be & Special Character''';

  // http://promistri.workfordemo.in/api/check_mobile
//mobile=6655999999
  
}
