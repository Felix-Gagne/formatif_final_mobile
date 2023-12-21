

import 'package:dio/dio.dart';
import 'package:question_2/transfert.dart';

var baseUrl = "http://10.0.2.2:8080/";

class SingletonDio {
  static Dio getDio(){
    Dio dio = Dio();
    return dio;
  }
}

Future<int> PlusGrand(RequetePlusGrand req) async{

  try{
    var response = await SingletonDio.getDio().post(baseUrl + "examen/plusgrand/", data: req);
    print(response);
    return response.data;
  }
  catch(e){
    print(e);
    throw(e);
  }

}