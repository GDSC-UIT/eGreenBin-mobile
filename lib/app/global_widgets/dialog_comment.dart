import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiaLogComment extends StatefulWidget {
  final String title;
  final controler;
  final Function onSave;
  DiaLogComment({this.controler, required this.onSave, required this.title});

  @override
  State<DiaLogComment> createState() => _DiaLogCommentState();
}

class _DiaLogCommentState extends State<DiaLogComment> {
  bool isNull = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Container(
        height: 180,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(widget.title),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: widget.controler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "Add a new task",
              ),
              onChanged: (value) {
                setState(() {
                  if (value.trim() == "")
                    isNull = true;
                  else
                    isNull = false;
                });
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cacel"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent, // mau button
                      onPrimary: Colors.white, // mau chu
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: isNull
                        ? null
                        : () {
                            widget.onSave();
                            Navigator.of(context).pop();
                          },
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // mau button
                      onPrimary: Colors.white, // mau chu
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
