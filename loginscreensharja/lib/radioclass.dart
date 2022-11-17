import 'package:flutter/cupertino.dart';

class OverAllSatisfaction {
  bool isSelected;
  final IconData iconData;
  final String text;
  OverAllSatisfaction(this.isSelected, this.iconData, this.text);
}

class CustomerService {
  bool isSelected;
  final IconData iconData;
  final String text;
  CustomerService(this.isSelected, this.iconData, this.text);
}

class QualityOfService {
  bool isSelected;
  final IconData iconData;
  final String text;
  QualityOfService(this.isSelected, this.iconData, this.text);
}

class ServiceIcon {
  bool isSelected;
  final IconData iconData;
  ServiceIcon(this.isSelected, this.iconData);
}
