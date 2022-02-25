import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled/Constants/Colors.dart';
import 'package:untitled/Provider/SittingProvider.dart';
import 'package:untitled/SittingPlane/ReservationDetail.dart';
class Resturants extends StatefulWidget {
  const Resturants({Key? key}) : super(key: key);

  @override
  _ResturantsState createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
 late double height;
 late double width;
 bool search=true;
 final item=["Vaccination Card is compulsry","Wear Masks","Washing your hands frequently."];
 var val="Covid - 19 Information";
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: width*1,
          //padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

          ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 search? IconButton(onPressed: (){

                    setState(() {
                      search=!search;
                    });
                  }, icon:Icon(Icons.search,color: Colors.white,size: 30,)):
                  SizedBox(width: width*0.01,),
                  search?Text("Search for Resturent"):
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                          filled: true,
                          suffixIcon: IconButton(onPressed:(){
                            setState(() {
                              search=!search;
                            });
                          },icon: Icon(Icons.search,color: Colors.white,),),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Type in your text",
                          ),

                    ),
                  )


                ],
              )
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Ccolors.appbarcolor,
                Colors.purple,
              ],
              tileMode: TileMode.clamp
            )
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //Icon(Icons.warning,color: Colors.white,size: 30,),
                  //Text("Covid- 19 Information"),
                  Container(

                    child: DropdownButton(
                    //value: val,
                      hint: Row(
                        children: [
                          Icon(Icons.warning,color: Colors.white,size: 25,),
                          SizedBox(width: width*0.01,),
                          Text("COVID-19 information",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),),
                        ],
                      ),
                    underline: SizedBox(),
                    iconSize: 45,
                    dropdownColor: Colors.purple,
                    iconEnabledColor: Colors.white,
                    items:item.map((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Ccolors.appbarcolor,
                                  Colors.purple,
                                ],
                                tileMode: TileMode.clamp
                            )
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.verified_outlined,color: Colors.white,size: 30,),
                              SizedBox(width: width*0.01,),
                              Text(
                                value,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (Object? value) {  },
                      

                  ),
                ),
      ]
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: sittingDataProvider.hotel.length,
                    itemBuilder: (xtx,i)=>Container(
                      height: height*0.5,
                      width: width,
                      child: Card(

                        shadowColor: Colors.white,
                        child: Stack(
                          children: [
                            Image.network(sittingDataProvider.hotel[i].resturent_image,height:height*0.5,width:width,fit: BoxFit.cover,),
                            Positioned(top:height*0.1,left:width*0.02,
                                child:Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(height*0.01),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.verified_outlined,color: Colors.white,size: 15,),

                                          Text("Verified open",style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15
                                          ),),
                                        ],
                                      ),
                                      SizedBox(height: height*0.01,),
                                      RatingBar.builder(
                                          direction: Axis.horizontal,
                                          initialRating: 4.5,
                                          itemSize:20,
                                          allowHalfRating: true,
                                          itemBuilder: (context,i){
                                            return Icon(Icons.star,color: Colors.white,size: 10,);
                                          }, onRatingUpdate: (rating){

                                      }),
                                    ],
                                  ),
                                ),
                                SizedBox(width: width*0.3,),

                              ],
                            )),
                            Positioned(
                                top: height*0.2,

                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(sittingDataProvider.hotel[i].hotelname,style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              overflow: TextOverflow.clip,

                            ),),
                                    ],
                                  ),
                                )),
                            Positioned(
                                top: height*0.26,

                                child: Container(
                                  child: Row(
                                    children: [
                                      //Icon(Icons.edit_location,color: Colors.white,size: 20,),
                                      Text(sittingDataProvider.hotel[i].addres,
                                        maxLines: 2,

                                        style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,

                                      ),),
                                    ],
                                  ),
                                )),
                            Positioned(
                                top: height*0.32,


                                child: Container(
                                  child: Row(
                                    children: [
                                      Text("International",
                                        maxLines: 2,

                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis,

                                        ),),
                                      //Icon(Icons.price_change,color: Colors.white,size: 30,),

                                    ],
                                  ),
                                )),
                            Positioned(
                                top: height*0.31,
                                left: width*0.3,

                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(sittingDataProvider.hotel[i].price.toString(),
                                        maxLines: 2,

                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis,

                                        ),),
                                      Icon(Icons.price_change,color: Colors.white,size: 30,),

                                    ],
                                  ),
                                )),

                            Positioned(
                                top: height*0.29,
                                left: width*0.5,

                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Ccolors.appbarcolor,
                                        Colors.purple,
                                      ],
                                      tileMode: TileMode.clamp
                                    ),
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child: Row(
                                    children: [
                                      MaterialButton(
                                        onPressed: (){
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ReservationDetal(sittingDataProvider.hotel[i])));


                                        },
                                        child: Text("Reserve Now",
                                          maxLines: 2,

                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis,

                                          ),),
                                      ),
                                      //Icon(Icons.price_change,color: Colors.white,size: 30,),

                                    ],
                                  ),
                                ))

                          ],
                        ),


                ),
                    )),

              ),
            ],
          ),



      ),
    );
  }
  late SittingDataProvider sittingDataProvider;
  @override
  void initState() {
   sittingDataProvider=SittingDataProvider();

    super.initState();
  }
}


