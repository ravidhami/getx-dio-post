import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_post/getxcontroller.dart';
import 'package:getx_dio_post/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Api"),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title:"Add Data",
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                              hintText: "Name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                              hintText: "password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controller.password_confirmController,
                          decoration: InputDecoration(
                              hintText: "confirm password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              )
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controller.genderController,
                          decoration: InputDecoration(
                              hintText: "gender",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: (){
                          Get.back();
                        },
                        child: Text("Cancle")
                    ),
                    TextButton(
                        onPressed: (){
                          controller.addData();
                        },
                        child: Text("Add")
                    ),
                  ]
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GetBuilder<PostController>(
        init: PostController(),
        builder: (controller) {
          return controller.registerPostModel==null?Text("No data"):FutureBuilder<RegisterPostModel?>(
            future: controller.addData(),
            builder: (context,snapShot) {
              return ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (ctr, index) {
                        return ListTile(
                          title: Text(controller.list[index].data!.name!),
                        );
                      });
            }
          );
        },
      ),
    );
  }
}
