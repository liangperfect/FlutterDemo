import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MixinsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MixinsDemo测试'),
        leading: Icon(Icons.airport_shuttle),
      ),
      body: MixinsTest(),
    );
  }
}

class MixinsTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MixinsState();
}

class _MixinsState extends State<MixinsTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Mixin测试'),
              onPressed: _exe,
            ),
          ],
        ));
  }

  void _exe() {
    B b = B();
    B1 b1 = B1();
    B2 b2 = B2();
    C1 c1 = C1();
    C2 c2 = C2();

    b.a();
    b1.a();
    b2.a();
    c1.a();
    c2.a();

    setState(() {});
  }
}

//
class A {
  String name;
  void a() {
    print('A');
  }

  void a1() {
    print('A1');
  }
}

class A1 {
  void a() {
    print('A1');
  }
}

class B with A, A1 {}

class B1 with A1, A {}

class B2 with A, A1 {
  void a() {
    print('B2');
  }
}

class C {
  void a() {
    print('C');
  }
}

class C1 extends C with A, A1 {}

class C2 extends C with A, A1 {
  void a() {
    print('C2');
  }
}

class C3 implements A {
  @override
  void a() {
  }

  @override
  String name;

  @override
  void a1() {

  }

}
