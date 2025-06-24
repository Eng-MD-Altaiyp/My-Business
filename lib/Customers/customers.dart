import 'package:business/Class.dart';
import 'package:business/Customers/ContinerCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class customers extends StatefulWidget {
  const customers({Key? key}) : super(key: key);

  @override
  State<customers> createState() => _customersState();
}

class _customersState extends State<customers> {
  Future<void> _refresh() async {
    return Future.delayed(
      Duration(seconds: 3),
    );
  }

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
          "My Customers",
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
                  child: ContinerCustom(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
