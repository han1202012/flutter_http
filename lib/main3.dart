import 'dart:convert';

void main() {
  String jsonString = '{ "icon": "icon.png", "title": "标题", "url": "https://www.baidu.com/", "statusBarColor": "FFFFFF", "hideAppBar": true }';

  /// 处理中文乱码
  Utf8Codec utf8codec = Utf8Codec();
  Utf8Decoder utf8decoder = Utf8Decoder();
  Utf8Encoder utf8encoder = Utf8Encoder();

  /// 将二进制 Byte 数据以 UTF-8 格式编码 , 获取编码后的字符串
  String responseString = utf8decoder.convert(utf8codec.encode(jsonString));

  // 将 json 字符串信息转为 Map<String, dynamic> 类型的键值对信息
  Map<String, dynamic> jsonMap = json.decode(responseString);

  // 使用工厂方法构造 Dart 对象
  CommonModel commonModel = CommonModel.fromJson(jsonMap);

  print('icon : ${commonModel.icon}\ntittle : ${commonModel.title}\nurl : ${commonModel.url}');
}

// Dart 模型类
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