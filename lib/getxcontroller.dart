import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_dio_post/model.dart';

import 'dio.dart';

class PostController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_confirmController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  RegisterPostModel? registerPostModel;
  List<RegisterPostModel> list = [];
  DateTime? dateTime = DateTime.now();


  Future<RegisterPostModel?> addData() async {
    registerPostModel = (await DioFunction().postData(
        registerPostModel: RegisterPostModel(
            data: Data(
                name: nameController.text,
                email: emailController.text,
                gender: genderController.text,
                birthDate: dateTime,
                password: passwordController.text,
                password_confirmation: password_confirmController.text))));
    list.add(registerPostModel!);
    update();
    return registerPostModel;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
