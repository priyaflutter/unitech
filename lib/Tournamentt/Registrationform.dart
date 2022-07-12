// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:toast/toast.dart';
// import 'package:unitech/Provider/turnamentprovider.dart';
// import 'package:unitech/Tournamentt/viewlist.dart';
//
// import '../model/tunament_body.dart';
//
// class Registration extends StatefulWidget {
//
//    static SharedPreferences? pref;
//   const Registration({Key? key}) : super(key: key);
//
//   @override
//   State<Registration> createState() => _RegistrationState();
// }
//
// class _RegistrationState extends State<Registration> {
//   final turnament provider = turnament();
//   TextEditingController title = TextEditingController();
//   TextEditingController mobile = TextEditingController();
//   TextEditingController Email = TextEditingController();
//   TextEditingController Address = TextEditingController();
//   TextEditingController time = TextEditingController();
//   TextEditingController team = TextEditingController();
//   TextEditingController fees = TextEditingController();
//   TextEditingController winnerprice = TextEditingController();
//   TextEditingController runnerprice = TextEditingController();
//   TextEditingController desctipation = TextEditingController();
//   TextEditingController rules = TextEditingController();
//   TextEditingController date = TextEditingController();
//   String Date = "";
//   String Timee = "";
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     ToastContext().init(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double theight = MediaQuery
//         .of(context)
//         .size
//         .height;
//     double twidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     double tappbar = kToolbarHeight;
//     double tstatusbar = MediaQuery
//         .of(context)
//         .padding
//         .top;
//     double tnavigation = MediaQuery
//         .of(context)
//         .padding
//         .bottom;
//
//     double bodyheight = theight - twidth - tstatusbar - tnavigation;
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color(0xff1c3980),
//         title: Text("Tournament"),
//       ),
//       body: ChangeNotifierProvider<turnament>(
//         create: (context) => provider,
//         child: Consumer<turnament>(
//           builder: (context, provider, child) {
//             return ListView(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     provider.Getimage(context);
//                   },
//                   child: provider.img != ""
//                       ? Container(
//                     margin: EdgeInsets.only(top: bodyheight * 0.02),
//                     height: bodyheight * 0.25,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: FileImage(
//                               File(provider.img),
//                             ))),
//                   )
//                       : Container(
//                     margin: EdgeInsets.only(top: bodyheight * 0.02),
//                     height: bodyheight * 0.25,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage("images/tournament.png"),
//                         )),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                       left: bodyheight * 0.03, right: bodyheight * 0.03),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Tournament Title",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.titlestatus = false;
//                         },
//                         controller: title,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.titlestatus
//                                 ? "Please Enter Tournament title"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Mobile No.",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.mobilestatus = false;
//                         },
//                         controller: mobile,
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.mobilestatus
//                                 ? "Please Enter Mobile No."
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Email",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Form(
//                         key: provider.form,
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please enter mail ID";
//                             } else {
//                               bool result = provider.validatemail(value);
//                               if (result) {
//                                 return null;
//                               } else {
//                                 return "$p1";
//                               }
//                             }
//                           },
//                           onTap: () {
//                             provider.Emailstatus = false;
//                             provider.form.currentState!.validate();
//                           },
//                           controller: Email,
//                           textInputAction: TextInputAction.next,
//                           decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.black, width: 1)),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.black, width: 1)),
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                     width: 1,
//                                   )),
//                               hintStyle: TextStyle(color: Colors.black),
//                               errorText: provider.mobilestatus
//                                   ? "Please Enter Email"
//                                   : null),
//                         ),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Address",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onChanged: (value) {
//                           provider.Addressstaus = false;
//                         },
//                         onTap: () {
//                           provider.Getlocation(context);
//                         },
//                         controller: Address,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.Addressstaus
//                                 ? "Please Enter Mobile No."
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Tournament Date",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: twidth * 0.22,
//                           ),
//                           Text(
//                             "Tournament Time",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Flexible(
//                             child: TextField(
//                               onChanged: (value) {
//                                 provider.datestatus = false;
//                               },
//                               onTap: () {
//                                 showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(2000),
//                                   lastDate: DateTime(2030),
//                                   builder: (context, child) {
//                                     return Theme(data: ThemeData.light(), child: child!);
//                                   },
//                                 ).then((value) {
//                                   Date =
//                                   "${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}";
//                                   date.text = Date;
//                                 });
//                               },
//                               controller: date,
//                               textInputAction: TextInputAction.next,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1)),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1)),
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Colors.black,
//                                         width: 1,
//                                       )),
//                                   hintStyle: TextStyle(color: Colors.black),
//                                   errorText: provider.datestatus
//                                       ? "Please Select Date"
//                                       : null),
//                             ),
//                           ),
//                           SizedBox(
//                             width: twidth * 0.10,
//                           ),
//                           Flexible(
//                             child: TextField(
//                               onChanged: (value) {
//                                 provider.timestatus = false;
//                               },
//                               onTap: () {
//                                 showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay(hour: 12, minute: 00),
//                                   builder: (context, child) {
//                                     return MediaQuery(
//                                         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//                                         child: child!);
//                                   },
//                                 ).then((value) {
//                                   Timee =
//                                   "${value!.hour.toString()}:${value.minute.toString()}\t${value.period.toString().split('.')[1].toUpperCase()}";
//                                   time.text = Timee;
//                                   // time="${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(value!.hour.toString()+':'+value!.minute.toString()+':00'))}";
//                                 });
//                               },
//                               controller: time,
//                               textInputAction: TextInputAction.next,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1)),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1)),
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Colors.black,
//                                         width: 1,
//                                       )),
//                                   hintStyle: TextStyle(color: Colors.black),
//                                   errorText: provider.timestatus
//                                       ? "Please Select Time"
//                                       : null),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Categories",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Container(
//                         height: bodyheight * 0.70,
//                         width: double.infinity,
//                         child: GridView.builder(
//                           itemCount: provider.turnamenticon.length,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             return Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 InkWell(
//                                   onDoubleTap: () {
//                                     provider.Selecticon(index);
//                                   },
//                                   child: Wrap(
//                                     crossAxisAlignment:
//                                     WrapCrossAlignment.center,
//                                     children: [
//                                       Text(
//                                         "${provider.turnamenticon[index]}",
//                                         style: TextStyle(
//                                           fontSize: bodyheight * 0.07,
//                                         ),
//                                       ),
//                                       Text("${provider.selecttick[index]}",
//                                         style: TextStyle(
//                                             color: Color(0xff1c3980)),)
//                                     ],
//                                   ),
//                                 ),
//                                 Text("${provider.turnamentname[index]}",
//                                     style: TextStyle(
//                                       fontSize: bodyheight * 0.03,
//                                     )),
//                               ],
//                             );
//                           },
//                           gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4),
//                         ),
//                       ),
//                       Text(
//                         "Total Team",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.teamstatus = false;
//                         },
//                         controller: team,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.teamstatus
//                                 ? "Please Enter Total Team"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Tournament Registration Fee",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.feesstatus = false;
//                         },
//                         controller: fees,
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.feesstatus
//                                 ? "Please Enter Registration Fees"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Tournament Winner Price",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.winnerpricestatus = false;
//                         },
//                         controller: winnerprice,
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.winnerpricestatus
//                                 ? "Please Enter Tournament Winner Price"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Tournament Runner-up Price",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.Runnerstatus = false;
//                         },
//                         controller: runnerprice,
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.Runnerstatus
//                                 ? "Please Enter Runner-up Price"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Descripation",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.descripationstatus = false;
//                         },
//                         controller: desctipation,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.descripationstatus
//                                 ? "Please Enter Desripation"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       Text(
//                         "Rules",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                       TextField(
//                         onTap: () {
//                           provider.rulesstatus = false;
//                         },
//                         controller: rules,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.black, width: 1)),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 1,
//                                 )),
//                             hintStyle: TextStyle(color: Colors.black),
//                             errorText: provider.feesstatus
//                                 ? "Please Enter Rules"
//                                 : null),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.03,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           if (title.text.isEmpty ||
//                               mobile.text.isEmpty ||
//                               Email.text.isEmpty ||
//                               Address.text.isEmpty ||
//                               date.text.isEmpty ||
//                               time.text.isEmpty ||
//                               team.text.isEmpty ||
//                               fees.text.isEmpty ||
//                               fees.text.isEmpty ||
//                               winnerprice.text.isEmpty ||
//                               runnerprice.text.isEmpty ||
//                               desctipation.text.isEmpty ||
//                               rules.text.isEmpty) {
//                           } else if (mobile.text.length != 10) {
//                             Toast.show("Please Enter 10 Digit Mobile.No",
//                                 duration: Toast.lengthShort,
//                                 gravity: Toast.center,
//                                 backgroundColor: Colors.black,
//                                 textStyle:
//                                 TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
//                           } else if (provider.img.isEmpty) {
//                             Toast.show("Please Upload Image",
//                                 duration: Toast.lengthShort,
//                                 gravity: Toast.center,
//                                 backgroundColor: Colors.black,
//                                 textStyle:
//                                 TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
//                           }else {
//                             Tunament_model _tunameny_model=new Tunament_model();
//                             _tunameny_model.tourLng="21.222222";
//                             _tunameny_model.tourLat="71.222222";
//                             _tunameny_model.tourRulsRegulation=rules.text;
//                             _tunameny_model.tourDescription=desctipation.text;
//                             _tunameny_model.tourRunnerUpPrice=runnerprice.text;
//                             _tunameny_model.tourWinnerPrice=winnerprice.text;
//                             _tunameny_model.tourRegisterFees=fees.text;
//                             _tunameny_model.tourTotalTeam=team.text;
//                             _tunameny_model.tourCatId="1";
//                             _tunameny_model.tourTime=time.text;
//                             _tunameny_model.tourDate=date.text;
//                             _tunameny_model.tourGpsAddress=Address.text;
//                             _tunameny_model.tourEmail=Email.text;
//                             _tunameny_model.tourContact=mobile.text;
//                             _tunameny_model.tourTitle=title.text;
//                             _tunameny_model.tourImage=provider.img;
//                           provider.Submitt(context, callback,_tunameny_model);
//                         }},
//                         child: Container(
//                           height: bodyheight * 0.15,
//                           width: twidth,
//                           decoration: BoxDecoration(color: Color(0xff1c3980)),
//                           child: Center(
//                             child: Text(
//                               "Submit",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: bodyheight * 0.05),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: bodyheight * 0.01,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   String p1 = '''Email should contain Capital,small letter & Number &
// @ Must be & Special Character''';
//
//
//   callback(bool status) {
//     if (status) {
//       print("fgfff");
//       Toast.show("Registration Successfully",
//           duration: Toast.lengthShort,
//           gravity: Toast.center,
//           backgroundColor: Colors.black,
//           textStyle: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold));
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return viewlist();
//             },
//           ));
//     } else {
//       Toast.show("Try again later",
//           duration: Toast.lengthShort,
//           gravity: Toast.center,
//           backgroundColor: Colors.black,
//           textStyle:
//           TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
//     }
//   }
// }