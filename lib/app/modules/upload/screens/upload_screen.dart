import 'package:egreenbin/app/data/models/student.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final String studentApi = "https://egreenbin.onrender.com/api/students";

  Future<List<Student>> fetchStudent() async {
    final response = await http.get(Uri.parse(studentApi));

    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();

      return parsed.map<Student>((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load student');
    }
  }

  late Future<List<Student>> futureStudent;
  @override
  void initState() {
    super.initState();
    futureStudent = fetchStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Student>>(
          future: futureStudent,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff97FFFF),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].name}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("${snapshot.data![index].numOfCorrect}"),
                      Text("${snapshot.data![index].numOfWrong}"),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
