import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unitech/Provider/viewdataprovider.dart';

class viewlist extends StatefulWidget {


  const viewlist({Key? key}) : super(key: key);


  @override
  State<viewlist> createState() => _viewlistState();
}

class _viewlistState extends State<viewlist> {
  final viewlistt provider = viewlistt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
         provider.Viewdata();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ChangeNotifierProvider<viewlistt>(
        create: (context) => provider,
        child: Consumer<viewlistt>(
          builder: (context, provider, child) {

              return ListView.builder(

                itemBuilder: (context, index) {
                     return Container();
              },);
          },
        ),
      )),
    );
  }
}
