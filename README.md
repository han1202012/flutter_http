# flutter_http

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




@[TOC]


<br>
<br>
<br>
<br>

# 一、引入 http 插件

---

<br>

到 [https://pub.dev/packages](https://pub.dev/packages) 搜索 http 组件 [https://pub.dev/packages/http](https://pub.dev/packages/http) ; 

**安装 http 插件 :** 参考 [https://pub.dev/packages/http/install](https://pub.dev/packages/http/install) 安装 ; 

**① 配置 Flutter 插件 :** 在 pubspec.yaml 配置文件中配置 Flutter 插件 : 

```cpp
dependencies:
  http: ^0.13.3
```

**② 获取 Flutter 插件 :** 点击右上角的 " Pub get " 按钮 , 获取插件 , 此时会自动从  [https://pub.dev/packages](https://pub.dev/packages) 平台下载该插件并配置到 Flutter 项目中 ; 

![在这里插入图片描述](https://img-blog.csdnimg.cn/178b63381bf0423381e97e5a62e15b1a.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBA6Z-p5puZ5Lqu,size_82,color_FFFFFF,t_70,g_se,x_16)


**③ 在项目中引入 :** 在需要使用 Banner 轮播插件 flutter_swiper 的组件代码中导入该 dart 包 ; 

```java
import 'package:http/http.dart' as http;
```



<br>
<br>
<br>
<br>

# 二、HTTP 请求测试数据 

---

<br>

**在网上找了几个 json 数据链接 :** 
 - [https://www.devio.org/io/flutter_app/json/test_common_model.json](https://www.devio.org/io/flutter_app/json/test_common_model.json)

```java
{
  "icon": "https://www.devio.org/io/flutter_app/img/ln_food.png",
  "title": "美食林",
  "url": "https://m.ctrip.com/webapp/you/foods/address.html?new=1&ishideheader=true",
  "statusBarColor": "19A0F0",
  "hideAppBar": true
}
```

 - [https://jsonplaceholder.typicode.com/posts/1](https://jsonplaceholder.typicode.com/posts/1)

```java
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
```

 - [https://jsonplaceholder.typicode.com/users/1/posts](https://jsonplaceholder.typicode.com/users/1/posts)
 - [https://jsonplaceholder.typicode.com/users/1/todos](https://jsonplaceholder.typicode.com/users/1/todos)
 - [https://jsonplaceholder.typicode.com/users/1/albums](https://jsonplaceholder.typicode.com/users/1/albums)
 - [https://jsonplaceholder.typicode.com/albums/1/photos](https://jsonplaceholder.typicode.com/albums/1/photos)
 - [https://jsonplaceholder.typicode.com/posts/1/comments](https://jsonplaceholder.typicode.com/posts/1/comments)







<br>
<br>
<br>
<br>

# 二、使用 http 插件进行 Get 请求

---

<br>

引入 http 插件后 , 

```java
import 'package:http/http.dart' as http;
```


调用 http.get 方法 , 发送 Get 请求 , 会返回一个包括 http.Response 泛型的 Future , 返回值类型为 Future<http.Response> ; 


```java
  /// 调用 Http Get 方法 , 获取服务器的 json 数据
  Future<CommonModel> httpGet() async {
    //var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var url = Uri.parse('https://www.devio.org/io/flutter_app/json/test_common_model.json');
    final response = await http.get(url);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    return CommonModel.fromJson(jsonMap);
  }
```

Future 是 异步操作 相关的核心 Dart 类 , 用于表示 将来 某个时间 可能出现的结果 ; 

http.Get 返回值是 Future<http.Response> , 其中的 http.Response 泛型中 , 封装了 HTTP Request 请求对应的 Response 响应数据 , 也就是服务器返回给请求端的数据 ; 




<br>
<br>
<br>
<br>

# 三、使用 http 插件进行 Post 请求

---

<br>



引入 http 插件后 , 

```java
import 'package:http/http.dart' as http;
```


调用 http.get 方法 , 发送 Get 请求 , 会返回一个包括 http.Response 泛型的 Future , 返回值类型为 Future<http.Response> ; 


```java
  /// 调用 Http Post 方法 , 获取服务器的 json 数据
  Future<CommonModel> httpPost() async {
    //var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var url = Uri.parse('https://www.devio.org/io/flutter_app/json/test_common_model.json');
    final response = await http.post(url);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    return CommonModel.fromJson(jsonMap);
  }
```

Future 是 异步操作 相关的核心 Dart 类 , 用于表示 将来 某个时间 可能出现的结果 ; 

http.Get 返回值是 Future<http.Response> , 其中的 http.Response 泛型中 , 封装了 HTTP Request 请求对应的 Response 响应数据 , 也就是服务器返回给请求端的数据 ; 




<br>
<br>
<br>
<br>

# 四、将 Get / Post 请求结果 Future<http.Response> 转为 Dart 对象

---

<br>


将 Get / Post 请求结果 Future<http.Response> 转为 Dart 对象 : 


创建 Model 类 , 用于存储获取的结果 , 参考 [https://jsonplaceholder.typicode.com/posts/1](https://jsonplaceholder.typicode.com/posts/1) 中的 json 数据创建 Dart 类 ; 

CommonModel 类包括一个工厂方法 , 通过 Map<String, dynamic> json 类型 , 构造该类 ; 

```java
class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

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
```

**将 http.Response 转换为 CommonModel 对象 :** 需要使用 dart:convert 包 , 将 json 字符串转为 Map<String, dynamic> 类型数据 ; 

```java
/// json 序列化 , 反序列化 包
import 'dart:convert';
```

然后将 Map<String, dynamic> 类型对象传入 CommonModel 类工厂方法 ; 






<br>
<br>
<br>
<br>

# 五、异步调用 

---

<br>

点击按钮后 , 调用 HTTP GET 方法 , 由于不知道什么时候返回 , 该方法肯定是一个异步方法 ; 

返回值是 Future 类型的 ; 


```java
  /// 调用 Http Get 方法 , 获取服务器的 json 数据
  Future<CommonModel> httpGet() async {
    //var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var url = Uri.parse('https://www.devio.org/io/flutter_app/json/test_common_model.json');
    final response = await http.get(url);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    return CommonModel.fromJson(jsonMap);
  }
```

下面是按钮设置的点击方法 : 

```java
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
```

**在按钮点击的时候 , 调用 httpGet() 方法 , 返回值是一个 Future 对象 ;** 

**调用 Future 的 then 方法 , 就会在网络请求成功后 , 执行该方法 , 也就是网络请求成功后 , 会自动调用该 then 方法 , 传入 Future 的泛型 CommonModel 对象作为参数 ;** 

最后获取到返回值后 , 将返回值设置到 httpGetResult 成员中 ; 

调用 setState 方法 , 更新 UI ; 




<br>
<br>
<br>
<br>

# 六、完整代码 

---

<br>


```java
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
```


**运行结果 :** 


![在这里插入图片描述](https://img-blog.csdnimg.cn/eccfbca6e5314697a84ce559e9aa8db3.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBA6Z-p5puZ5Lqu,size_22,color_FFFFFF,t_70,g_se,x_16)

















































































<br>
<br>
<br>
<br>

# 七、相关资源 

---

<br>


**参考资料 :** 
 - **Flutter 官网 :** [https://flutter.dev/](https://flutter.dev/) 
 - **Flutter 插件下载地址 :**  [https://pub.dev/packages](https://pub.dev/packages) 
 - **Flutter 开发文档 :** [https://flutter.cn/docs](https://flutter.cn/docs) **( 强烈推荐 )**
 - **官方 GitHub 地址** : [https://github.com/flutter](https://github.com/flutter)
 - **Flutter 中文社区 :** [https://flutter.cn/](https://flutter.cn/)
 - **Flutter 实用教程 :** [https://flutter.cn/docs/cookbook](https://flutter.cn/docs/cookbook)
 - **Flutter CodeLab :** [https://codelabs.flutter-io.cn/](https://codelabs.flutter-io.cn/)
 - **Dart 中文文档 :** [https://dart.cn/](https://dart.cn/)
 - **Dart 开发者官网 :** [https://api.dart.dev/](https://api.dart.dev/)
 - **Flutter 中文网 :** [https://flutterchina.club/](https://flutterchina.club/) , [http://flutter.axuer.com/docs/](http://flutter.axuer.com/docs/)
 - **Flutter 相关问题 :** [https://flutterchina.club/faq/](https://flutterchina.club/faq/) ( 入门阶段推荐看一遍 )
 - **GitHub 上的 Flutter 开源示例 :** [https://download.csdn.net/download/han1202012/15989510](https://download.csdn.net/download/han1202012/15989510)
 - **Flutter 实战电子书 :** [https://book.flutterchina.club/chapter1/](https://book.flutterchina.club/chapter1/)


<br>

**重要的专题 :** 
 - **Flutter 动画参考文档 :** [https://flutterchina.club/animations/](https://flutterchina.club/animations/)

<br>

**博客源码下载 :** 



 - **GitHub 地址 :** [https://github.com/han1202012/flutter_http](https://github.com/han1202012/flutter_http)( 随博客进度一直更新 , 有可能没有本博客的源码 )

 - **博客源码快照 :**  [https://download.csdn.net/download/han1202012/16311756](https://download.csdn.net/download/han1202012/16311756)  ( 本篇博客的源码快照 , 可以找到本博客的源码 )
