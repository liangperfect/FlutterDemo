import 'package:flutter_app/providerutil/view_state_refresh_list_model.dart';
import 'package:flutter_app/service/my_repository.dart';
import 'package:flutter_app/views/diodemo/DeviceSite.dart';

class DeviceViewModel extends ViewStateRefreshListModel<DeviceItem> {
  @override
  Future<List<DeviceItem>> loadData({int pageNum}) async {
    print('chenliang 数据请求');
    return await MyRepository.fetchDeviceList(pageNum, 10);
  }

  @override
  onCompleted(List<DeviceItem> data) {
    return super.onCompleted(data);
  }
}
