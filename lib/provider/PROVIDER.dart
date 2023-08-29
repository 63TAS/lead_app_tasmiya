import 'package:flutter/material.dart';

class FilterPage extends ChangeNotifier{
  String  selectedcaegory = '';



  //
  void updateFilter(String newcategory){
    selectedcaegory = newcategory;
notifyListeners(); 
 
  }
}
