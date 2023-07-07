import 'dart:math';
import 'package:egreenbin/app/data/models/result_cell.dart';
import '../providers/data_center.dart';

class ResultCellRepository {
  List<String> garbageNames = [
    "Paper",
    "Metal",
    "Plastic",
    "Food",
    "Inox",
    "Carton",
    "Nilon",
    "Glass",
    "Rubber",
    "Battery",
    "Fabric",
    "Paper",
    "Can",
    "Oil",
  ];

  int getRandomNumber() {
    return Random().nextInt(10) + 1;
  }

  List<ResultCell> getAllResultCell() {
    List<ResultCell> resultCells = [
      // generate for child 1
      for (int i = 1; i <= 13; i++)
        ResultCell(
          id: i.toString(),
          idStudent: "641e5150aa89e403a668410d",
          name: garbageNames[i],
          right: getRandomNumber(),
          wrong: getRandomNumber(),
        ),
      // generate for child 2
      for (int i = 1; i <= 8; i++)
        ResultCell(
          id: (i + 10).toString(),
          idStudent: "641e5172aa89e403a668410e",
          name: garbageNames[i],
          right: getRandomNumber(),
          wrong: getRandomNumber(),
        ),
      // generate for child 1
      for (int i = 1; i <= 8; i++)
        ResultCell(
          id: (i + 20).toString(),
          idStudent: "641e51c5aa89e403a668410f",
          name: garbageNames[i],
          right: getRandomNumber(),
          wrong: getRandomNumber(),
        ),
    ];
    DataCenter.instance.resultCells.value = [...resultCells];
    return resultCells;
  }

  List<ResultCell> getResultCellsById(String idStudent) {
    List<ResultCell> resultCells = [];
    for (var cell in DataCenter.instance.resultCells) {
      if (cell.idStudent == idStudent) resultCells.add(cell);
    }
    return resultCells;
  }
}
