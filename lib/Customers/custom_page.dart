import 'dart:convert';
import 'package:business/Class.dart';
import 'package:business/Pages/Support.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

import 'package:lottie/lottie.dart';

class Custom_page extends StatefulWidget {
  final String name;

  const Custom_page({Key? key, required this.name}) : super(key: key);

  @override
  State<Custom_page> createState() => _Custom_pageState();
}

class _Custom_pageState extends State<Custom_page> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      getCustomerdata();
      getCustomerprice();
    });
  }

  Future<List> getCustomerdata() async {
    final response = await http.get(Uri.parse(
        "$URL_IP/MyBusiness/AppFile/getcustomer.php?id=$id"));
    return json.decode(response.body);
  }

  Future<List> getCustomerprice() async {
    final response = await http.get(Uri.parse(
        "$URL_IP/MyBusiness/AppFile/price_customers.php?id=$id"));
    return json.decode(response.body);
  }

  int? ind;
  List? snap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: Image.asset(
          'assets/images/app-bar-background-top.png',
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        title: Text(
          "${widget.name}",
        ),
        leading: Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 15,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop(context);
                });
              },
              child: Container(
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/icons/arrow-right.svg',
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: color3p,
        onRefresh: _refresh,
        semanticsLabel: 'Refresh',
        edgeOffset: 100,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/app-bar-background.png"),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: double.infinity,
                    height: 645,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: FutureBuilder<List>(
                        future: getCustomerdata(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? ListView.builder(
                            itemCount: snapshot.data == null
                                ? 0
                                : snapshot.data!.length,
                            itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Slidable(
                                startActionPane: ActionPane(
                                  motion: StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: ((context) {
                                        snapshot.data![i]['request'] !=
                                            snapshot.data![i]['price']
                                            ? showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder:
                                                (BuildContext context) {
                                              return showMessage(
                                                snapshot.data!,
                                                i,
                                              );
                                            })
                                            : setState(() {
                                          showModalBottomSheet(
                                            isScrollControlled: false,
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(10),
                                            ),
                                            backgroundColor:
                                            Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                support(
                                                  list: snapshot.data!,
                                                  index: i,
                                                ),
                                          );
                                        });
                                      }),
                                      icon: snapshot.data![i]['request'] ==
                                          snapshot.data![i]['price']
                                          ? Icons.call
                                          : Icons.edit,
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      spacing: 5,
                                      backgroundColor: Colors.grey.shade200,
                                      foregroundColor: color6,
                                      // backgroundColor: color4,
                                    ),
                                    snapshot.data![i]['request'] ==
                                        snapshot.data![i]['price']
                                        ? SlidableAction(
                                      onPressed: ((context) {
                                        setState(() {
                                          showDialog(
                                              barrierDismissible:
                                              false,
                                              context: context,
                                              builder: (BuildContext
                                              context) {
                                                return check_delete(
                                                    snapshot.data, i);
                                              });
                                        });
                                      }),
                                      icon: Icons.delete_rounded,
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      spacing: 5,
                                      backgroundColor:
                                      Colors.grey.shade200,
                                      foregroundColor: color4,
                                      // backgroundColor: color4,
                                    )
                                        : Text(""),
                                  ],
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade500,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(""),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                "${snapshot.data![i]['name']}",
                                                style: TextStyle(
                                                    color: color3p,
                                                    fontSize: 17),
                                              ),
                                            ),
                                            Text("${i + 1}"),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            snapshot.data![i]['request'] ==
                                                snapshot.data![i]
                                                ['price']
                                                ? SvgPicture.asset(
                                              "assets/icons/order-sent-successfully.svg",
                                              width: 40,
                                              height: 40,
                                            )
                                                : SvgPicture.asset(
                                              "assets/icons/close-circle.svg",
                                              width: 40,
                                              height: 40,
                                            ),
                                            Text(
                                              "${snapshot.data![i]['rdate']}",
                                              style:
                                              TextStyle(color: color3p),
                                            ),
                                            Text(
                                              "${snapshot.data![i]['price']} ريال",
                                              style: TextStyle(
                                                color: color6,
                                              ),
                                            ),
                                            Text(
                                              "${snapshot.data![i]['request']} ريال",
                                              style: TextStyle(
                                                color: snapshot.data![i]
                                                ['request'] !=
                                                    snapshot.data![i]
                                                    ['price']
                                                    ? color4
                                                    : color6,
                                              ),
                                            ),
                                            Text(
                                              "${snapshot.data![i]['work_name']}",
                                              style:
                                              TextStyle(color: color3p),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                              : new Center(
                            child: Lottie.asset(
                                "assets/images/not-found.json",
                                width: 150,
                                height: 150),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 4, right: 4),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(-5, -5),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(5, 5),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text("Residual"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            child: FutureBuilder<List>(
                              future: getCustomerprice(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.error);
                                return snapshot.hasData
                                    ? ListView.builder(
                                    itemCount: snapshot.data == null
                                        ? 0
                                        : snapshot.data!.length,
                                    itemBuilder: (context, i) {
                                      //double residual=snapshot.data![i]['to_total']-snapshot.data![i]['to_request'];
                                      return Center(
                                        child: Text(
                                          "${snapshot.data![i]['residual']} ريال",
                                          style: TextStyle(
                                            color: color6,
                                          ),
                                        ),
                                      );
                                    })
                                    : new Center(
                                  child: Lottie.asset(
                                      "assets/images/not-found.json",
                                      width: 150,
                                      height: 150),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text("Request"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            child: FutureBuilder<List>(
                              future: getCustomerprice(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.error);
                                return snapshot.hasData
                                    ? ListView.builder(
                                  itemCount: snapshot.data == null
                                      ? 0
                                      : snapshot.data!.length,
                                  itemBuilder: (context, i) => Center(
                                    child: Text(
                                      "${snapshot.data![i]['to_request']} ريال",
                                      style: TextStyle(
                                        color: color6,
                                      ),
                                    ),
                                  ),
                                )
                                    : new Center(
                                  child: Lottie.asset(
                                      "assets/images/not-found.json",
                                      width: 150,
                                      height: 150),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text("Total"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            child: FutureBuilder<List>(
                              future: getCustomerprice(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print(snapshot.error);
                                return snapshot.hasData
                                    ? ListView.builder(
                                  itemCount: snapshot.data == null
                                      ? 0
                                      : snapshot.data!.length,
                                  itemBuilder: (context, i) => Center(
                                    child: Text(
                                      "${snapshot.data![i]['to_total']} ريال",
                                      style: TextStyle(
                                        color: color6,
                                      ),
                                    ),
                                  ),
                                )
                                    : new Center(
                                  child: Lottie.asset(
                                      "assets/images/not-found.json",
                                      width: 150,
                                      height: 150),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController Pirce = TextEditingController();

  Widget showMessage(var list, int index) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: color1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding:
                EdgeInsets.only(top: 30, bottom: 30, right: 8, left: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Red_Mountains.png"),
                      fit: BoxFit.fill),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffffffff),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Pirce';
                            }
                            if (value.length < 1) {
                              return 'Pirce must be at least 1 characters';
                            } else
                              return null;
                          },
                          controller: Pirce,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: " Pirce ",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            prefixIcon: Icon(
                              Icons.monetization_on,
                              color: color3p,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text("Enter The Connected Amount With The Previous Amount",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Color(0xFF666666))),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pop();
                                Edit_Request(list, index);
                                Pirce.clear();
                              }
                            });
                          },
                          child: Text("OK"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: color5p),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Cancel"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: color5p),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  con(var masg, var icon, var color) {
    InAppNotification.show(
      duration: Duration(seconds: 5),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: SvgPicture.asset(
                      "$icon",
                      height: 40,
                      width: 40,
                    )),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "$masg",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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

  Future Edit_Request(var list, int index) async {
    String url = "$URL_IP/MyBusiness/AppFile/edit_request.php";
    var data = {
      "work_id": list[index]['work_id'],
      "request": Pirce.text,
    };
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);
      if (msg['loginStatus'] == true) {
        setState(() {
          con("Successfully.", "assets/icons/order-sent-successfully.svg",
              color3);
          _refresh();
        });
      } else if (msg['loginStatus'] == 1) {
        setState(() {
          con("The Amount Received is Greater Than The Agreed Amount.",
              "assets/icons/info-circle.svg", color4);
          _refresh();
        });
      } else {
        setState(
              () {
            con("Fieled.", "assets/icons/info-circle.svg", color4);
            _refresh();
          },
        );
      }
    } else {
      setState(
            () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  Widget check_delete(var list, int i) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Red_Mountains.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: <Widget>[
                    Container(height: 10),
                    Icon(Icons.delete, color: Colors.white, size: 50),
                    Container(height: 10),
                    Text("Confirm Deletion ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white)),
                    Container(height: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Business Name: ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Color(0xFF666666))),
                        TextSpan(
                            text: list[i]['work_name'],
                            style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.orange,
                            )),
                      ]),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                deleteData(list, i);
                                Navigator.of(context).pop();
                                con(
                                    "Deleted.",
                                    "assets/icons/order-sent-successfully.svg",
                                    color3);
                              });
                            },
                            child: Container(
                              width: 60,
                              height: 40,
                              child: Center(child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 15),)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/app-bar-background-top.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                              width: 60,
                              height: 40,
                              child: Center(child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15),)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/app-bar-background-top.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  deleteData(List data, int id) {
    var url = "$URL_IP/MyBusiness/AppFile/deleteData.php";
    http.post(Uri.parse(url), body: {'id': data[id]['work_id']});
  }
}
