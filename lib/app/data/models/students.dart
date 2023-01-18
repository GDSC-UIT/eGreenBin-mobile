import 'package:egreenbin/app/data/models/student.dart';

class Students {
  List<Student> listStudents = [
    Student(
      id: "21522345",
      name: "Nguyễn Thành Trung",
      numOfCorrect: 92,
      numOfWrong: 50,
    ),
    Student(
      id: "21522321",
      name: "Lê Xuân Quỳnh",
      numOfCorrect: 90,
      numOfWrong: 30,
      parentEmail: "test@gmail.com",
    ),
    Student(
      id: "21522343",
      name: "Nguyễn Công Tấn Phát",
      numOfCorrect: 20,
      numOfWrong: 99,
    ),
    Student(
      id: "21522000",
      name: "Nguyễn Hữu Hiệu",
      numOfCorrect: 50,
      numOfWrong: 10,
    ),
    Student(
      id: "21525455",
      name: "Ngô Thu Hà",
      numOfCorrect: 5,
      numOfWrong: 1,
    ),
    Student(
      id: "21522455",
      name: "Cao Minh Quân",
      numOfCorrect: 5,
      numOfWrong: 1,
    ),
    Student(
      id: "21520345",
      name: "Phan Văn Minh",
      numOfCorrect: 100,
      numOfWrong: 0,
    ),
    Student(
      id: "21521345",
      name: "Tiến deptraicaotohocgioi",
      numOfCorrect: 0,
      numOfWrong: 100,
    ),
  ];

  Student findStudent(String id) {
    Student studentFind = Student(
      id: "null",
      name: "Default",
      numOfCorrect: 0,
      numOfWrong: 0,
    );
    for (var student in listStudents) {
      if (student.id == id) studentFind = student;
    }
    return studentFind;
  }
}
