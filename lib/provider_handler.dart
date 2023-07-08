import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProviderHandler extends ChangeNotifier{

  PageController? pageController;
  List<DateTime> monthList = [];

  String userId = 'userid';
  DateTime selectedDate = DateTime.now();

  changeDate(DateTime dateTime){
    selectedDate = dateTime;

    pageController!.animateToPage(
        monthList.indexWhere((date) {
          return DateFormat("MM/yyyy").format(date) == DateFormat("MM/yyyy").format(dateTime);
        }),
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear
    );
    notifyListeners();
  }

  addFirstLastMonths(List<DateTime> data){
    monthList = data;
  }

  saveUserId(String user){
    userId = user;
    notifyListeners();
  }
}