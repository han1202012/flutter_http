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
    // 异步请求 , 获取远程服务器信息
    final response = await http.get(url);

    /// 处理中文乱码
    Utf8Decoder utf8decoder = Utf8Decoder();
    /// 将二进制 Byte 数据以 UTF-8 格式编码 , 获取编码后的字符串
    String responseString = utf8decoder.convert(response.bodyBytes);

    // 将 json 字符串信息转为 Map<String, dynamic> 类型的键值对信息
    Map<String, dynamic> jsonMap = json.decode(responseString);
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
        body: FutureBuilder<CommonModel>(
          // 设置异步调用的方法
          future: httpGet(),

          /// 接收如下类型的对象
          /// typedef AsyncWidgetBuilder<T> = Widget Function(BuildContext context, AsyncSnapshot<T> snapshot);
          builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot){
            /// 判断 AsyncSnapshot 的连接状态
            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Text("未连接");

              case ConnectionState.waiting:
                /// 返回一个进度条
                return Center(child: CircularProgressIndicator(),);

              case ConnectionState.active:
                /// 激活状态 , 返回一个进度条
                return Text("");

              case ConnectionState.done:
                /// 请求结束 , 如果出现错误 , 则返回错误信息
                /// 如果请求成功 , 返回从网络中请求的数据
                if(snapshot.hasError) {
                  return Text("请求失败 , 报错信息 : ${snapshot.error}", style: TextStyle(color: Colors.red),);
                } else {
                  return Text("请求成功 , 获取信息 : ${snapshot.data?.url}", style: TextStyle(color: Colors.green),);
                }

            }
          },
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