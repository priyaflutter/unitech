import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class viewlistt with ChangeNotifier{


  List list=[];


  Viewdata() async {

    var url = Uri.parse(
        'http://gameon.unitechitsolution.in/api_partner/tournament-list-partner');
    var response = await http.get(url,headers: {
      "authorised": 'Q5kDI88yaxXyuPZuAxKoMk64ejT3nlpbVto5RlBa1TeKILoaew'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var view=jsonDecode(response.body);
  }

}