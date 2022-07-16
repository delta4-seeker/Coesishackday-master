import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lems/home.dart';
import 'package:lems/navi_bottom.dart';
import 'add_dis.dart';
// import 'package:cool_alert/cool_alert.dart';

class confirm extends StatefulWidget {
  final File? img;
  confirm(
    this.img,
  );

  @override
  State<confirm> createState() => _confirmState();
}

class _confirmState extends State<confirm> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.file(
                      widget.img!,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    // Text(
                    //   'Confirm',
                    //   style:
                    //       TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    // ),
                    discription(
                      detail: name,
                    ),
                    discription(
                      detail: price,
                    ),
                    discription(
                      detail: qty,
                    ),
                    discription(
                      detail: discrip,
                    ),
                  ],
                )),
                // height: 400,
                width: 390,
              ),
            ),
          ),
          SizedBox(
            height: 130,
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return navi_bottom();
                        })));
                      });
                      return _dialog(context);
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Confirm Submission',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            width: 50,
          )
        ],
      ),
    ));
  }

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          const Text("Confirmed"),
        ],
      )),
    );
  }
}
