import 'package:crudapp/Screen/prodductgridviewscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestApiClient/clientrespose.dart';
import '../Style/style.dart';

class productcreatscreen extends StatefulWidget {

  @override
  State<productcreatscreen> createState() => _productcreatscreenState();
}


class _productcreatscreenState extends State<productcreatscreen> {
  Map<String,String> formvalue={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  bool loadding=false;
  Inputonchange(Textkey,textvalue){
    setState(() {
      formvalue.update(Textkey, (value) => textvalue);
    });


  }
  formonsubmit() async{
    if(formvalue['Img']!.length==0){
      errortoast("Image link Required");

    }
    else if(formvalue['ProductCode']!.length==0){
      errortoast("Product Code Required");

    }
    else if(formvalue['ProductName']!.length==0){
      errortoast("Product Name Required");

    }
    else if(formvalue['Qty']!.length==0){
      errortoast("Product Quantity Required");

    }
    else if(formvalue['TotalPrice']!.length==0){
      errortoast("Totall Price Required");

    }
    else if(formvalue['UnitPrice']!.length==0){
      errortoast("Unit Price Required");

    }
    else{
      setState(() {
        loadding=true;
      });
      await productcreaterequest(formvalue);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=>Productgribview()),
              (Route route) => false);

      setState(() {
        loadding=false;
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product"),
      ),
      body: Stack(

        children: [
          screenbackground(context),
          Container(
            child:loadding?(Center(child:CircularProgressIndicator(),)):( (SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(


                    onChanged: (textvalue){Inputonchange("Img",textvalue);
                    },
                    decoration: inputfieldDecoration("Product Image"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (textvalue){Inputonchange("ProductCode",textvalue);},
                    decoration: inputfieldDecoration("Product Code"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (textvalue){Inputonchange("ProductName",textvalue);},

                    decoration: inputfieldDecoration("Product Name"),

                  ),
                  SizedBox(height: 20,),
                  Boxstyle(
                      DropdownButton(
                        value:formvalue["Qty"],
                        items:[
                          DropdownMenuItem(child: Text("Select Quantity"),value:"",),
                          DropdownMenuItem(child: Text("1 PC"),value: '1 pc',),
                          DropdownMenuItem(child: Text("2 PC"),value: '2 pc',),
                          DropdownMenuItem(child: Text("3 PC"),value: '3 pc',),
                          DropdownMenuItem(child: Text("4 PC"),value: '4 pc',),
                        ],
                        onChanged:(textvalue){
                          Inputonchange("Qty",textvalue);
                        },
                        underline: Container(),
                        isExpanded: true,

                      )
                  ),
                  SizedBox(height: 20,),
                  TextFormField(

                    onChanged: (textvalue){Inputonchange("TotalPrice",textvalue);},
                    decoration: inputfieldDecoration("Totall Price"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(onChanged: (textvalue){Inputonchange("UnitPrice",textvalue);},
                    decoration: inputfieldDecoration("Product Price"),


                  ),

                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style:buttonStyle(),
                      onPressed: (){
                        formonsubmit();
                      },
                      child: successbutton("Submit"),
                    ),
                  )

                ],
              ),
            )))
          )
        ],
      ),
    );
  }
}
