import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/httpdemo/service/WanAndroidRespository.dart';

class HttpDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HttpDemoState();
}

class HttpDemoState extends State<HttpDemo> {
  String bannerDataStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求测试'),
        leading: Icon(Icons.navigate_before),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              child: Text('点击获取网络数据並打印'),
              onPressed: _requestData,
            ),
            Text('网络数据是->$bannerDataStr')
          ],
        ),
      ),
    );
  }

  void _requestData() async {
    print("點擊獲取網絡數據");
    await WanAndroidRespository.fetchBanners()
        .then((data) => bannerDataStr = data.toString())
        .catchError((error) => {});
    setState(() {});
  }
}
