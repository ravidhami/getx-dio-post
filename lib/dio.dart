import 'package:dio/dio.dart';
import 'model.dart';

class DioFunction{

/*  Future<PostModel>fetchData()async{
    var url = 'https://139.59.79.228/flutter-api/public/api/register';
    try{
      Response response = await Dio().get(url);
      PostModel user = PostModel.fromJson(response.data);
      return user;
    }catch(e){
      throw e.toString();
    }

  }*/

  Future<RegisterPostModel?> postData({RegisterPostModel? registerPostModel})async{
    var url = 'https://139.59.79.228/flutter-api/public/api/register';
    try{
      Response response = await Dio().post(url,data:registerPostModel!.data);
      if(response.statusCode==200){
        var result = RegisterPostModel.fromJson(response.data);
        return result;
      }else
        {
          throw Exception("Eroor=====>");
        }
    }catch(e){
      throw e.toString();
    }
  }

}