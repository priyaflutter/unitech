import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unitech/View_Data/ListDetails.dart';
import 'package:unitech/model/ListviewData_Model.dart';


class listdata extends StatefulWidget {
  const listdata({Key? key}) : super(key: key);

  @override
  State<listdata> createState() => _listdataState();
}

class _listdataState extends State<listdata> {
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view();
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: status
          ? SafeArea(
          child: ListView.builder(
            itemCount: vieww!.data!.length,
            itemBuilder: (context, index) {
              return InkWell(onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                  return listdetails(vieww!.data![index].tourId);
                },));
              },
                child: Expanded(
                  child: Container(
                    // height: theight * 0.30,
                    margin: EdgeInsets.all(theight*0.01),
                    decoration: BoxDecoration(border: Border.all(width: 1),borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: theight * 0.10,
                              width: twidth * 0.35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://thumbs.dreamstime.com/b/image-gold-color-cups-winning-team-cricket-tournament-cups-winning-team-cricket-tournament-121020689.jpg"))),
                            ),
                            Container(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Id : ${vieww!.data![index].tourId}"),
                                  Text("Title : ${vieww!.data![index].tourTitle}"),
                                  Text("Email : ${vieww!.data![index].tourEmail}"),
                                  Text("Address : ${vieww!.data![index].tourGpsAddress}"),
                                  Text("Contact : ${vieww!.data![index].tourContact}"),
                                  Text("Categories Name : ${vieww!.data![index].tourCatName}"),
                                  Text("Date : ${vieww!.data![index].tourDate}"),
                                  Text("Time : ${vieww!.data![index].tourTime}"),
                                  Text("Fees : ${vieww!.data![index].tourRegisterFees}"),
                                  Text("Winner Price : ${vieww!.data![index].tourWinnerPrice}"),
                                  Text("Runner Price : ${vieww!.data![index].tourRunnerUpPrice}"),
                                  Text("Description : ${vieww!.data![index].tourDescription}"),
                                  Text("Rules : ${vieww!.data![index].tourRulsRegulation}"),
                                  Text("Created : ${vieww!.data![index].tourCreated}"),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ))
          : Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }

  Future<void> view() async {
    var url = Uri.parse(
        'http://gameon.unitechitsolution.in/api_partner/tournament-list-partner');
    var response = await http.get(url, headers: {
      'Authorization':
      'Bearer Q5kDI88yaxXyuPZuAxKoMk64ejT3nlpbVto5RlBa1TeKILoaew'
    });
    print('Success:::::${response.statusCode}');
    print('Responce.body:::::${response.body}');
    var val = jsonDecode(response.body);
    setState(() {
      vieww = viewdata.fromJson(val);
      status=true;
    });
  }

  viewdata? vieww;
}


