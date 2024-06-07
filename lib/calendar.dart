import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_demo/entity/DayObj.dart';

import 'entity/ECalendar.dart';



class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key,required this.calendarData});

  final List<Calendar> calendarData;

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}


class _MyCalendarState extends State<MyCalendar> {

  // 'Mon','Tue','Wed','Thu','Fri','Sat','Sun'
  String engMonthName = '';
  List<DayObj> header = [
    DayObj('w', '', '', Colors.green, 16.0, FontWeight.w500),
    DayObj('Mon', '', '', Colors.brown, 19.0, FontWeight.w700),
    DayObj('Tue', '', '', Colors.brown, 19.0, FontWeight.w700),
    DayObj('Wed', '', '', Colors.brown, 19.0, FontWeight.w700),
    DayObj('Thu', '', '', Colors.brown, 19.0, FontWeight.w700),
    DayObj('Fri', '', '', Colors.brown, 19.0, FontWeight.w700),
    DayObj('Sat', '', '', Colors.brown, 19.0, FontWeight.w700),
    DayObj('Sun', '', '', Colors.brown, 19.0, FontWeight.w700)
  ];
  List<DayObj> firstWeekList = [];
  List<DayObj> secondWeekList = [];
  List<DayObj> thirdWeekList = [];
  List<DayObj> fourthWeekList = [];
  List<DayObj> fifthWeekList = [];
  List<DayObj> sixthWeekList = [];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMonthName(widget.calendarData[0].month);
    getUniqueWeekList(widget.calendarData);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(engMonthName,style: const TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF12372A),
      ),
      // body: Container(color: Colors.blue, child: Center(child: Text('月份 ${widget.calendarData[0].month}'))),
      body:SingleChildScrollView(
        child:         Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.calendarData[0].month.toString(),style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 36.0),),
                  Text(engMonthName,style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.w400, fontSize: 24.0),),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: GridView.count(
                  crossAxisCount: 8,
                  children: List.generate(56, (index) {
                    if (index < 8) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(header[index].calendarDay,style: TextStyle(color: header[index].color,fontSize: header[index].fontSize,fontWeight: header[index].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    } else if (index >= 8 && index < 16) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(firstWeekList[index-8].calendarDay,style: TextStyle(color: firstWeekList[index-8].color,fontSize: firstWeekList[index-8].fontSize,fontWeight: firstWeekList[index-8].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    } else if (index >= 16 && index < 24) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(secondWeekList[index-16].calendarDay,style: TextStyle(color: secondWeekList[index-16].color,fontSize: secondWeekList[index-16].fontSize,fontWeight: secondWeekList[index-16].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    } else if (index >= 24 && index < 32) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(thirdWeekList[index-24].calendarDay,style: TextStyle(color: thirdWeekList[index-24].color,fontSize: thirdWeekList[index-24].fontSize,fontWeight: thirdWeekList[index-24].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    } else if (index >= 32 && index < 40) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(fourthWeekList[index-32].calendarDay,style: TextStyle(color: fourthWeekList[index-32].color,fontSize: fourthWeekList[index-32].fontSize,fontWeight: fourthWeekList[index-32].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    } else if (index >= 40 && index < 48) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(fifthWeekList[index-40].calendarDay,style: TextStyle(color: fifthWeekList[index-40].color,fontSize: fifthWeekList[index-40].fontSize,fontWeight: fifthWeekList[index-40].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    }  else if (index >= 48 && index < 56) { // 对于前八个单元格
                      return Container(
                        child: Center(
                          child: Text(sixthWeekList[index-48].calendarDay,style: TextStyle(color: sixthWeekList[index-48].color,fontSize: sixthWeekList[index-48].fontSize,fontWeight: sixthWeekList[index-48].fontWeight),), // 将此处替换为固定的文本内容
                        ),
                      );
                    }  else {
                      return Container(
                        child: Center(
                          child: Text('It $index'),
                        ),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),),
      )
    );

  }


  void getMonthName(int monthNumber) {

    switch (monthNumber) {
      case 1:
        engMonthName = 'January';
        break;
      case 2:
        engMonthName = 'February';
        break;
      case 3:
        engMonthName = 'March';
        break;
      case 4:
        engMonthName = 'April';
        break;
      case 5:
        engMonthName = 'May';
        break;
      case 6:
        engMonthName = 'June';
        break;
      case 7:
        engMonthName = 'July';
        break;
      case 8:
        engMonthName = 'August';
        break;
      case 9:
        engMonthName = 'September';
        break;
      case 10:
        engMonthName = 'October';
        break;
      case 11:
        engMonthName = 'November';
        break;
      case 12:
        engMonthName = 'December';
        break;
    }
  }

  void getUniqueWeekList(List<Calendar> calendarData) {

    int weekSort = 1;
    int weekNum = calendarData[0].week;
    firstWeekList.add(DayObj(calendarData[0].week.toString(), '', '', Colors.green, 16.0, FontWeight.w500));
    // if(calendarData[0].weekDay == 'Monday')
    // print(object)
    for (Calendar calendar in calendarData) {
      if(calendar.week != weekNum) {
        weekNum = calendar.week;
        weekSort = weekSort + 1;
        if (weekSort == 2) {
          secondWeekList.add(DayObj(calendar.week.toString(), '', '', Colors.green, 16.0, FontWeight.w500));
        } else if (weekSort == 3) {
          thirdWeekList.add(DayObj(calendar.week.toString(), '', '', Colors.green, 16.0, FontWeight.w500));
        } else if (weekSort == 4) {
          fourthWeekList.add(DayObj(calendar.week.toString(), '', '', Colors.green, 16.0, FontWeight.w500));
        } else if (weekSort == 5) {
          fifthWeekList.add(DayObj(calendar.week.toString(), '', '', Colors.green, 16.0, FontWeight.w500));
        } else if (weekSort == 6) {
          sixthWeekList.add(DayObj(calendar.week.toString(), '', '', Colors.green, 16.0, FontWeight.w500));
        }
      }
      if(weekSort == 1) {
        firstWeekList.add(DayObj(calendar.day.toString(), '', '', Colors.brown, 18.0, FontWeight.w700));
      } else if (weekSort == 2) {
        secondWeekList.add(DayObj(calendar.day.toString(), '', '', Colors.brown, 18.0, FontWeight.w700));
      } else if (weekSort == 3) {
        thirdWeekList.add(DayObj(calendar.day.toString(), '', '', Colors.brown, 18.0, FontWeight.w700));
      } else if (weekSort == 4) {
        fourthWeekList.add(DayObj(calendar.day.toString(), '', '', Colors.brown, 18.0, FontWeight.w700));
      } else if (weekSort == 5) {
        fifthWeekList.add(DayObj(calendar.day.toString(), '', '', Colors.brown, 18.0, FontWeight.w700));
      } else if (weekSort == 6) {
        sixthWeekList.add(DayObj(calendar.day.toString(), '', '', Colors.brown, 18.0, FontWeight.w700));
      }
    }

    for(int i = firstWeekList.length; i < 8; i++) {
      firstWeekList.insert(1, DayObj('', '', '', Colors.green, 16.0, FontWeight.w500));
    }
    for (int i = fifthWeekList.length; i < 8; i++) {
      fifthWeekList.add(DayObj('', '', '', Colors.green, 16.0, FontWeight.w500));
    }
    for (int i = sixthWeekList.length; i < 8; i++) {
      sixthWeekList.add(DayObj('', '', '', Colors.green, 16.0, FontWeight.w500));
    }

  }

}
