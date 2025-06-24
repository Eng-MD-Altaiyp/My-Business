import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:business/Class.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../HOME/home.dart';
import 'package:lottie/lottie.dart';





class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  bool show_password = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController User_Name = TextEditingController();
  TextEditingController Password = TextEditingController();
  int number = 0;
  var uname = "";
  var pass = "";
  bool Fingerprint = false;
  bool checkserver=false;

  userLogin() async {
    var data = {
      'uname': User_Name.text,
      'password': Password.text,
    };
    String url = "$URL_IP/MyBusiness/AppFile/user_login.php";
    final response = await http.post(Uri.parse(url), body: json.encode(data));

    if (!response.persistentConnection) {
      Navigator.of(context).pop();
      checkserver=true;
      con("Verify That The Server is Running   (Error 504)", "assets/icons/info-circle.svg");
      return null;
    } else if (response.persistentConnection) {
      if (response.statusCode == 200) {
        //Server response into variable
        print(response.body);
        var msg = jsonDecode(response.body);
        if (msg['loginStatus'] == true) {
          setState(
            () {
              uname1.text = User_Name.text;
              password.text = Password.text;
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            },
          );
        } else {
          setState(
            () {
              Navigator.of(context).pop();
              checkserver=true;
              con("This Account is Not", "assets/icons/info-circle.svg");
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
    } else {
      Navigator.of(context).pop();
      checkserver=true;
      con("Verify That The Server is Running   (Error 504)", "assets/icons/info-circle.svg");
    }
  }

  void initState() {
    super.initState();
  }

  Loading() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Timer(
          Duration(seconds: 10),
              () {
            if(checkserver==false)
                con("Verify That The Server is Running   (Error 504)", "assets/icons/info-circle.svg");
          },
        );userLogin();
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white54,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.white54,
                    color: Color.fromARGB(255, 250, 141, 17),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future Fingers() async {}
  ShowFingers() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        Fingers();
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
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    color: color1,
                    child: Column(
                      children: <Widget>[
                        Container(height: 10),
                        Image.asset("assets/images/Finger.png"),
                        Container(height: 10),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Password",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: Colors.blue.shade800,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                  Container(
                    child: Lottie.asset("assets/images/87845-hello.json"),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          "assets/images/app-bar-background-top.png"),
                      fit: BoxFit.fill,
                    )),
                    height: 125,
                  ),
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
                          top: 150,
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
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
                                          return 'Please Enter User Name';
                                        }
                                        if (value.length < 4) {
                                          return 'User Name must be at least 4 characters';
                                        } else
                                          return null;
                                      },
                                      controller: User_Name,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "  User Name ",
                                          prefixIcon: Icon(
                                            Icons.account_circle,
                                            color: Color(0xff1e3580),
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.grey[400])),
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
                                      return 'Please Enter Password';
                                    }
                                    if (value.length < 4) {
                                      return 'Password must be at least 4 characters';
                                    } else
                                      return null;
                                  },
                                  controller: Password,
                                  obscureText: show_password,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "  Password ",
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Color(0xff1e3580),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            show_password = !show_password;
                                          });
                                        },
                                        icon: show_password == true
                                            ? Icon(
                                                Icons.remove_red_eye,
                                                color: Color(0xff1e3580),
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              )),
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, bottom: 30),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                Fingerprint = true;
                                ShowFingers();
                              });
                            },
                            icon: Icon(
                              Icons.fingerprint_outlined,
                              size: 40,
                              color: Color(0xff1e3580),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() async {
                            if (_formKey.currentState!.validate()) {
                              var result =
                                  await Connectivity().checkConnectivity();
                              if (result == ConnectivityResult.wifi ||
                                  result == ConnectivityResult.mobile) {
                                Loading();
                              } else {
                                con("No Intarnet Connection",
                                    "assets/icons/error-connection.svg");
                              }
                              // con("No Intarnet Connection","assets/icons/error-connection.svg");
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 50,
                          ),
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
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 90),
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You don't have an Accont on the Platform "),
                            GestureDetector(
                              child: Text(
                                "Just Browser",
                                style: TextStyle(color: Color(0xff1e3580)),
                              ),
                              onTap: () {
                                // Write Tap Code Here.
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                            ),
                          ],
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

  con(var masg, var icon) {
    InAppNotification.show(
      duration: Duration(seconds: 4),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffCFACAD),
                  Color(0xffB78285),
                  Color(0xff9F595C),
                ],
              ),

              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: SvgPicture.asset(
                      "$icon",
                      color:  Color(0xffAB6E70),
                      height: 40,
                      width: 40,
                    )),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text("$masg",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
