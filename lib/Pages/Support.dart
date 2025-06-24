import 'dart:convert';

import 'package:business/Class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class support extends StatefulWidget {
  final List list;
  final int index;

  const support({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      getData();
    });
  }

  Future<List> getData() async {
    final response = await http.get(
        Uri.parse("$URL_IP/MyBusiness/AppFile/customer.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 90,
              height: sizes / 98,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 30, top: 20, bottom: 10),
                      child: Container(
                        child: Text(
                          "Comunications",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RefreshIndicator(
                        color: color3p,
                        onRefresh: _refresh,
                        semanticsLabel: 'Refresh',
                        edgeOffset: 60,
                        child: FutureBuilder<List>(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);
                            return snapshot.hasData
                                ? ListView.builder(
                                    itemCount: snapshot.data == null
                                        ? 0
                                        : snapshot.data!.length,
                                    itemBuilder: (context, i) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 20, right: 20),
                                      child: Container(
                                        width: double.infinity,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: color1,
                                        ),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 20),
                                                  child: Text(
                                                    "${snapshot.data![i]['name']}",
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          launchwhatsapp(
                                                              snapshot.data![i]
                                                                  ['phone'],
                                                              'السلام عليكم ورحمة الله وبركاته');
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 8,
                                                                right: 5,
                                                                left: 5,
                                                                bottom: 8),
                                                        child: Container(
                                                          width: 50,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child:
                                                                SvgPicture.asset(
                                                              'assets/icons/whatsapp-2.svg',
                                                              height: 25,
                                                              width: 25,
                                                              color: Colors.green,
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          final Uri uri = Uri(
                                                            scheme: 'sms',
                                                            path:
                                                                "${snapshot.data![i]['phone']}",
                                                          );
                                                          _luanchurl(uri);
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 8,
                                                                right: 5,
                                                                left: 5,
                                                                bottom: 8),
                                                        child: Container(
                                                          width: 50,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child:
                                                                SvgPicture.asset(
                                                              'assets/icons/share.svg',
                                                              height: 25,
                                                              width: 25,
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          final Uri uri = Uri(
                                                            scheme: 'tel',
                                                            path:
                                                                "${snapshot.data![i]['phone']}",
                                                            /* queryParameters: <String, String>
                                            {
                                              'body': Uri.encodeComponent("Altaiyp"),
                                          },*/
                                                          );
                                                          _luanchurl(uri);
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 8,
                                                                right: 5,
                                                                left: 5,
                                                                bottom: 8),
                                                        child: Container(
                                                          width: 50,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child:
                                                                SvgPicture.asset(
                                                              'assets/icons/call-calling.svg',
                                                              height: 25,
                                                              width: 25,
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : new Center(
                                    child: new CircularProgressIndicator(
                                      color: color3p,
                                    ),
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _luanchurl(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (_) {}
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
  }

  Future<void> launchwhatsapp(phone, message) async {
    String url = "whatsapp://send?phone=$phone&text=$message";
    launchUrl(Uri.parse(url));
  }
}
