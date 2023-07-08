import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/app_colours.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../calendar_builder/day_tile.dart';
import '../calendar_builder/month_builder.dart';
import '../provider_handler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController controller = PageController();

  double iconSize = 18;
  DateTime selectedDate = DateTime.now();
  final DateTime lastDay = DateTime(2025,12,12);
  final DateTime firstDay = DateTime(2022,01,01);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: AppColors().appLight,
      body: PageView(
        controller: controller,
        onPageChanged: (index){},
        children: [
          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: [
                SizedBox(height: height*.08),
                const MonthBuilder(),
                const SizedBox(height: 15),

                Consumer<ProviderHandler>(
                    builder: (ctx, value, child){
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: height*.08,
                        width: width,
                        child: TableCalendar(
                          onDaySelected: (date, events) {
                            setState(() {
                              selectedDate = date;
                              context.read<ProviderHandler>().changeDate(date);
                            });
                          },
                          onPageChanged: (date){
                            setState(() {
                              selectedDate = date;
                              context.read<ProviderHandler>().changeDate(date);
                            });
                          },
                          headerVisible: false,
                          daysOfWeekVisible : false,
                          weekNumbersVisible: false,
                          rowHeight: height*.08,
                          daysOfWeekStyle:  DaysOfWeekStyle(
                            weekdayStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            weekendStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          calendarBuilders: CalendarBuilders(
                            outsideBuilder: (context, date, events) {
                              return DayTile(date: date);
                            },
                            todayBuilder: (context, date, events) {
                              return DayTile(date: date);
                            },
                            defaultBuilder: (context, date, events) {
                              return DayTile(date: date);
                            },
                            selectedBuilder: (context, date, events) {
                              return  DayTile(date: date);
                            },
                          ),
                          selectedDayPredicate: (date) {
                            return isSameDay(date, selectedDate);
                          },
                          focusedDay: value.selectedDate,
                          calendarFormat: CalendarFormat.week,
                          lastDay: lastDay,
                          firstDay: firstDay,
                        ),
                      );
                    }
                ),
                const SizedBox(height: 10),

              ],
            ),
          ),
          SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height*.1,
                  width: width*.9,
                  decoration: BoxDecoration(
                    color: AppColors().appPink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor:  AppColors().appPink,
        backgroundColor: AppColors().appLight,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: AppColors().appPurple,
          fontSize: 10
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.grey[400],
            fontSize: 10
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
                Icons.home_rounded,
                size: iconSize,
                color: AppColors().appPink,
            ),
            icon: Icon(
                Icons.home_rounded,
                size: iconSize,
                color: Colors.grey[400]
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
                Icons.water_drop,
              size: iconSize,
                color: AppColors().appPink,
            ),
            icon: Icon(
                Icons.water_drop,
                size: iconSize,
                color: Colors.grey[400]
            ),
            label: 'My Cycle',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.female_rounded,
              size: iconSize,
              color: AppColors().appPink,
            ),
            icon: Icon(
                Icons.female_sharp,
                size: iconSize,
                color: Colors.grey[400]
            ),
            label: 'My Sisters',
          ),
        ],
        currentIndex: pageIndex,
        onTap: (index)=> changePageIndex(index),
      ),
    );
  }
  int pageIndex = 0;
  changePageIndex(int index){
    setState(()=> pageIndex = index);
    controller.jumpToPage(index);
  }
}
