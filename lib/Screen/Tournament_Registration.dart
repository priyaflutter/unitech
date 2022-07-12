import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:unitech/View_Data/ListData.dart';
import 'package:unitech/Widget/Coustom_Textfiled.dart';



class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.only(left: theight * 0.02, right: theight * 0.02),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: theight * 0.03,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  setState(() {
                    Getimage(context);
                  });
                });
              },
              child:img != ""
                  ? Container(
                margin: EdgeInsets.only(top: theight * 0.02),
                height: theight * 0.15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(
                          File(img),
                        ))),
              )
                  : Container(
                margin: EdgeInsets.only(top: theight * 0.02),
                height: theight * 0.15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/tournament.png"),
                    )),
              ),
            ),
            CustomTextField(
              controller: title,
              focusNode: focustitle,
              nextNode: focusmobile,
              hintText: "Tournament Title",
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller: mobile,
              focusNode: focusmobile,
              nextNode: focusemail,
              hintText: "Mobile No.",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller: email,
              focusNode: focusemail,
              nextNode: focusaddress,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller: Address,
              focusNode: focusaddress,
              nextNode: focusdate,
              hintText: "Address",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.multiline,
              maxline: null,
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: TextField(

                    onTap: () {
                      setState(() {
                        datee();
                      });
                    },
                    controller: date,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: "Tournament Date",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: TextField(

                    onTap: () {
                      setState(() {
                        timee();
                      });
                    },
                    controller: time,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: "Tournament Time",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            // Container( height: 80,
            //   width: 400,
            //   child: Row(
            //     children: [
            //       InkWell(onTap: () {
            //           print("tttttttttt");
            //             datee();
            //
            //       } ,
            //         child: Container( height: theight*0.10,
            //           width: 150,
            //           child: CustomTextField(
            //             controller: date,
            //             focusNode: focusdate,
            //             nextNode: focusteam,
            //             hintText: "Tournament Date",
            //             textInputAction: TextInputAction.next,
            //             maxline: 1,
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 25,
            //       ),
            //       InkWell(onTap: () {
            //         setState(() {
            //           timee();
            //         });
            //       },
            //         child: Container(height: theight*0.10,
            //           width: 150,
            //           child: CustomTextField(
            //             controller: time,
            //             focusNode: focustime,
            //             nextNode: focusteam,
            //             hintText: "Tournament Time",
            //             textInputAction: TextInputAction.next,
            //             maxline: 1,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Text(
              "  Categories",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black54),
            ),
            Container(
              height: theight * 0.38,
              width: double.infinity,
              child: GridView.builder(
                itemCount: turnamenticon.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onDoubleTap: () {
                          setState(() {
                            Selecticon(index);
                          });
                        },
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              "${turnamenticon[index]}",
                              style: TextStyle(
                                fontSize: theight * 0.03,
                              ),
                            ),
                            Text(
                              "${selecttick[index]}",
                              style: TextStyle(
                                  color: Color(0xff1c3980),
                                  fontSize: theight * 0.03),
                            )
                          ],
                        ),
                      ),
                      Text("${turnamentname[index]}",
                          style: TextStyle(
                            // fontSize: theight * 0.03,
                          )),
                    ],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
              ),
            ),
            CustomTextField(
              controller:team,
              focusNode: focusteam,
              nextNode: focusfees,
              hintText: "Total Team",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller: fees,
              focusNode: focusfees,
              nextNode: focuswinnerprice,
              textInputType: TextInputType.number,
              hintText: "Tounament Registration Fee",
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller:winnerprice,
              focusNode:focuswinnerprice,
              nextNode: focusrunnerprice,
              hintText: "Tournament Winner Price",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller:runnerprice,
              focusNode: focusrunnerprice,
              nextNode: focusdescripation,
              hintText: "Tournament Runner-up Price",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxline: 1,
            ),
            CustomTextField(
              controller:desctipation,
              focusNode: focusdescripation,
              nextNode: focusrules,
              hintText: "Description",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.multiline,
              maxline: null,
            ),
            CustomTextField(
              controller: rules,
              focusNode: focusrules,
              hintText: "Rules",
              textInputAction: TextInputAction.newline,
              textInputType: TextInputType.multiline,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Submit();
                });
              },
              child: Center(
                child: Text("Submit"),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Color(0xff1c3980))),
            )
          ],
        ),
      ),
    );
  }
  String img="";
  CroppedFile? croppedFile;

  Getimage(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? photo =
                    await picker.pickImage(source: ImageSource.camera);
                    print("ttttttttttttttt");

                    print("111111111111111");
                    setState(() {
                      img = photo!.path;
                    });
                    print("222222222222222");

                    print("========${img}");

                    croppedFile = await ImageCropper().cropImage(
                      sourcePath: photo!.path,
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

                    print("cropppppppppppp");
                    setState(() {
                      img = croppedFile!.path;
                      print(croppedFile.runtimeType);
                    });


                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 75,
                      child: Image(
                        image: AssetImage("images/camera.png"),
                        fit: BoxFit.fill,
                      )),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? photo =
                    await picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      img = photo!.path;
                    });

                    print("========${img}");

                    croppedFile = await ImageCropper().cropImage(
                      sourcePath: photo!.path,
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

                    setState(() {
                      img = croppedFile!.path;
                      print(croppedFile.runtimeType);
                    });


                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 100,
                      child: Image(image: AssetImage("images/gallary.jpg"))),
                )
              ],
            ),
          ],
        );
      },
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  TextEditingController title = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController team = TextEditingController();
  TextEditingController fees = TextEditingController();
  TextEditingController winnerprice = TextEditingController();
  TextEditingController runnerprice = TextEditingController();
  TextEditingController desctipation = TextEditingController();
  TextEditingController rules = TextEditingController();
  TextEditingController date = TextEditingController();

  final FocusNode focustitle = FocusNode();
  final FocusNode focusemail = FocusNode();
  final FocusNode focusmobile = FocusNode();
  final FocusNode focusaddress = FocusNode();
  final FocusNode focustime = FocusNode();
  final FocusNode focusteam = FocusNode();
  final FocusNode focusfees = FocusNode();
  final FocusNode focuswinnerprice = FocusNode();
  final FocusNode focusrunnerprice = FocusNode();
  final FocusNode focusdescripation = FocusNode();
  final FocusNode focusrules = FocusNode();
  final FocusNode focusdate = FocusNode();

  String p1 = "";


  List<String> turnamenticon = [
    "⚽",
    "🏐",
    "🏸",
    "🏑",
    "🏏",
    "🏊‍♀",
    "🏋️‍♂",
    "🏀",
    "🚴‍♀",
    "🤹",
    "🎮",
    "🧗‍♀"
  ];
  List<String> turnamentname = [
    "Football",
    "Basketball",
    "Tennis",
    "Hockey",
    "Cricet",
    "Swimming",
    "Gym",
    "Volleyball",
    "Rideing",
    "Snoocker",
    "Game",
    "Tracking"
  ];

  Selecticon(int index) {
    if (selection == true) {
      print("000000000000");
      selecttick[index] = tick;
      selection = false;
      print("1111111");
    } else {
      selecttick[index] = "";
      selection = true;
    }
  }

  List<String> selecttick = List.filled(12, "");
  String tick = "✔";
  bool selection = false;



  double password_strength = 0;
  double mailstrength = 0;
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String password = pass.trim();

    if (password.isEmpty) {
      password_strength = 0;
    } else if (password.length < 6) {
      password_strength = 1 / 4;
    } else if (password.length < 8) {
      password_strength = 2 / 4;
    } else {
      if (pass_valid.hasMatch(password)) {
        password_strength = 4 / 4;
        return true;
      } else {
        password_strength = 3 / 4;
        return false;
      }
    }
    return false;
  }

  bool validatemail(String mail) {
    String Email = mail.trim();

    if (Email.isEmpty) {
      mailstrength = 0;
    } else if (Email.length < 6) {
      mailstrength = 1 / 4;
    } else if (Email.length < 8) {
      mailstrength = 2 / 4;
    } else {
      if (emailValid.hasMatch(Email)) {
        mailstrength = 4 / 4;
        return true;
      } else {
        mailstrength = 3 / 4;
        return false;
      }
    }
    return false;
  }

  timee() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 00),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!);
      },
    ).then((value) {
      String Timeee =
          "${value!.hour.toString()}:${value.minute.toString()}\t${value.period.toString().split('.')[1].toUpperCase()}";
      time.text = Timeee;
      // time="${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(value!.hour.toString()+':async '+value!.minute.toString()+':00'))}";
    });
  }

  datee() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(data: ThemeData.light(), child: child!);
      },
    ).then((value) {
      String Date =
          "${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}";
      date.text = Date;
    });
  }


  Submit() async {


    if (title.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Title"),
        backgroundColor: Colors.black,
      ));
    } else if (mobile.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Mobile"),
        backgroundColor: Colors.black,
      ));
    } else if (mobile.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Vaild Mobile No."),
        backgroundColor: Colors.black,
      ));
    } else if (email.text.isEmpty) {
      print("notttttttttt");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Email"),
        backgroundColor: Colors.black,
      ));
    } else if (validatemail(email.text) == false) {
      print("notempthyyyyyyyy");

      if (email.text.isNotEmpty) {
        print("doneeeeeeeeeeeeeee");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 5),
          content: Text(
              "Email should contain Capital,small letter & Number & @ Must be & Special Character"),
          backgroundColor: Colors.black,
        ));
      } else {
        return null;
      }
    } else if (Address.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter password"),
        backgroundColor: Colors.black,
      ));
    } else if (date.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Torunament Date"),
        backgroundColor: Colors.black,
      ));
    } else if (time.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Tournament Time"),
        backgroundColor: Colors.black,
      ));
    } else if (selecttick.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Select One Catogary"),
        backgroundColor: Colors.black,
      ));
    } else if (team.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Team"),
        backgroundColor: Colors.black,
      ));
    } else if (fees.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Registration Fees"),
        backgroundColor: Colors.black,
      ));
    } else if (winnerprice.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Winner Price"),
        backgroundColor: Colors.black,
      ));
    } else if (runnerprice.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Runner-up Price"),
        backgroundColor: Colors.black,
      ));
    } else if (desctipation.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Description"),
        backgroundColor: Colors.black,
      ));
    } else if (rules.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Enter Rules"),
        backgroundColor: Colors.black,
      ));
    } else if (img.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Please Upload Image"),
        backgroundColor: Colors.black,
      ));
    } else {

      List<int> ii = File(img).readAsBytesSync();
      String imagepath = base64Encode(ii);

      Map map={
        'tour_title':title.text,
        'tour_cat_id':tick,
        'tour_contact':mobile.text,
        'tour_email':email.text,
        'tour_image':imagepath,
        'tour_total_team':team.text,
        'tour_date':date.text,
        'tour_time':time.text,
        'tour_register_fees':fees.text,
        'tour_gps_address':Address.text,
        'tour_lat':"21.22222",
        'tour_lng':"72.554155",
        'tour_winner_price':winnerprice.text,
        'tour_runner_up_price':runnerprice.text,
        'tour_description':desctipation.text,
        'tour_ruls_regulation':rules.text,

      };


      var url = Uri.parse('http://gameon.unitechitsolution.in/api_partner/add-tournament-partner');
      var response = await http.post(url,
          body:map,
          headers: {'Authorization': 'Bearer Q5kDI88yaxXyuPZuAxKoMk64ejT3nlpbVto5RlBa1TeKILoaew'});
      print('Success:::::${response.body}');
      var val = jsonDecode(response.body);
      print('Success:::::${val["success"]}');
      print('Success:::::${response.statusCode}');

      if(val["success"]==true)
      {
        Toast.show("Registration Sucessfully",
            duration: Toast.lengthShort, gravity: Toast.center);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return listdata();
        },));
      }
      else{
        Toast.show("Try again later",
            duration: Toast.lengthShort, gravity: Toast.center);
      }

    }


  }
}
