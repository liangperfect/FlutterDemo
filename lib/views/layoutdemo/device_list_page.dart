import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providerutil/provider_widget.dart';
import 'package:flutter_app/view_model/articles_view_model.dart';
import 'package:flutter_app/views/config/route_manager.dart';
import 'package:flutter_app/views/diodemo/DeviceSite.dart';
import 'package:flutter_app/views/layoutdemo/view_state_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DeviceListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DevcieListState();
}

class DevcieListState extends State<DeviceListPage> {
  @override
  Widget build(BuildContext context) {
    print("build函数");

    return ProviderWidget<DeviceViewModel>(
      model: DeviceViewModel(),
      builder: (BuildContext context, model, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('获取设备列表'),
          ),
          body: ProviderWidget<DeviceViewModel>(
            onModelReady: (model) => model.initData(),
            model: DeviceViewModel(),
            builder: (_, model, child) {
              if (model.busy) {
                return CircularProgressIndicator();
              } else if (model.error && model.list.isEmpty) {
                //出现了异常，包括网络异常以及接口返回的异常
                print('请求的异常1111: ${model.viewStateError.message}');
                print('请求的异常2222: ${model.viewStateError.errorMessage}');
                print('请求的异常3333: ${model.viewStateError.errorType}');
                return ViewStateErrorWidget(
                  error: model.viewStateError,
                  onPressed: () {
                    model.initData();
                  },
                );
//              return Text('请求异常');
              } else if (model.empty) {
                return ViewStateEmptyWidget(
                  onPressed: () {
                    model.initData();
                  },
                );
              }

              return SmartRefresher(
                controller: model.refreshController,
                header: MaterialClassicHeader(),
                footer: RefresherFooter(),
                onRefresh: model.refresh,
                onLoading: model.loadMore,
                enablePullUp: true,
                child: ListView.builder(
                  itemExtent: 100,
                  itemCount: model.list.length,
                  itemBuilder: (_, index) {
                    DeviceItem deviceItem = model.list[index];
                    return InkWell(
                      child: Card(
                        child: Container(
                          child: Center(
                            child: Text(deviceItem.currEnterpriseName),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouterName.formtestdemo);
                      },
                    );
                  },
                  shrinkWrap: true,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class RefresherFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      failedText: "加载失败",
      idleText: "idle",
      loadingText: "加载中...",
      noDataText: "没有更多数据",
    );
  }
}
