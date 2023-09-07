class PatrolRevenueModel {
  
  String? txtCode;
  double? maxCharge;
  double? minCharge;
  String? classType;
  String? status;
  String? creationDate;
  String? txtName;
  String? txtArName;
  String? txtPhoneNumber;

  PatrolRevenueModel(
      {
      this.txtCode,
      this.maxCharge,
      this.minCharge,
      this.classType,
      this.status,
      this.creationDate,
      this.txtName,
      this.txtArName,
      this.txtPhoneNumber});

  PatrolRevenueModel.fromJson(Map<String, dynamic> patrolRevenue) {
   
    txtCode = patrolRevenue['txtCode'];
    maxCharge = patrolRevenue['maxCharge'];
    minCharge = patrolRevenue['minCharge'];
    classType = patrolRevenue['classType'];
    status = patrolRevenue['status'];
    creationDate = patrolRevenue['creationDate'];
    txtName = patrolRevenue['txtName'];
    txtArName = patrolRevenue['txtArName'];
    txtPhoneNumber = patrolRevenue['txtPhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> patrolRevenue = <String, dynamic>{};
   
 
    patrolRevenue['txtCode'] = txtCode;
    patrolRevenue['maxCharge'] = maxCharge;
    patrolRevenue['minCharge'] = minCharge;
    patrolRevenue['classType'] = classType;
    patrolRevenue['status'] = status;
    patrolRevenue['creationDate'] = creationDate;
    patrolRevenue['txtName'] = txtName;
    patrolRevenue['txtArName'] = txtArName;
    patrolRevenue['txtPhoneNumber'] = txtPhoneNumber;

    return patrolRevenue;
  }

  @override
  String toString() {
    return 'PatrolRevenueModel{ txtCode: $txtCode, maxCharge: $maxCharge, minCharge: $minCharge, classType: $classType, status: $status, creationDate: $creationDate, txtName: $txtName, txtArName: $txtArName, txtPhoneNumber: $txtPhoneNumber}';
  }
}
