import 'package:flutter/material.dart';
import 'package:lems/add_dis.dart';
import 'package:lems/home.dart';
import 'package:lems/profile.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class navi_bottom extends StatefulWidget {
  const navi_bottom({Key? key}) : super(key: key);

  @override
  State<navi_bottom> createState() => _navi_bottomState();
}

class _navi_bottomState extends State<navi_bottom> {
  List _children = [home(), profile()];
  var current_index = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: _children[current_index],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return add_dis();
              })));
            });
          },
          backgroundColor: Colors.amber,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          onTap: (index) {
            setState(() {
              // Icon(Icons.widgets, color: Colors.amber);
              current_index = index;
            });
          },
          backgroundColor: Colors.amber,
          activeColor: Colors.white,
          splashColor: Colors.white,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          activeIndex: current_index,
          icons: [Icons.home, Icons.person],
          // currentIndex: current_index,
          // items: [
          //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //   BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
          //   BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // ]),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        //   icons: [(Icons.search), (Icons.home), (Icons.person)],
        //   activeIndex: current_index,
        //   gapLocation: GapLocation.center,
        //   notchSmoothness: NotchSmoothness.verySmoothEdge,
        //   leftCornerRadius: 32,
        //   rightCornerRadius: 32,
        //   onTap: (index) {
        //     setState(() {
        //       current_index = index;
        //     });
        //   },

        //   // currentIndex: current_index,
        //   // items: [
        //   //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //   //   BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        //   // ]
        // ),
      ),
    );
  }
}
