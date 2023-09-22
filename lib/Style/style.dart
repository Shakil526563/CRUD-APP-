import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const redcolor=Color.fromRGBO(231, 28, 36, 1);
const greencolor=Color.fromRGBO(33, 191, 115, 1);
const whitecolor=Color.fromRGBO(255, 255, 255, 1);
const darkbluecolor=Color.fromRGBO(44, 62, 80, 1);

void errortoast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
SliverGridDelegateWithFixedCrossAxisCount productgridviewstyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(

      crossAxisCount: 2,
    mainAxisSpacing: 3,
    mainAxisExtent: 250,

  );

}
void successtoast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

SvgPicture screenbackground(context){
  return SvgPicture.asset(
    "Assets/images/feather-1689331.svg",
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );


}





InputDecoration inputfieldDecoration(label){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greencolor,width: 1),
    ),
    fillColor: Colors.black12,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(color: whitecolor,width: 1),
    ),
    border: OutlineInputBorder(),
    labelText: label,

  );
}

DecoratedBox Boxstyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: whitecolor,width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    child: child,
  );
}

ButtonStyle buttonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  );
}
Ink successbutton(buttontext){
  return Ink(
    decoration: BoxDecoration(
      color:greencolor,
      borderRadius: BorderRadius.circular(10),


    ),
    child: Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(buttontext,style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),),
    ),
  );
}