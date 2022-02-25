import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Constants/Colors.dart';
import 'package:untitled/Model/SittingData.dart';
import 'package:untitled/Provider/SittingProvider.dart';

class SittingPlane extends StatefulWidget {
  const SittingPlane({Key? key}) : super(key: key);

  @override
  _SittingPlaneState createState() => _SittingPlaneState();
}

class _SittingPlaneState extends State<SittingPlane> {
  late double height;
  late double weidth;
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    weidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
            Ccolors.appbarcolor,
            Colors.purple,
          ], tileMode: TileMode.clamp)),
          child: Text(
            "Available Studios",
            style: TextStyle(fontSize: 22),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        elevation: 5,
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.arrow_forward,color: Colors.purple,size: 35,),
      ),
      body: Container(
        height: height,
        width: weidth,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.purple, Ccolors.appbarcolor])),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, i) => Container(
            child: Card(
              elevation: 5,
              color: Ccolors.appbarrcolo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: height * 0.20,
                width: weidth * 0.7,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[i].hotelname,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "from \$" + data[i].price.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // Expanded(
                    //     child: ListView.builder(
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: (context, j) => GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           data[i].selecttable[j] = !data[i].selecttable[j];
                    //         });
                    //       },
                    //       child: data[i].selecttable[j]? FaIcon(
                    //               FontAwesomeIcons.chair,
                    //               size: 35,
                    //               color: Colors.white,
                    //             )
                    //           : FaIcon(
                    //               FontAwesomeIcons.chair,
                    //               size: 35,
                    //               color: Colors.black,
                    //             )),
                    //   itemCount: (data[i].numberoftables),
                    // )),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Flexible(
                      child: GridView.count(
                        shrinkWrap: true,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,

                        scrollDirection: Axis.horizontal,
                        children: List.generate(data[i].numberoftables, (index) =>GestureDetector(
                            onTap: () {
                              setState(() {
                                data[i].selecttable[index] = !data[i].selecttable[index];


                              });
                            },
                            child: data[i].selecttable[index]
                                ? Icon(
                              IconData(0xe800,fontFamily: 'Schyler'),
                              size: 35,
                              color: Colors.greenAccent,
                            )
                                : Icon(
                              IconData(0xe800,fontFamily: 'Schyler'),
                              size: 35,
                              color: Colors.white,
                            ))

                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          itemCount: data.length,
        ),
      ),
    );
  }

  List<SittingData> data = [];

  late int lengtht;
  List<int> selecttable=[];
  List<String> Selectcafe=[];

  @override
  void initState() {
    SittingDataProvider sittingDataProvider = SittingDataProvider();
    data = sittingDataProvider.hotel;


    super.initState();
  }
}
