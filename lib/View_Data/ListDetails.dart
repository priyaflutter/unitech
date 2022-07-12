import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unitech/View_Data/ListData.dart';
import 'package:unitech/model/ListDetails_Model.dart';

class listdetails extends StatefulWidget {
  int? tourId;

  listdetails(this.tourId);

  @override
  State<listdetails> createState() => _listdetailsState();
}

class _listdetailsState extends State<listdetails> {
  bool status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewdetails();
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body:  WillPopScope(
            onWillPop: onback,
            child:status?Center(child: CircularProgressIndicator(backgroundColor: Colors.black)):
            SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: theight * 0.02,
                    ),
                    Center(
                      child: Container(
                        height: theight * 0.10,
                        width: twidth * 0.30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://thumbs.dreamstime.com/b/image-gold-color-cups-winning-team-cricket-tournament-cups-winning-team-cricket-tournament-121020689.jpg"),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Container(  padding: EdgeInsets.all(theight*0.03),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Id : ${view!.data!.tourId}"),
                            Text("Title : ${view!.data!.tourTitle}"),
                            Text("Email : ${view!.data!.tourEmail}"),
                            Text("Address : ${view!.data!.tourGpsAddress}"),
                            Text("Contact : ${view!.data!.tourContact}"),
                            Text("Categories Name : ${view!.data!.tourCatName}"),
                            Text("Date : ${view!.data!.tourDate}"),
                            Text("Time : ${view!.data!.tourTime}"),
                            Text("Fees : ${view!.data!.tourRegisterFees}"),
                            Text("Winner Price : ${view!.data!.tourWinnerPrice}"),
                            Text("Runner Price : ${view!.data!.tourRunnerUpPrice}"),
                            Text("Description : ${view!.data!.tourDescription}"),
                            Text("Rules : ${view!.data!.tourRulsRegulation}"),
                            Text("Created : ${view!.data!.tourCreated}"),

                          ],
                        ),
                      ),
                    ),
                  ],
                ))
        )
    );
  }

  Future<void> viewdetails() async {
    var url = Uri.parse(
        'http://gameon.unitechitsolution.in/api_partner/tournament-detail-partner/${widget.tourId}');
    var response = await http.get(url, headers: {
      'Authorization':
      'Bearer Q5kDI88yaxXyuPZuAxKoMk64ejT3nlpbVto5RlBa1TeKILoaew'
    });
    print('Success:::::${response.statusCode}');
    print('Responce.body:::::${response.body}');
    var val = jsonDecode(response.body);
    setState(() {
      view = viewdetailslist.fromJson(val);
      status=false;
    });
  }

  viewdetailslist? view;

  Future<bool> onback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return listdata();
      },
    ));

    return Future.value(true);
  }
}
