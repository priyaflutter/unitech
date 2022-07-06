import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:unitech/Provider/ProviderData.dart';
import 'package:unitech/loginpage.dart';
import 'package:unitech/otpscreen.dart';
import 'package:unitech/viewpage.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final ProviderData provider = ProviderData();

  DateTime dd=DateTime.now();



  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double tappbar = kToolbarHeight;
    double tstatusbar = MediaQuery.of(context).padding.top;
    double tnavigation = MediaQuery.of(context).padding.bottom;

    double bodyheight = theight - twidth - tstatusbar - tnavigation - tappbar;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "Registration",
          style: TextStyle(
              fontSize: bodyheight * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: ChangeNotifierProvider<ProviderData>(
        create: (context) => provider,
        child: Consumer<ProviderData>(
          builder: (context, provider, child) {
            print("Providerrrrrrrrrrr");
            return WillPopScope(
              onWillPop: onback,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: provider.image != ""
                              ? Container(
                                  height: bodyheight * 0.45,
                                  width: twidth * 0.40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              FileImage(File(provider.image)),
                                          fit: BoxFit.fill)),
                                )
                              : Container(
                                  height: bodyheight * 0.45,
                                  width: twidth * 0.40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage("images/person.png"),
                                          fit: BoxFit.fill)),
                                ),
                        ),
                        Positioned(
                            right: bodyheight * 0.34,
                            bottom: bodyheight * 0.10,
                            child: IconButton(
                                onPressed: () {
                                  print("inkkkkkkkkkkkkkkk");
                                  showModalBottomSheet(
                                    builder: (context) {
                                      return Container(
                                        height: bodyheight * 0.40,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            bottom: bodyheight * 0.20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    // print("cameraaaa");
                                                    provider.getcamera();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.camera,
                                                    size: bodyheight * 0.30,
                                                  )),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    print("Galleryyyyyyy");
                                                    provider.getgallery();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.photo,
                                                    size: bodyheight * 0.30,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: bodyheight * 0.20,
                                )))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          bodyheight * 0.05,
                          bodyheight * 0.03,
                          bodyheight * 0.05,
                          bodyheight * 0.03),
                      child: TextField(
                        onTap: () {
                          provider.namestatus = false;
                        },
                        controller: name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 5,
                            )),
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person, color: Colors.black),
                            errorText: provider.namestatus
                                ? "Please Enter Name"
                                : null),
                      ),
                    ),

                    Form(
                      key: form,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            bodyheight * 0.05,
                            bodyheight * 0.03,
                            bodyheight * 0.05,
                            bodyheight * 0.03),
                        child: TextFormField(
                          onChanged: (value) {
                            provider.mailstatus = false;
                            form.currentState!.validate();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter mail ID";
                            } else {
                              bool result = provider.validatemail(value);
                              if (result) {
                                return null;
                              } else {
                                return "$p1";
                              }
                            }
                          },
                          controller: mail,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Colors.black),
                              errorText: provider.passstatus
                                  ? "Please Enter Email"
                                  : null),
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            bodyheight * 0.05,
                            bodyheight * 0.03,
                            bodyheight * 0.05,
                            bodyheight * 0.03),
                        child: TextFormField(
                          onChanged: (value) {
                            provider.passstatus = false;
                            formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else {
                              bool result = provider.validatePassword(value);
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
                              hintStyle: TextStyle(color: Colors.black),
                              errorText: provider.passstatus
                                  ? "Please Enter Password"
                                  : null),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          bodyheight * 0.05,
                          bodyheight * 0.03,
                          bodyheight * 0.05,
                          bodyheight * 0.03),
                      child: TextField(
                        onTap: () {
                          provider.mobilestatus = false;
                        },
                        controller: mobileno,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 5,
                                )),
                            hintText: "Enter Mobile Number",
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.phone, color: Colors.black),
                            errorText: provider.mobilestatus
                                ? "Please Enter MobileNo"
                                : null),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: SizedBox()),

                        InkWell(
                          onTap: () async {
                            String mobileno1 = mobileno.text;

                            // var url = Uri.parse(
                            //     'http://gameon.unitechitsolution.in/api_partner/check-mobile');
                            // var response = await http.post(url,
                            //     body: {
                            //       'mobile': mobileno1,
                            //       'otp': "2310"
                            //     });
                            // print('Response status: ${response.statusCode}');
                            // print('Response body: ${response.body}');
                            //
                            // var mobileotp = jsonDecode(response.body);
                            //
                            // if (mobileotp["success"] == true) {

                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '+91 ${mobileno1}',
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {},
                                timeout: Duration(seconds: 120),
                                codeSent: (String verificationId, int? resendToken) {
                                  setState(() {
                                    verifyid=verificationId;
                                  });
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return otpscreen(mobileno1,verifyid);
                                        },
                                      ));
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {

                                  if(verificationId==verificationId)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text("OTP Expaire")));
                                    }
                                },
                              );


                            // } else {
                            //   Toast.show(
                            //       "Please Enter Vaild Mobile.No",
                            //       duration: Toast.lengthShort,
                            //       gravity: Toast.center);
                            // }
                          },
                          child: Text("Send OTP     "),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(bodyheight * 0.03),
                        child: LinearProgressIndicator(
                          value: provider.password_strength,
                          backgroundColor: Colors.white30,
                          minHeight: 5,
                          color: provider.password_strength <= 1 / 4
                              ? Colors.red
                              : provider.password_strength == 2 / 4
                                  ? Colors.yellow
                                  : provider.password_strength == 3 / 4
                                      ? Colors.blue
                                      : Colors.green,
                        )),
                    Padding(
                        padding: EdgeInsets.all(bodyheight * 0.03),
                        child: LinearProgressIndicator(
                          value: provider.mailstrength,
                          backgroundColor: Colors.white30,
                          minHeight: 5,
                          color: provider.mailstrength <= 1 / 4
                              ? Colors.red
                              : provider.mailstrength == 2 / 4
                                  ? Colors.yellow
                                  : provider.mailstrength == 3 / 4
                                      ? Colors.blue
                                      : Colors.green,
                        )),
                    InkWell(
                      onTap: () async {
                        print("object");

                        if (name.text.isEmpty ||
                            mail.text.isEmpty ||
                            password.text.isEmpty ||
                            mobileno.text.isEmpty) {
                          setState(() {
                            provider.namestatus = true;
                            provider.mobilestatus = true;
                            provider.mailstatus = true;
                            provider.passstatus = true;
                          });
                        } else if (provider.image.isEmpty) {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                              content: Text("Please Upload Image")));


                        } else if (mobileno.text.length < 10 ||
                            mobileno.text.length > 10) {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                              content: Text("Please Enter 10 Digit Mobile.No")));

                        } else {
                          List<int> img =
                              File(provider.image).readAsBytesSync();
                          String imagepath = base64Encode(img);

                            String name1=name.text;
                            String mobile1=mobileno.text;
                            String password1=password.text;
                            String mail1=mail.text;


                            Map map={'par_name':name1,
                              'par_mobile':mobile1,
                              'par_email':mail1,
                              'password':password1,
                              'par_image':imagepath,
                              'par_device_id':"imagepath"
                            };


                          var url = Uri.parse('http://gameon.unitechitsolution.in/api_partner/register-partner');
                          var response = await http.post(url, body:map);
                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');
                          var val=jsonDecode(response.body);
                          if(val['success']==true){

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text("Registration Sucessfully")));

                            Future.delayed(Duration(seconds: 2)).then((value) {

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                                    return viewpage(response);
                              },));

                            });

                          }else{

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text("Try Again Later")));

                          }
                        }
                      },
                      child: Container(
                        height: bodyheight * 0.17,
                        width: double.infinity,
                        margin: EdgeInsets.all(bodyheight * 0.05),
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: bodyheight * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final form = GlobalKey<FormState>();
  String p = '''Password should contain Capital,small letter & Number &
Special Character''';
  String p1 = '''Email should contain Capital,small letter & Number &
@ Must be & Special Character''';


  String verifyid="";

  Future<bool> onback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return loginpage();
      },
    ));

    return Future.value(true);
  }
}
