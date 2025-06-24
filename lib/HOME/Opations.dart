import 'package:business/Class.dart';
import 'package:business/Customers/customers.dart';
import 'package:business/Pages/Assginmets.dart';
import 'package:business/Pages/Exams.dart';
import 'package:business/Pages/Quizs.dart';
import 'package:business/Pages/Tests.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_notification/in_app_notification.dart';

import '../Pages/Projects.dart';

class ContinerItem extends StatefulWidget {
  const ContinerItem({Key? key}) : super(key: key);

  @override
  State<ContinerItem> createState() => _ContinerItemState();
}

class _ContinerItemState extends State<ContinerItem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("assets/images/Red_Mountains.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                child: InkWell(
                  onTap: () {
                    setState(() async {
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.wifi ||
                          result == ConnectivityResult.mobile) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Examing()));
                      } else {
                        con("No Intarnet Connection",
                            "assets/icons/error-connection.svg");
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
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 55,
                                  left: 59,
                                  child: Text(
                                    "Exams",
                                    style: TextStyle(color: color3p),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 45,
                                  child: SvgPicture.asset(
                                    'assets/icons/document-text.svg',
                                    width: 80,
                                    height: 80,
                                    color: color3p,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text("Exams", textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: InkWell(
                  onTap: () {
                    setState(() async {
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.wifi ||
                          result == ConnectivityResult.mobile) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Testing()));
                      } else {
                        con("No Intarnet Connection",
                            "assets/icons/error-connection.svg");
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
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 55,
                                  left: 59,
                                  child: Text(
                                    "Tests",
                                    style: TextStyle(color: color3p),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 45,
                                  child: SvgPicture.asset(
                                    'assets/icons/document-text.svg',
                                    width: 80,
                                    height: 80,
                                    color: color3p,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text("Tests", textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                child: InkWell(
                  onTap: () {
                    setState(() async {
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.wifi ||
                          result == ConnectivityResult.mobile) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Projects()));
                      } else {
                        con("No Intarnet Connection",
                            "assets/icons/error-connection.svg");
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
                              'assets/icons/browser.svg',
                              width: 80,
                              height: 80,
                              color: color3p,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child:
                                Text("Projects", textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: InkWell(
                  onTap: () {
                    setState(() async {
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.wifi ||
                          result == ConnectivityResult.mobile) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Quizs()));
                      } else {
                        con("No Intarnet Connection",
                            "assets/icons/error-connection.svg");
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
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 55,
                                  left: 59,
                                  child: Text(
                                    "Quizs",
                                    style: TextStyle(color: color3p),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 45,
                                  child: SvgPicture.asset(
                                    'assets/icons/document-text.svg',
                                    width: 80,
                                    height: 80,
                                    color: color3p,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text("Quiz", textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                child: InkWell(
                  onTap: () {
                    setState(() async {
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.wifi ||
                          result == ConnectivityResult.mobile) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Assginmets()));
                      } else {
                        con("No Intarnet Connection",
                            "assets/icons/error-connection.svg");
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
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 55,
                                  left: 59,
                                  child: Text(
                                    "Assginmets",
                                    style: TextStyle(color: color3p),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 45,
                                  child: SvgPicture.asset(
                                    'assets/icons/document-text.svg',
                                    width: 80,
                                    height: 80,
                                    color: color3p,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text("Assginmets", textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: InkWell(
                  onTap: () {
                    setState(() async {
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.wifi ||
                          result == ConnectivityResult.mobile) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => customers()));
                      } else {
                        con("No Intarnet Connection", "assets/icons/error-connection.svg");
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
                            child: Text("Customer"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }

  con(var masg, var icon) {
    InAppNotification.show(
      duration: Duration(seconds: 3),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: Color.fromARGB(205, 206, 85, 95),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: SvgPicture.asset(
                    "$icon",
                    color: Colors.white,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text("$masg",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      context: context,
      onTap: () => print('Notification tapped!'),
    );
  }
}
