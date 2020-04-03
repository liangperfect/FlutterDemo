class LoginResultBean {
  LoginUserInfo loginUserInfo;

  LoginResultBean({this.loginUserInfo});

  LoginResultBean.fromJson(Map<String, dynamic> json) {
    loginUserInfo = json['LoginUserInfo'] != null
        ? new LoginUserInfo.fromJson(json['LoginUserInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginUserInfo != null) {
      data['LoginUserInfo'] = this.loginUserInfo.toJson();
    }
    return data;
  }
}

class LoginUserInfo {
  String token;
  int userId;
  String userName;
  int appUserType;
  int currEnterpriseId;
  int mainEnterpriseId;

  LoginUserInfo(
      {this.token,
      this.userId,
      this.userName,
      this.appUserType,
      this.currEnterpriseId,
      this.mainEnterpriseId});

  LoginUserInfo.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    userId = json['UserId'];
    userName = json['UserName'];
    appUserType = json['AppUserType'];
    currEnterpriseId = json['CurrEnterpriseId'];
    mainEnterpriseId = json['MainEnterpriseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['UserId'] = this.userId;
    data['UserName'] = this.userName;
    data['AppUserType'] = this.appUserType;
    data['CurrEnterpriseId'] = this.currEnterpriseId;
    data['MainEnterpriseId'] = this.mainEnterpriseId;
    return data;
  }
}
