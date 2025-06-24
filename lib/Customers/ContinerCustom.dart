import 'dart:convert';

import 'package:business/Class.dart';
import 'package:business/Customers/custom_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;





class ContinerCustom extends StatefulWidget {
  const ContinerCustom({Key? key}) : super(key: key);

  @override
  State<ContinerCustom> createState() => _ContinerCustomState();
}

Future<List> getCustomer() async {
  final response = await http.get(Uri.parse(
      "$URL_IP/MyBusiness/AppFile/customer.php"));
  return json.decode(response.body);
}



class _ContinerCustomState extends State<ContinerCustom> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getCustomer(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ListView.builder(
          itemCount: snapshot.data == null
              ? 0 : snapshot.data!.length,
          itemBuilder: (context, i) => Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child:
             Container(
               width: double.infinity,
               child:
                   Padding(
                     padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                     child: InkWell(
                       onTap: () {
                         setState(() async {
                           var result = await Connectivity().checkConnectivity();
                           if (result == ConnectivityResult.wifi ||
                               result == ConnectivityResult.mobile) {
                             id=snapshot.data![i]['customer_id'];
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Custom_page(name: snapshot.data![i]['name'])));
                           } else {
                            // con("No Intarnet Connection", "assets/icons/error-connection.svg");
                           }
                         });
                       },
                       child: Container(
                         width: 170,
                         height: 200,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Column(
                           children: [
                             Expanded(
                               flex: 4,
                               child: Container(
                                 child: SvgPicture.asset(
                                   'assets/icons/user.svg',
                                   width: 80,
                                   height: 80,
                                   color: color3p,
                                 ),
                               ),
                             ),
                             Expanded(
                               flex: 1,
                               child: Container(
                                 child: Text("${snapshot.data![i]['name']}"),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),

             ),
            ),
        )
            : new Center(
          child: Lottie.asset("assets/images/not-found.json",width: 150,height: 150),
        );
      },
    );
  }
}