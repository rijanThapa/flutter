import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils.dart';
import 'package:flutter_application_1/datasource/get_data.dart';

class FakeProvider extends ChangeNotifier {
  Utils get getDataStatus=>_status;
  Utils  _status =Utils.idle;
  
  setStatus(Utils _status) {
    _status = _status;
    notifyListeners();
  }

  GetData getData = GetDataImpl();
String? errorMessage;
  List<dynamic> items = [];
  Future<void> fetchItems() async {
    if (_status != Utils.loading) {
      setStatus(Utils.loading);
    }
    try {
      final data = await getData.getData();
      items = data;
      setStatus(Utils.success);
    } catch (e) {
errorMessage=e.toString();
      setStatus(Utils.error);
    }
  }
}
