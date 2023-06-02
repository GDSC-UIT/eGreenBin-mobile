import 'dart:developer';
import 'dart:io';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/utils/snackbar.dart';
import 'package:egreenbin/app/data/enums/sortType.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:egreenbin/app/data/repositories/student_repository.dart';
import 'package:egreenbin/app/data/repositories/teacher_repository.dart';
import 'package:egreenbin/app/data/services/upload_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/repositories/garbage_repository.dart';
import '../../data/services/device_service.dart';
import '../../data/services/firebase_service.dart';
import '../../data/services/sort_service.dart';
import '../../routes/app_routes.dart';
import 'package:egreenbin/app/data/repositories/comment_repository.dart';

class HomeController extends GetxController {
  // data models
  Rx<Teacher> teacher = Teacher(
    name: "Default",
    code: '00000000',
  ).obs;
  // repository
  final repoStudent = StudentRepository();
  final repoComment = CommentRepository();
  final repoGarbage = GarbageRepository();
  final repoTeacher = TeacherRepository();
  // class value
  RxInt numberOfStudent = 0.obs;
  // sort box
  Rx<SortService>? sortService;

  HomeController() {
    sortService = SortService(
      updateSort: fnull,
    ).obs;
  }

  @override
  void onInit() async {
    // get data
    await refreshData();
    super.onInit();
  }

  // function
  Function fnull = () {
    // this is fake function
    // this fuction will do nothing
  };

  void pushToMailScreen() {
    Get.toNamed(AppRoutes.mail, arguments: teacher.value);
  }

  void pushToStudentInfoScreen(String id) {
    Get.toNamed(AppRoutes.studentInfo, arguments: id);
  }

  void pushToNotificationScreen() {
    Get.toNamed(AppRoutes.notification, arguments: teacher.value);
  }

  RxBool isLoading = false.obs;
  Future refreshData() async {
    try {
      // loading
      isLoading.value = true;
      await fetchData();
      // get length of student
      numberOfStudent.value = DataCenter.instance.students.length;
      // get teacher
      teacher.value = repoTeacher.getTeacherByIndex(0);
      // loading off
      isLoading.value = false;
    } catch (error) {
      log("Error when fetch data: $error");
      showSnackBarAndNotification(
        "Error",
        "Error when fetch data: $error",
        AppColors.wrong,
      );
    }
  }

  /// get all data when begin
  Future<void> fetchData() async {
    await Future.wait([
      // fetch student
      repoStudent.fetchStudents(),
      // fetch comments
      repoComment.fetchComments(),
      // fetch garbages
      //repoGarbage.fetchGarbages(),
      // fetch teacher
      repoTeacher.fetchTeachers(),
    ]);
  }

  // fuction of sort
  void filterByAll() {}
  void filterByDate() {}
  void filterByYear() {}
  void filterByMonth() {}

  // this is add student function
  final formKey = GlobalKey<FormState>(); // key of form add student

  File? imageStudentLeft; // file image of student
  File? imageStudentCenter; // file image of student
  File? imageStudentRight; // file image of student
  String code = "";
  String name = "";
  String parentEmail = "";

  void cancelImages() {
    imageStudentLeft = null;
    imageStudentCenter = null;
    imageStudentRight = null;
  }

  /// get image from camera
  Future<void> getImageFromCamera(FaceType type) async {
    final image = await DeviceService.pickImage(ImageSource.camera);
    if (image == null) return;
    if (type == FaceType.Left) {
      imageStudentLeft = image;
    } else if (type == FaceType.Center) {
      imageStudentCenter = image;
    } else {
      imageStudentRight = image;
    }
    Get.back();
  }

  /// get image from gallery
  Future<void> getImageFromGallery(FaceType type) async {
    final image = await DeviceService.pickImage(ImageSource.gallery);
    if (image == null) return;
    if (type == FaceType.Left) {
      imageStudentLeft = image;
    } else if (type == FaceType.Center) {
      imageStudentCenter = image;
    } else {
      imageStudentRight = image;
    }
    Get.back();
  }

  /// try submit a new student
  Future trySubmitAddStudent() async {
    final isValid = formKey.currentState!.validate();

    if (imageStudentLeft == null ||
        imageStudentCenter == null ||
        imageStudentRight == null) {
      // show snackbar
      showSnackBarAndNotification(
        "Error",
        "Please pick an image",
        AppColors.wrong,
      );
      return;
    }

    if (isValid) {
      formKey.currentState!.save();
      // submit
      List<File> imagesStudent = [
        imageStudentLeft!,
        imageStudentCenter!,
        imageStudentRight!,
      ];
      await submitAddStudent(imagesStudent);
      // delete file
      cancelImages();
    }
  }

  Future<void> submitAddStudent(List<File> imageFiles) async {
    try {
      //loading
      // list image url
      String imageUrl;
      // upload file to firebase
      String urlImage = await FireBaseService.uploadFile(imageFiles[1]);
      // get link image
      print(urlImage);
      imageUrl = urlImage;
      // create new student
      Student newStudent = Student(
        code: code.trim(),
        name: name.trim(),
        parentEmail: parentEmail.trim(),
        imageAvatarUrl: imageUrl,
        numOfCorrect: 0,
        numOfWrong: 0,
        note: "",
      );
      // post student
      Student addedStudent = await repoStudent.addStudent(newStudent);
      // upload to AI server
      await uploadImageToAiServer(addedStudent, imageFiles);
      // catch error
    } catch (error) {
      print("Error when submit student: $error");
      showSnackBarAndNotification(
        "Error",
        "Error when submit student: $error",
        AppColors.wrong,
      );
    }
  }

  Future<void> uploadImageToAiServer(
      Student student, List<File> imageFiles) async {
    // rename file image
    List<String> fileNames = [];
    for (int i = 0; i < imageFiles.length; i++) {
      String fileName = "${student.code}_${student.name}_${i + 1}";
      fileNames.add(fileName);
      print(fileName);
    }
    //File newFileImage = await changeFileNameOnly(imageFile, fileName);
    // upload to server
    await UploadService.uploadImagesToAiServer(imageFiles, fileNames);
  }

  Future<File> changeFileNameOnly(File file, String newFileName) async {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }
}
