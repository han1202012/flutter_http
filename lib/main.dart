import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// json 序列化 , 反序列化 包
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /// HTTP GET 返回值
  String httpGetResult = "";

  /// 调用 Http Get 方法 , 获取服务器的 json 数据
  Future<CommonModel> httpGet() async {
    //var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var url = Uri.parse('https://www.devio.org/io/flutter_app/json/test_common_model.json');
    final response = await http.get(url);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    return CommonModel.fromJson(jsonMap);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: Text("HTTP Get 请求"),
        ),

        // 线性布局 列
        body: Column(
          children: [

            // 按钮
            InkWell(
              child: Text("点击按钮进行 HTTP GET 请求"),

              onTap: (){
                /// httpGet() 方法返回 Future 类型返回值
                ///   调用 Future 的 then 方法 , 就会在网络请求成功后 , 执行该方法
                ///   也就是网络请求成功后 , 会自动调用该 then 方法
                ///   传入 Future 的泛型 CommonModel 对象作为参数
                httpGet().then((CommonModel value) {
                  // httpGet 异步返回时 , 回调该方法
                  setState(() {
                    httpGetResult =
                      "HTTP GET 请求结果 :\nuserId : ${value.icon}\n" +
                          "title : ${value.title}\nurl : ${value.url}";
                  });
                });
              },
            ),


            // 在该 Text 组件显示 HTTP GET 请求结果
            Text(httpGetResult),

          ],
        ),
      ),
    );
  }
}

class CommonModel {
  final String? icon;
  final String? title;
  final String? url;
  final String? statusBarColor;
  final bool? hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}