import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipPathDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClipPathState();
}

class ClipPathState extends State<ClipPathDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipPath练习'),
      ),
      body: ClipPath(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff622F74),
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.deepOrangeAccent],
                      begin: Alignment.topRight,
                      end: Alignment(0, 0))),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 2.0),
                        color: Color(0xFFFFFFFF),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/pic.jpg'),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            )
          ],
        ),
        clipper: HeaderColor(),
      ),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 2 - 50);

    var p1 = Offset(size.width / 2, size.height / 2);
    var p2 = Offset(size.width, size.height / 2 - 50);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
