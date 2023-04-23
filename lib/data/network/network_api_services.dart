
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;



class NetworkApiServices extends BaseApiServices{

 @override
  Future<dynamic> getApi(String url) async{

  if(kDebugMode){
   print(url);
  }
  dynamic responseJson;

  try{

   final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
   responseJson = returnResponse(response);


  }on SocketException{
   throw InternetException("");
  } on RequestTimeOut{
   throw RequestTimeOut("");
  }

  return responseJson;

 }

 Future<dynamic> postApi(var data ,String url) async{

  if(kDebugMode){
   print(url);
   print(data);

  }
  dynamic responseJson;

  try{

   final response = await http.post(Uri.parse(url),
    //data in raw form
    //body: jsonEncode(data)

    //data not in raw form
    body: data

   ).timeout(const Duration(seconds: 10));
   responseJson = returnResponse(response);


  }on SocketException{
   throw InternetException("");
  } on RequestTimeOut{
   throw RequestTimeOut("");
  }
  if (kDebugMode) {
    print(responseJson);
  }
  return responseJson;

 }



 dynamic returnResponse(http.Response response){

  switch(response.statusCode){

   case 200:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;

    case 400:
     dynamic responseJson = jsonDecode(response.body);
     return responseJson;

    default:
     throw FetchDataException("Connect with server for communication" +response.statusCode.toString());

  }

 }

}