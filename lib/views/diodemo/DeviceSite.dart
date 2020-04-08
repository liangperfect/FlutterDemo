class DeviceSite {
  int pageIndex;
  int pageSiz;
  int totalCount;
  List<DeviceItem> rows;

  DeviceSite({this.pageIndex, this.pageSiz, this.totalCount, this.rows});

  DeviceSite.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    pageSiz = json['pageSiz'];
    totalCount = json['totalCount'];
    if (json['rows'] != null) {
      rows = new List<DeviceItem>();
      json['rows'].forEach((v) {
        rows.add(new DeviceItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = this.pageIndex;
    data['pageSiz'] = this.pageSiz;
    data['totalCount'] = this.totalCount;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeviceItem {
  String id;
  int mainEnterpriseId;
  int currEnterpriseId;
  String currEnterpriseName;
  String deviceId;
  Null gatewayId;
  Null macId;
  String equipmentName;
  String equipmentCate;
  Null mainData;
  int event;
  int state;
  int hState;
  String stateName;
  String gatewayName;
  Null networkStatusName;
  Null reason;
  bool isFireEquip;
  String qRCode;
  String equipCode;
  String buildId;
  String buildName;
  String floor;
  String floorName;
  Null floorPlanUrl;
  String installationSite;
  Null installationTime;
  Null validityTime;
  int systemId;
  String systemName;
  int manufacturer;
  Null manufacturerName;
  int networkingWay;
  String networkingWayName;
  int equipmentType;
  Null equipmentTypeName;
  int equipmentBrank;
  Null equipmentBrankName;
  Null equipHelpTextUrl;
  Null afterSalesEnterprise;
  Null afterSalesPersonnel;
  Null afterSalesPhone;
  Null salesPersonnelId;
  Null salesPersonnelName;
  Null projectLeader;
  Null projectLeaderPhone;
  Null equipPerson;
  Null equipPersonPhone;
  Null memo;
  String cDate;
  String uDate;
  Null cUser;
  Null sort;
  Null alarmInterval;
  bool isAlarm;
  String isAlarmName;
  bool isShielded;
  int locationType;
  String location;
  Null enterprisePlanURL;
  bool isZj;
  int isIndoor;
  Null area;
  Null areaName;
  String equipmentImgUrl;
  bool synchState;
  int dbCode;

  DeviceItem(
      {this.id,
      this.mainEnterpriseId,
      this.currEnterpriseId,
      this.currEnterpriseName,
      this.deviceId,
      this.gatewayId,
      this.macId,
      this.equipmentName,
      this.equipmentCate,
      this.mainData,
      this.event,
      this.state,
      this.hState,
      this.stateName,
      this.gatewayName,
      this.networkStatusName,
      this.reason,
      this.isFireEquip,
      this.qRCode,
      this.equipCode,
      this.buildId,
      this.buildName,
      this.floor,
      this.floorName,
      this.floorPlanUrl,
      this.installationSite,
      this.installationTime,
      this.validityTime,
      this.systemId,
      this.systemName,
      this.manufacturer,
      this.manufacturerName,
      this.networkingWay,
      this.networkingWayName,
      this.equipmentType,
      this.equipmentTypeName,
      this.equipmentBrank,
      this.equipmentBrankName,
      this.equipHelpTextUrl,
      this.afterSalesEnterprise,
      this.afterSalesPersonnel,
      this.afterSalesPhone,
      this.salesPersonnelId,
      this.salesPersonnelName,
      this.projectLeader,
      this.projectLeaderPhone,
      this.equipPerson,
      this.equipPersonPhone,
      this.memo,
      this.cDate,
      this.uDate,
      this.cUser,
      this.sort,
      this.alarmInterval,
      this.isAlarm,
      this.isAlarmName,
      this.isShielded,
      this.locationType,
      this.location,
      this.enterprisePlanURL,
      this.isZj,
      this.isIndoor,
      this.area,
      this.areaName,
      this.equipmentImgUrl,
      this.synchState,
      this.dbCode});

  DeviceItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    mainEnterpriseId = json['MainEnterpriseId'];
    currEnterpriseId = json['CurrEnterpriseId'];
    currEnterpriseName = json['CurrEnterpriseName'];
    deviceId = json['DeviceId'];
    gatewayId = json['GatewayId'];
    macId = json['MacId'];
    equipmentName = json['EquipmentName'];
    equipmentCate = json['EquipmentCate'];
    mainData = json['MainData'];
    event = json['Event'];
    state = json['State'];
    hState = json['HState'];
    stateName = json['StateName'];
    gatewayName = json['GatewayName'];
    networkStatusName = json['NetworkStatusName'];
    reason = json['Reason'];
    isFireEquip = json['IsFireEquip'];
    qRCode = json['QRCode'];
    equipCode = json['EquipCode'];
    buildId = json['BuildId'];
    buildName = json['BuildName'];
    floor = json['Floor'];
    floorName = json['FloorName'];
    floorPlanUrl = json['FloorPlanUrl'];
    installationSite = json['InstallationSite'];
    installationTime = json['InstallationTime'];
    validityTime = json['ValidityTime'];
    systemId = json['SystemId'];
    systemName = json['SystemName'];
    manufacturer = json['Manufacturer'];
    manufacturerName = json['ManufacturerName'];
    networkingWay = json['NetworkingWay'];
    networkingWayName = json['NetworkingWayName'];
    equipmentType = json['EquipmentType'];
    equipmentTypeName = json['EquipmentTypeName'];
    equipmentBrank = json['EquipmentBrank'];
    equipmentBrankName = json['EquipmentBrankName'];
    equipHelpTextUrl = json['EquipHelpTextUrl'];
    afterSalesEnterprise = json['AfterSalesEnterprise'];
    afterSalesPersonnel = json['AfterSalesPersonnel'];
    afterSalesPhone = json['AfterSalesPhone'];
    salesPersonnelId = json['SalesPersonnelId'];
    salesPersonnelName = json['SalesPersonnelName'];
    projectLeader = json['ProjectLeader'];
    projectLeaderPhone = json['ProjectLeaderPhone'];
    equipPerson = json['EquipPerson'];
    equipPersonPhone = json['EquipPersonPhone'];
    memo = json['Memo'];
    cDate = json['CDate'];
    uDate = json['UDate'];
    cUser = json['CUser'];
    sort = json['Sort'];
    alarmInterval = json['AlarmInterval'];
    isAlarm = json['IsAlarm'];
    isAlarmName = json['IsAlarmName'];
    isShielded = json['IsShielded'];
    locationType = json['LocationType'];
    location = json['Location'];
    enterprisePlanURL = json['EnterprisePlanURL'];
    isZj = json['IsZj'];
    isIndoor = json['IsIndoor'];
    area = json['Area'];
    areaName = json['AreaName'];
    equipmentImgUrl = json['EquipmentImgUrl'];
    synchState = json['SynchState'];
    dbCode = json['dbCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['MainEnterpriseId'] = this.mainEnterpriseId;
    data['CurrEnterpriseId'] = this.currEnterpriseId;
    data['CurrEnterpriseName'] = this.currEnterpriseName;
    data['DeviceId'] = this.deviceId;
    data['GatewayId'] = this.gatewayId;
    data['MacId'] = this.macId;
    data['EquipmentName'] = this.equipmentName;
    data['EquipmentCate'] = this.equipmentCate;
    data['MainData'] = this.mainData;
    data['Event'] = this.event;
    data['State'] = this.state;
    data['HState'] = this.hState;
    data['StateName'] = this.stateName;
    data['GatewayName'] = this.gatewayName;
    data['NetworkStatusName'] = this.networkStatusName;
    data['Reason'] = this.reason;
    data['IsFireEquip'] = this.isFireEquip;
    data['QRCode'] = this.qRCode;
    data['EquipCode'] = this.equipCode;
    data['BuildId'] = this.buildId;
    data['BuildName'] = this.buildName;
    data['Floor'] = this.floor;
    data['FloorName'] = this.floorName;
    data['FloorPlanUrl'] = this.floorPlanUrl;
    data['InstallationSite'] = this.installationSite;
    data['InstallationTime'] = this.installationTime;
    data['ValidityTime'] = this.validityTime;
    data['SystemId'] = this.systemId;
    data['SystemName'] = this.systemName;
    data['Manufacturer'] = this.manufacturer;
    data['ManufacturerName'] = this.manufacturerName;
    data['NetworkingWay'] = this.networkingWay;
    data['NetworkingWayName'] = this.networkingWayName;
    data['EquipmentType'] = this.equipmentType;
    data['EquipmentTypeName'] = this.equipmentTypeName;
    data['EquipmentBrank'] = this.equipmentBrank;
    data['EquipmentBrankName'] = this.equipmentBrankName;
    data['EquipHelpTextUrl'] = this.equipHelpTextUrl;
    data['AfterSalesEnterprise'] = this.afterSalesEnterprise;
    data['AfterSalesPersonnel'] = this.afterSalesPersonnel;
    data['AfterSalesPhone'] = this.afterSalesPhone;
    data['SalesPersonnelId'] = this.salesPersonnelId;
    data['SalesPersonnelName'] = this.salesPersonnelName;
    data['ProjectLeader'] = this.projectLeader;
    data['ProjectLeaderPhone'] = this.projectLeaderPhone;
    data['EquipPerson'] = this.equipPerson;
    data['EquipPersonPhone'] = this.equipPersonPhone;
    data['Memo'] = this.memo;
    data['CDate'] = this.cDate;
    data['UDate'] = this.uDate;
    data['CUser'] = this.cUser;
    data['Sort'] = this.sort;
    data['AlarmInterval'] = this.alarmInterval;
    data['IsAlarm'] = this.isAlarm;
    data['IsAlarmName'] = this.isAlarmName;
    data['IsShielded'] = this.isShielded;
    data['LocationType'] = this.locationType;
    data['Location'] = this.location;
    data['EnterprisePlanURL'] = this.enterprisePlanURL;
    data['IsZj'] = this.isZj;
    data['IsIndoor'] = this.isIndoor;
    data['Area'] = this.area;
    data['AreaName'] = this.areaName;
    data['EquipmentImgUrl'] = this.equipmentImgUrl;
    data['SynchState'] = this.synchState;
    data['dbCode'] = this.dbCode;
    return data;
  }
}
