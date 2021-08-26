class School {
  /// json 字符串中 school 字段
  final String? school;

  /// json 字符串中的 students 数组
  final List<Student>? students;

  School({this.school, this.students});

  /// 构造方法有两种写法
  /// 参数不是 final 类型的 , 就使用这种方式编写
  /// 方法前不需要添加 factory
  /// 如果成员是 final 类型的 , 那么方法前需要加入 factory
  factory School.fromJson(Map<String, dynamic> json) {
    String school = json['school'];

    /// 先将 json 数组转为 List
    /// 然后调用 map 方法 获取每个值
    List<Student> students = (json['students'] as List).map((i) => Student.fromJson(i)).toList();

    return School(school: school, students: students);
  }
}

class Student {
  final String? name;
  final String? age;

  Student({this.name, this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String age = json['age'];

    return Student(name: name, age: age);
  }
}