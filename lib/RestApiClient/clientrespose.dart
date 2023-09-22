
import 'dart:convert';
import 'package:crudapp/Style/style.dart';
import 'package:http/http.dart'as http;

Future<List>ProductGridviewscreen() async {
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader={"Content-Type":"application/json"};
  var Responce=await http.get(URL,headers: PostHeader);
  var ResponceCode=Responce.statusCode;
  var ResultBody=json.decode(Responce.body);
  if(ResponceCode==200 && ResultBody['status']=="success"){
    successtoast("Request success");
    return ResultBody['data'];
  }
  else{
    errortoast("Request failed");
    return [];
  }
}


Future<bool> productcreaterequest(formvalue) async{
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody=json.encode(formvalue);
  var PostHeader={"Content-Type":"application/json"};
  var responce=await http.post(URL,headers: PostHeader,body: PostBody);
  var ResponceCode=responce.statusCode;
  var ResponceBody=json.decode(responce.body);

  if( ResponceCode==200 && ResponceBody['status']=="success"){
    successtoast("Request Successfull");
    return true;
  }
  else{
    errortoast("Request failed! Try again");
    return false;

  }

}
Future<bool> productdeleteReq(id) async{
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var PostHeader={"Content-Type":"application/json"};
  var responce=await http.get(URL,headers: PostHeader);
  var ResponceCode=responce.statusCode;
  var ResponceBody=json.decode(responce.body);

  if( ResponceCode==200 && ResponceBody['status']=="success"){
    successtoast("Request Successfull");
    return true;
  }
  else{
    errortoast("Request failed! Try again");
    return false;

  }
}


Future<bool> productupdaterequest(formvalue,id)async{
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var PostBody=json.encode(formvalue);
  var PostHeader={"Content-Type":"application/json"};
  var responce=await http.post(URL,headers: PostHeader,body: PostBody);
  var ResponceCode=responce.statusCode;
  var ResponceBody=json.decode(responce.body);

  if( ResponceCode==200 && ResponceBody['status']=="success"){
    successtoast("Request Successfull");
    return true;
  }
  else{
    errortoast("Request failed! Try again");
    return false;

  }

}
