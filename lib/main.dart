import 'package:flutter/material.dart';
import 'package:flutter_demo/calendar.dart';
import 'package:intl/intl.dart';

import 'entity/ECalendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: const Color(0xFFFAF2D3)),
      ),
      home:  CarouselPage(),
    );
  }
}

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}



class _CarouselPageState extends State<CarouselPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  int weekNumber = 0;

  /**
      January - Jan
      February - Feb
      March - Mar
      April - Apr
      May - May
      June - Jun
      July - Jul
      August - Aug
      September - Sep
      October - Oct
      November - Nov
      December - Dec
   **/
  List<Calendar> JanCalendar = [];
  List<Calendar> FebCalendar = [];
  List<Calendar> MarCalendar = [];
  List<Calendar> AprCalendar = [];
  List<Calendar> MayCalendar = [];
  List<Calendar> JunCalendar = [];
  List<Calendar> JulCalendar = [];
  List<Calendar> AugCalendar = [];
  List<Calendar> SepCalendar = [];
  List<Calendar> OctCalendar = [];
  List<Calendar> NovCalendar = [];
  List<Calendar> DecCalendar = [];



  @override
  void initState() {
    super.initState();
    // 获取当前月份，并设置初始页面
    DateTime currentDate = DateTime.now();
    print('Year: ${currentDate.year}');
    print('Month: ${currentDate.month}');
    print('Day: ${currentDate.day}');

    JanCalendar =  getWeekNumber(currentDate.year,1);
    FebCalendar =  getWeekNumber(currentDate.year,2);
    MarCalendar =  getWeekNumber(currentDate.year,3);
    AprCalendar =  getWeekNumber(currentDate.year,4);
    MayCalendar =  getWeekNumber(currentDate.year,5);
    JunCalendar =  getWeekNumber(currentDate.year,6);
    JulCalendar =  getWeekNumber(currentDate.year,7);
    AugCalendar =  getWeekNumber(currentDate.year,8);
    SepCalendar =  getWeekNumber(currentDate.year,9);
    OctCalendar =  getWeekNumber(currentDate.year,10);
    NovCalendar =  getWeekNumber(currentDate.year,11);
    DecCalendar =  getWeekNumber(currentDate.year,12);



    _currentPage = currentDate.month - 1;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image Carousel'),
      // ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xff1d362b),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          // Detect the direction of the swipe and update the current page accordingly
          if (details.primaryVelocity?.compareTo(0) == 1) {
            // Swiped from left to right
            if (_currentPage > 0) {
              setState(() {
                _currentPage--;
              });
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          } else {
            // Swiped from right to left
            if (_currentPage < 2) {
              setState(() {
                _currentPage++;
              });
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: PageView(
          controller: _pageController,
          children: [
            // Replace the container with your image widget
            MyCalendar(calendarData: JanCalendar),
            MyCalendar(calendarData: FebCalendar),
            MyCalendar(calendarData: MarCalendar),
            MyCalendar(calendarData: AprCalendar),
            MyCalendar(calendarData: MayCalendar),
            MyCalendar(calendarData: JunCalendar),
            MyCalendar(calendarData: JulCalendar),
            MyCalendar(calendarData: AugCalendar),
            MyCalendar(calendarData: SepCalendar),
            MyCalendar(calendarData: OctCalendar),
            MyCalendar(calendarData: NovCalendar),
            MyCalendar(calendarData: DecCalendar)
          ],
        ),
      ),
    );
  }

  static List<Calendar> getWeekNumber(int year, int month) {
    // 日历列表
    List<Calendar> calendarList = [];
    // 获取该月的总天数
    int totalDays = DateTime(year, month + 1, 0).day;
    // 输出每天的日期、星期几和是今年的第几周
    for (int day = 1; day <= totalDays; day++) {
      DateTime currentDate = DateTime(year, month, day);
      String weekday = DateFormat('EEEE').format(currentDate);
      // 计算是一年中的第几周
      int weekNumber = calculateISOWeekNumber(currentDate);
      // 初始化一个日历对象
      Calendar calendar = Calendar(year, month, day, weekNumber, weekday);
      // 加入到日历列表当中
      calendarList.add(calendar);
    }

    return calendarList;
  }

  static int calculateISOWeekNumber(DateTime date) {
    // Calculate the ISO week number based on the ISO-8601 standard
    int dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
    int isoWeekNumber = ((dayOfYear - date.weekday + 10) / 7).floor();

    if (isoWeekNumber < 1) {
      // Adjust the ISO week number for the previous year
      isoWeekNumber = calculateISOWeekNumber(DateTime(date.year - 1, 12, 31));
    } else if (isoWeekNumber > 52) {
      // Adjust the ISO week number for the next year
      isoWeekNumber = 1;
    }

    return isoWeekNumber;
  }

}
