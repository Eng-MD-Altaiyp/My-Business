import 'package:business/Class.dart';
import 'package:business/HOME/Opations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      ContinerItem();
    });
  }

  bool showdrawer = false;
  DateTime timeBack = DateTime.now();

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
          "My Business",
        ),
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 15,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              },
              child: Container(
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
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
        ),
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 35, left: 25, bottom: 30),
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/app-bar-background-top.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    uname1.text,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "771504403",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "mohammedaltaiyp52@gmail.com",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return hero();
                                });
                          },
                          child: Hero(
                            tag: 'me_2',
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/me_2.JPG"),
                                  fit: BoxFit.fill,
                                ),
                                border: Border.all(
                                  color: color6,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
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
                child: Container(
                  width: double.infinity,
                  height: 645,
                  child: ContinerItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }

  Widget carous() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/enaiatylogo.png'),
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/enaiatylogo2.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class hero extends StatefulWidget {
  const hero({Key? key}) : super(key: key);

  @override
  State<hero> createState() => _heroState();
}

class _heroState extends State<hero> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: Hero(
              tag: 'me_2',
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/me_2.JPG'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 70,
                  height: 70,
                  child: SvgPicture.asset('assets/icons/close-circle.svg',color: color2x,),
                  ),
              ),
              ),
            ),
        ],
      ),
    );
  }
}
