import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider_handler.dart';

class MonthBuilder extends StatefulWidget {
  const MonthBuilder({Key? key}) : super(key: key);

  @override
  State<MonthBuilder> createState() => _MonthBuilderState();
}
class _MonthBuilderState extends State<MonthBuilder> {

  int currentMonth = 0;

  DateTime lastDay = DateTime(2025,12,12);
  DateTime firstDay = DateTime(2022,01,01);

  List<DateTime> monthList = [];

  @override
  void initState() {
    getMonths().then((_){
      setState(() {
        Provider.of<ProviderHandler>(context, listen: false).pageController = PageController(
            initialPage: currentMonth,
            viewportFraction: .26
        );
      });
    });
    super.initState();
  }
  getMonths() async {
    DateTime tempDate = firstDay;

    while (tempDate.isBefore(lastDay)) {
      setState(() {
        monthList.add(tempDate);
      });
      tempDate = DateTime(tempDate.year, tempDate.month + 1,tempDate.day);
    }
    currentMonth = monthList.indexWhere((date){
      return DateFormat("MM/yyyy").format(date) == DateFormat("MM/yyyy").format(
        DateTime.now()
      );
    });
    Provider.of<ProviderHandler>(context, listen: false).addFirstLastMonths(monthList);
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return context.watch<ProviderHandler>().pageController != null ?
    Container(
      height: 40,
      width: width,
      alignment: Alignment.center,
      child: PageView.builder(
          controller: context.watch<ProviderHandler>().pageController,
          itemCount: monthList.length,
          onPageChanged: (newIndex){
            setState(()=> currentMonth = newIndex);
          },
          itemBuilder: (context, index){
            return TextButton(
                onPressed: (){
                  context.read<ProviderHandler>().changeDate(
                    DateTime(
                        monthList[index].year,
                        monthList[index].month,
                        Provider.of<ProviderHandler>(context, listen: false).selectedDate.day
                    )
                  );
                },
                child: Text(
                  DateFormat("yyyy").format(monthList[index])
                      == DateFormat("yyyy").format(DateTime.now()) ?
                  DateFormat("MMMM").format(monthList[index]) :
                  DateFormat("MMM yyyy").format(monthList[index]),
                  style: currentMonth == index ?
                  GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900]
                  ):
                  GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[400]
                  ),
                )
            );
          }
      ),
    ) :
    Text(
      DateFormat("MMMM").format(DateTime.now()),
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),
    );
  }
}

/**
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  CalendarScreenState createState() => CalendarScreenState();
}
class CalendarScreenState extends State<CalendarScreen> {

  DateTime selectedDate = DateTime.now();
  int currentMonth = 0;

  DateTime lastDay = DateTime(2025,12,12);
  DateTime firstDay = DateTime(2022,01,01);

  List<DateTime> monthList = [];

  getMonths() async {
    DateTime tempDate = firstDay;

    while (tempDate.isBefore(lastDay)) {
      setState(() {
        monthList.add(tempDate);
      });
      tempDate = DateTime(tempDate.year, tempDate.month + 1,tempDate.day);
    }
    setState(() {
      currentMonth = monthList.indexWhere((date){
        return DateFormat("MM/yyyy").format(date) == DateFormat("MM/yyyy").format(
            DateTime.now()
        );
      });
    });
    Provider.of<ProviderHandler>(context, listen: false).addFirstLastMonths(monthList);
  }

  @override
  void initState() {
    getMonths();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        height: height,
        width: width,
        color: Colors.amberAccent,
        child: PageView.builder(
          scrollDirection: Axis.vertical,

          itemCount: Provider.of<ProviderHandler>(context, listen: false).monthList.length,
          controller: PageController(
            viewportFraction: .5,
            initialPage: currentMonth
          ),
          itemBuilder: (context, index) {

            DateTime focusedDate = selectedDate.add( Duration(days: 30*index));

            return IgnorePointer(
              ignoring: true,
              child: ListView.builder(
                itemCount: 12, // Number of months to display
                itemBuilder: (context, index) {
                  DateTime initialMonth = DateTime.now().add(Duration(days: 30*index));
                  return TableCalendar(
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                    ),
                    availableGestures: AvailableGestures.horizontalSwipe,
                    focusedDay: focusedDate,
                    lastDay: lastDay,
                    firstDay: firstDay,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }


}
**/