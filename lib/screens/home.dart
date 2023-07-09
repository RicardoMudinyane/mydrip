import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/app_colours.dart';
import 'package:mydrip/screens/contraceptives.dart';
import 'package:mydrip/screens/forumHome.dart';
import 'package:mydrip/screens/my_cycle.dart';
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors().appLight,
        title: Text(
          'MyDrip'.toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 14,
            letterSpacing: 1.2,
            color:  Colors.pink,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index){
          setState(()=> pageIndex = index);
        },
        children: [
          Consumer<ProviderHandler>(
              builder: (ctx, value, child){
                return SizedBox(
                  width: screenSize.width,
                  height: screenSize.height,
                  child: Column(
                    children: [
                      SizedBox(height: height*.02),
                      const MonthBuilder(),
                      const SizedBox(height: 15),
                      Container(
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
                      ),

                      const SizedBox(height: 10),
                      Expanded(
                          child: Center(
                            child: value.myContraception == null ?
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child:  Text(
                                  'Pro-tip: No type of contraception prevents pregnancy or sexually transmitted diseases (STDs) '
                                      '100% of the time. For better protection from pregnancy, '
                                      'many couples use condoms along with another method of birth control\n',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none
                                  )
                              ),
                            )  :
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: width*.9,
                                    height: height*.3,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Stack(
                                      children: [

                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: width*.8,
                                              height: height*.18,
                                              clipBehavior: Clip.hardEdge,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                color: AppColors().appPurple,
                                                borderRadius: BorderRadius.circular(15),
                                              ),

                                              child: Stack(
                                                children: [

                                                  Positioned(
                                                      right: -height*.045,
                                                      child: Container(
                                                        width: height*.15,
                                                        height: height*.15,
                                                        decoration: const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.white12
                                                        ),
                                                      )
                                                  ),

                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: width*.025,),
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                  text: 'Contraception coming in\n',
                                                                  style: GoogleFonts.poppins(
                                                                    color: Colors.white70,
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w400,
                                                                  )
                                                              ),
                                                              TextSpan(
                                                                  text: '3 Weeks',
                                                                  style: GoogleFonts.poppins(
                                                                    fontSize: 18,
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w700,
                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                          textAlign: TextAlign.start,
                                                        ),
                                                      )
                                                  ),
                                                  Align(
                                                      alignment: Alignment.bottomLeft,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(width*.025,),
                                                        child: Text(
                                                            value.myContraception!.name ?? '',
                                                            style: GoogleFonts.poppins(
                                                              fontSize: 12,
                                                              color: Colors.white30,
                                                              fontStyle: FontStyle.italic,
                                                              fontWeight: FontWeight.w600,
                                                            )
                                                        ),
                                                      )
                                                  ),
                                                ],
                                              )
                                          ),
                                        ),
                                        Positioned(
                                          right: -width*.035,
                                          top: width*.02,
                                          child: Image.asset(
                                            'assets/3dCalendar.png',
                                            width: width*.3,
                                            height: width*.3,
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                SizedBox(height: height*.01),
                                Container(
                                  width: width*.9,
                                  height: height*.08,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      'Find a hospital/clinic',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                    leading: const Icon(
                                      Icons.local_hospital_rounded,
                                      color: Colors.lightBlue,
                                    ),
                                  )
                                )
                              ],
                            )
                          )
                      )

                    ],
                  ),
                );
              }
          ),

          const MyCycle(),
          ForumHome(),
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
