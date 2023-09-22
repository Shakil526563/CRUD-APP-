import 'package:crudapp/Screen/productscreen.dart';
import 'package:crudapp/Screen/productupdatescreen.dart';
import 'package:crudapp/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../RestApiClient/clientrespose.dart';

class Productgribview extends StatefulWidget {

  const Productgribview({Key? key}) : super(key: key);

  @override
  State<Productgribview> createState() => _ProductgribviewState();
}

class _ProductgribviewState extends State<Productgribview> {
  var productlist=[];
  bool isLooding=true;

  @override
  void initState(){
    calldata();
    super.initState();


  }


  calldata() async{
    isLooding=true;
    var data=await ProductGridviewscreen();
    setState(() {
      productlist=data;
      isLooding=false;
    });
  }
  Deleteitem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Do you want to delete"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      isLooding=true;
                    });
                    await productdeleteReq(id);
                    await calldata();


                  },
                  child: Text("Yes")),

              OutlinedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],

          );




        }
    );

  }
  gotoupdate(context,productlist){
    Navigator.push(context,MaterialPageRoute(builder: (builder)=>productupdatescreen(productlist)));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD APP"),),
      body: Stack(
        children: [
          screenbackground(context),
          Container(
            child: isLooding?(Center(child:CircularProgressIndicator())):RefreshIndicator(
              onRefresh: () async{
                await calldata();
            },

            child:GridView.builder(
                gridDelegate: productgridviewstyle(),
                itemCount: productlist.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: Image.network(productlist[index]['Img'],fit: BoxFit.fill,)),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 8, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productlist[index]['ProductName']),
                              SizedBox(height: 2,),
                              Text("Price: "+ productlist[index]["UnitPrice"]+" BDT"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(onPressed: (){
                                    gotoupdate(context,productlist[index]);

                                  },
                                      child: Icon(CupertinoIcons.ellipsis_vertical_circle_fill,size: 15,color: Colors.green,)
                                  ),
                                  SizedBox(width: 5,),
                                  OutlinedButton(onPressed: (){
                                    Deleteitem(productlist[index]['_id']);
                                  },
                                      child: Icon(CupertinoIcons.delete_simple,size: 15,color: Colors.red,)
                                  )
                                ],
                              )

                            ],
                          ),

                        )
                      ],

                    ),
                  );
                }

            )
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (builder)=>productcreatscreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
