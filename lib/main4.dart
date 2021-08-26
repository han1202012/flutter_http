class School {
  /// json 字符串中 school 字段
  String? school;

  /// json 字符串中的 students 数组
  List<Student>? students;

  School({this.school, this.students});

  /// 构造方法有两种写法
  /// 参数不是 final 类型的 , 就使用这种方式编写
  /// 方法前不需要添加 factory
  /// 如果成员是 final 类型的 , 那么方法前需要加入 factory
  School.fromJson(Map<String, dynamic> json) {
    school = json['school'];

    /// 先将 json 数组转为 List
    /// 然后调用 map 方法 , 为具体的每个元素赋值
    (json['students'] as List).map((i) => Student.fromJson(i));
  }
}

class Student {
  String? name;
  String? age;

  Student({this.name, this.age});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }
}