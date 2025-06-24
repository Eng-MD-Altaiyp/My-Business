import 'dart:convert';
import 'package:business/Class.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Add_Works extends StatefulWidget {
  final String type;

  const Add_Works({Key? key, required this.type}) : super(key: key);

  @override
  State<Add_Works> createState() => _Add_WorksState();}



class _Add_WorksState extends State<Add_Works> {
  Color colorcheck = Color(0xffffffff);
  Color colorcheck1 = Color(0xffffffff);
  final _formKey = GlobalKey<FormState>();
  TextEditingController Customer_Name = TextEditingController();
  TextEditingController Work_Name = TextEditingController();
  TextEditingController Price_work = TextEditingController();
  bool show_password = true;
  String date = "";
  String customer = "";

  Future Add_Works() async {
    //Login API URL
    //use your local IP address instead of localhost or use Web API
    String url = "$URL_IP/MyBusiness/AppFile/Add_work.php";
    // Getting username and password from Controller
    var data = {
      "name": customer.toString(),
      "work_name": Work_Name.text,
      "price": Price_work.text,
      "date": date,
      "type": widget.type.toString(),
    };

    var response = await http.post(Uri.parse(url), body: json.encode(data));
    if (response.statusCode == 200) {
      //Server response into variable
      var msg = jsonDecode(response.body);
      //Check Login Status
      if (msg['loginStatus'] == true) {
        setState(() {
          con("Added.", "assets/icons/order-sent-successfully.svg", color3);
          customer="";
          Work_Name.clear();
          Price_work.clear();
        });
      } else if (msg['loginStatus'] == 'Exisiting') {
        setState(() {
          con("Already Exists.", "assets/icons/warning.svg", color4p);
        });
      } else {
        setState(() {
          con("Feiled.  Check The Data Entered", "assets/icons/warning.svg",
              color4p);
        });
      }
    } else {
      setState(() {
        con("Error in URl.", "assets/icons/warning.svg", color4p);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: Image.asset(
          'assets/images/app-bar-background-top.png',
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        title: Text(
          "ADD WORKS",
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
        // backgroundColor: Color.fromARGB(255, 246, 246, 246),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.red,
              child: ListView(
                children: [
                  Image.asset("assets/images/app-bar-background-top.png"),
                  Image.asset("assets/images/app-bar-background.png"),
                ],
              ),
            ),
            Positioned(
              //top: 20,left: 10,right: 10,bottom: 10,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                //color: Colors.blue,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 130,
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    colorcheck1 = Color(0xffffffff);
                                    Custoers();
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorcheck1,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: SvgPicture.asset(
                                            "assets/icons/user.svg",
                                            height: 30,
                                            width: 30,
                                            color: color3p,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2, bottom: 8),
                                                child: customer != ""
                                                    ? Text("")
                                                    : Text("Chose Customer"),
                                              ),
                                              Text("$customer",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black54),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: color3p,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffffff),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Work Name';
                                    }
                                    if (value.length < 4) {
                                      return 'Work Name must be at least 4 characters';
                                    } else
                                      return null;
                                  },
                                  controller: Work_Name,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "  Work Name ",
                                    prefixIcon: Icon(
                                      Icons.work_history_rounded,
                                      color: color3p,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffffff),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Price';
                                    } else
                                      return null;
                                  },
                                  controller: Price_work,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "  Price Work ",
                                      prefixIcon: Icon(
                                        Icons.monetization_on,
                                        color: color3p,
                                      ),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    colorcheck = Color(0xffffffff);
                                    _selectBerth(context);
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorcheck,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: SvgPicture.asset(
                                            "assets/icons/calendar.svg",
                                            height: 30,
                                            width: 30,
                                            color: color3p,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: date != ""
                                                    ? Text("")
                                                    : Text("Chose Date"),
                                              ),
                                              Text("$date"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: color3p,
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
                      GestureDetector(
                        onTap: () {
                          setState(() async {
                            if (_formKey.currentState!.validate()) {
                              setState(() async {
                                var result =
                                    await Connectivity().checkConnectivity();
                                if (result == ConnectivityResult.wifi ||
                                    result == ConnectivityResult.mobile) {
                                  if (date == "") {
                                    setState(() {
                                      colorcheck = color4;
                                    });
                                  } else {
                                    if (customer != "") {
                                      Add_Works();
                                    } else {
                                      setState(() {
                                        colorcheck1 = color4;
                                      });
                                    }
                                  }
                                } else {
                                  con("No Intarnet Connection.  Check Your Internet Connection",
                                      "assets/icons/warning.svg", color4p);
                                }
                              });
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 54,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/app-bar-background-top.png"),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 5),
                                blurRadius: 15,
                                color: Colors.grey.shade300,
                              ),
                              BoxShadow(
                                  offset: Offset(-5, -5),
                                  blurRadius: 15,
                                  color: Colors.grey.shade300),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "ADD",
                            style: TextStyle(color: Colors.white),
                          ),
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
    );
  }

  con(var masg, var icon, var color) {
    InAppNotification.show(
      duration: Duration(seconds: 3),
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

  DateTime selectedDate = DateTime.now();

  Future _selectBerth(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      helpText: "SELECT BOOKING DATE",
      cancelText: "NOT NOW",
      confirmText: "BOOK NOW",
      fieldHintText: "DATE/MONTH/YEAR",
      fieldLabelText: "BOOKING DATE ",
      errorFormatText: "Enter a Valid Date",
      errorInvalidText: "Date Out of Range",
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.input,
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
         date= selectedDate.day.toString()+"-"+selectedDate.month.toString()+"-"+selectedDate.year.toString();
      });
    }
  }



  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("$URL_IP/MyBusiness/AppFile/customer.php"));
    return json.decode(response.body);
  }

   Custoers() {
     showDialog(
       barrierDismissible: customer==""?false:true,
       context: context,
       builder: (BuildContext context) {
         return Dialog(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(9),
           ),
           child: Padding(
             padding: const EdgeInsets.only(top: 15,bottom: 15,left: 9,right: 9),
             child: Container(
               width: double.infinity,
               height: 230,
               child: FutureBuilder<List>(
                 future: getData(),
                 builder: (context, snapshot) {
                   if (snapshot.hasError) print(snapshot.error);
                   return snapshot.hasData
                       ? ListView.builder(
                     itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                     itemBuilder: (context, i) => Padding(
                       padding: const EdgeInsets.only(top: 5,right: 10,left: 10),
                       child: Container(
                         height: 40,
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage(
                                 "assets/images/app-bar-background-top.png"),
                             fit: BoxFit.fill,
                           ),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Align(
                           alignment: Alignment.centerRight,
                           child: Row(
                             children: [
                               Expanded(
                                 flex: 4,
                                 child: InkWell(
                                   onTap: () {
                                     setState(() {
                                       customer = snapshot.data![i]["name"];
                                       Navigator.of(context).pop();
                                     });
                                   },
                                   child: Align(
                                     alignment: Alignment.centerRight,
                                     child: Text('${snapshot.data![i]["name"]}',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
                                   ),
                                 ),
                               ),
                               Expanded(
                                 flex: 1,
                                 child: Padding(
                                   padding:
                                   const EdgeInsets.only(left: 2, right: 2),
                                   child: Center(child: Text('${i + 1}',style: TextStyle(color: Colors.white,fontSize: 18),)),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                   )
                       : new Center(
                     child: Lottie.asset(
                         "assets/images/97018-window10-style-login-loader.json",
                         width: 100,
                         height: 100),
                   );
                 },
               ),
             ),
           ),
         );
       },
     );
  }
}

/*

Dialog(
      child: Container(
        width: double.infinity,
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.only(top: 5,right: 10,left: 10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/app-bar-background-top.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      customer = snapshot.data![i]["name"];
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('${snapshot.data![i]["name"]}',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, right: 2),
                                  child: Center(child: Text('${i + 1}',style: TextStyle(color: Colors.white,fontSize: 18),)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : new Center(
                    child: Lottie.asset(
                        "assets/images/97018-window10-style-login-loader.json",
                        width: 100,
                        height: 100),
                  );
          },
        ),
      ),
    );
 */
