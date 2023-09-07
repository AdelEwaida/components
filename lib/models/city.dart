class CityModel {
  String? txtCode;
  String? txtName;

  CityModel({this.txtCode, this.txtName});

  CityModel.fromJson(Map<String, dynamic> json) {
    txtCode = json['txtCode'];
    txtName = json['txtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txtCode'] = this.txtCode;
    data['txtName'] = this.txtName;
    return data;
  }
}