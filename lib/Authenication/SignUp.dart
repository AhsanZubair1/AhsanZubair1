import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Constants/Colors.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 late double height;
 late double width;
 late FocusNode _focusNode;
 FocusNode _namefocusNode=new FocusNode();
 FocusNode _mailfocusNode=new FocusNode();
 FocusNode _passwordfocusNode=new FocusNode();
 @override
  void initState() {
    // TODO: implement initState
   _focusNode=new FocusNode();
   _focusNode.addListener(() {
     _focusNode.nextFocus();
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;


    return Scaffold(
     body: SingleChildScrollView(
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Ccolors.appbarcolor,
               Colors.purple,
             ],
             tileMode: TileMode.clamp
           ),

         ),
         child:Column(
          // mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(height:height*0.15),
             Center(child: Image.asset("Assets/tlogo.png",color: Colors.white,)),
             SizedBox(height:height*0.02),
             textfeild("Name", _namefocusNode,_mailfocusNode),
             textfeild("Email", _mailfocusNode,_passwordfocusNode),
             textfeild("Password",_passwordfocusNode,_namefocusNode)






           ],
         ),

        ),
     ),
    );
  }
  Widget textfeild(String hint,FocusNode focusNode,FocusNode nextfocus){
   return
     Container(
       margin: EdgeInsets.only(left: width*0.1,top: height*0.01,right: width*0.1,bottom: height*0.01),

       padding: EdgeInsets.only(left:height*0.02,top: height*0.001,),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         border : Border.all(color: Colors.white,width: 2,style: BorderStyle.solid),
       ),
       child: TextFormField(
         focusNode: focusNode,
         style: TextStyle(
             color: Colors.white
         ),
         decoration: InputDecoration(
             hintText: hint,
             hintStyle: TextStyle(
               color: Colors.white,
               fontSize: 15,

             ),

             border: InputBorder.none
         ),
         onFieldSubmitted: (v){
           FocusScope.of(context).requestFocus(_mailfocusNode);
         },



       ),
     );
  }
}
