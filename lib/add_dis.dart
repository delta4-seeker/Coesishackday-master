import 'package:flutter/material.dart';
import 'package:lems/camera_gallery.dart';

class add_dis extends StatefulWidget {
  const add_dis({Key? key}) : super(key: key);

  @override
  State<add_dis> createState() => _add_disState();
}

class _add_disState extends State<add_dis> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController qty_controller = TextEditingController();
  TextEditingController discrip_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Component',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Form',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 1, 39, 70),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        discription(
                          detail: 'Name',
                          controller: name_controller,
                        ),
                        discription(
                          detail: 'Price',
                          controller: price_controller,
                        ),
                        discription(
                          detail: 'Qty',
                          controller: qty_controller,
                        ),
                        discription(
                          detail: 'Description',
                          controller: discrip_controller,
                        ),
                      ],
                    )),
                    height: 400,
                    width: 390,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 50, vertical: 20),
                              // textStyle: TextStyle(
                              //     fontSize: 30, fontWeight: FontWeight.bold)),
                            ),
                            onPressed: () {
                              setState(() {
                                name = name_controller.text;
                                price = price_controller.text;
                                qty = qty_controller.text;
                                discrip = discrip_controller.text;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return camera_gallery();
                                }));
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'Save and add image',
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                height: 50,
                width: 180,
              )
            ],
          ),
        ),
      ),
    );
  }
}

var name;
var price;
var qty;
var discrip;

class discription extends StatelessWidget {
  final String? detail;
  final controller;

  discription({this.detail, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('${detail}:'),
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: '$detail',
              ),
            ),
            width: 250,
          ),
        ],
      )),
    );
  }
}
