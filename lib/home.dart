import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: (Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(
              fontFamily: 'Oswald',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        drawer: Container(
          color: Colors.white,
          width: 200,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(0)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                    width: 370,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'New Request',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.amber, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // leading: Text(' Std_Name'),
                          title: Text('student_name'),
                          subtitle: Text('Event Name'),
                          trailing: Text('Mon 27 June'),
                        ),
                      );
                    }))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
