import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/Authenication/SignUp.dart';
import 'package:untitled/Constants/Colors.dart';
import 'package:untitled/Model/SittingData.dart';
class ReservationDetal extends StatefulWidget {
 final SittingData sittingData;
ReservationDetal(this.sittingData);
  @override
  _ReservationDetalState createState() => _ReservationDetalState();
}

class _ReservationDetalState extends State<ReservationDetal> {
  late double width;
  late double height;
  bool select=true;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 5,right:10),
          child: Row(
            children: [
              Icon(Icons.restaurant,size: 40,color: Colors.white,),
              SizedBox(width:width*0.02 ,),
              Text(
               widget.sittingData.hotelname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Ccolors.appbarcolor,
                Colors.purple,
              ],
              tileMode: TileMode.clamp
            )
          ),
          padding: EdgeInsets.only(left: 20,right: 20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.receipt_outlined,size: 25,color: Colors.white,),
                  SizedBox(width: width*0.02,),
                  Text("Date of Reservation",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis
                  ),
                  )


                ],
              ),
              Container(

                child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 10, 16,),
                    lastDay: DateTime.utc(2030, 10, 15),
                   headerStyle: HeaderStyle(
                     titleTextStyle: TextStyle(
                       color: Colors.white
                     ),

                   ),

                   daysOfWeekStyle: DaysOfWeekStyle(
                     weekdayStyle: TextStyle(
                       color: Colors.white
                     ),

                   ),

                   calendarStyle:CalendarStyle(
                     outsideTextStyle: TextStyle(
                       color: Colors.white
                     ),
                     holidayTextStyle: TextStyle(
                       color: Colors.white
                     ),


                     weekendTextStyle: TextStyle(
                       color: Colors.green,
                       fontSize: 15
                     ),
                     todayDecoration: BoxDecoration(
                       color: Colors.green,
                       borderRadius: BorderRadius.circular(10)
                     ),

                     todayTextStyle: TextStyle(
                       color: Colors.white,
                       fontSize: 18
                     ),
                     selectedDecoration:BoxDecoration(
                       color: Colors.green
                     ) ,
                     defaultDecoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10)
                     ),
                     holidayDecoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                   ) ,


                ),
              ),
              Row(
                children: [
                  Icon(Icons.person,color: Colors.white,size: 25,),
                  SizedBox(width: width*0.02,),
                  Text("Numbers OF Guests",style: TextStyle(fontSize: 20,color: Colors.white),)
                ],
              ),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.1,
                width: width,
                child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,i)=>GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                          select=!select;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 05, 30, 5),
                        margin: EdgeInsets.symmetric(horizontal: height*0.005,vertical:width*0.01 ),
                        decoration: BoxDecoration(
                          color: select?Colors.green:Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(i.toString(),style: TextStyle(
                              color: select?Colors.white:Colors.black,
                              fontSize: 20
                            ),),
                            //SizedBox(width: width*0.01,)
                          ],
                        ),


                      ),
                    ), separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        //color: Colors.purple,
                      );
                },),
              ),

              Row(
                children: [
                  Icon(IconData(0xe800,fontFamily: 'Schyler'),
                    size: 45,
                    color: Colors.white,
                  ),
                  SizedBox(width: width*0.02,),
                  Text("Select Table",style: TextStyle(fontSize: 20,color: Colors.white),)
                ],
              ),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.1,
                width: width,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,i)=>GestureDetector(
                    onTap: (){
                      setState(() {

                        select=!select;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 05, 30, 5),
                      margin: EdgeInsets.symmetric(horizontal: height*0.005,vertical:width*0.01 ),
                      decoration: BoxDecoration(
                        color: select?Colors.green:Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text("Table M"+i.toString(),style: TextStyle(
                              color: select?Colors.white:Colors.black,
                              fontSize: 20
                          ),),
                          //SizedBox(width: width*0.01,)
                        ],
                      ),


                    ),
                  ), separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    //color: Colors.purple,
                  );
                },),
              )



            ],
          ),
        ),
      ),
    );
  }
}
