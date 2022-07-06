import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:unitech/main.dart';

class viewpage extends StatefulWidget {

  Response response;
  viewpage(this.response);


  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  List<String> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewdata();
  }
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
        backgroundColor: Colors.grey,
        title: Text(
          "View Data",
          style: TextStyle(
              fontSize: bodyheight * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.grey),
              currentAccountPicture: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  "src",
                  fit: BoxFit.fill,
                ),
              ),
              accountName: Text("${widget.response.body.}"),
              accountEmail: Text("")),
          Spacer(),
          ListTile(
            onTap: () {

            },
            title: Text(
              "Profile",
              style: TextStyle(
                  fontSize: bodyheight * 0.05, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              Icons.person,
              size: bodyheight * 0.08,
            ),
          ),
          ListTile(
            onTap: () {

              splash.pref!.setBool("loginstatus", false);

              Navigator.of(context).pushAndRemoveUntil(
                // the new route
                MaterialPageRoute(
                  builder: (BuildContext context) => splash(),
                ),
                    (Route route) => false,
              );

            },
            title: Text(
              "Log Out",
              style: TextStyle(
                  fontSize: bodyheight * 0.05, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              Icons.lock,
              size: bodyheight * 0.08,
            ),
          ),
        ],
      )),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          print("listttttttttttttt");
          return Container(
            height: bodyheight * 0.30,
            width: double.infinity,
            margin: EdgeInsets.all(bodyheight * 0.03),
            decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "Name : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: bodyheight * 0.04,
                          color: Colors.black),
                    ),
                    Text(
                      "${widget.response['par_name']}",
                      style: TextStyle(
                          fontSize: bodyheight * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Mobile.No : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: bodyheight * 0.04,
                          color: Colors.black),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          fontSize: bodyheight * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Email : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: bodyheight * 0.04,
                          color: Colors.black),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          fontSize: bodyheight * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void viewdata() {




  }
}
