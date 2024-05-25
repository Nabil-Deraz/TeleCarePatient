import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/custom_appbar.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/config.dart';
import 'package:tecpatient/core/utils/styles.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Aseel Medical Center',
        icon: FaIcon(Icons.arrow_back_ios),
      ),

      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height*.25,
                    width: MediaQuery.of(context).size.width*.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const  DecorationImage(
                        fit: BoxFit.fill,              
                            image: AssetImage(AssetsData.aseelHospital))
                    ),
                  ),
                ),
                ),
                _tableCalendar(),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 25),
                child: Center(
                  child: Text('Select Appointment Time', style: Styles.Title16.copyWith(color: Color(0xff000000)),),


                ),
                ),
              ],
            ),
          ),
          _isWeekend ? SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 30),
              alignment: Alignment.center,
              child:  Text('Not available on weekends, please select another date', style: Styles.Title18.copyWith(color: kDarkTitleColor)
            ),)
          ) : SliverGrid(delegate: SliverChildBuilderDelegate((context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  _currentIndex = index;
                  _timeSelected = true;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _currentIndex == index ? Colors.white : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: _currentIndex == index ? kPrimaryColor : null,
                ),
                alignment: Alignment.center,
                child: Text('${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _currentIndex == index ? Colors.white : kPrimaryColor, 
                ),),
              ),
            );
          },
          childCount: 8,
          ),
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4 , childAspectRatio: 1.5)),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.width*0.5,
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 80),
              // child: ElevatedButton(
                
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: kPrimaryColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5)
              //     )
              //   ),
              //   onPressed: _timeSelected && _dateSelected ? false : true,
              //    child: Text('Make Appointment',style: Styles.Title16.copyWith(
              //     color: Color(0xffFFFFFF)
              //   ),),
                
              // )
              child: MaterialButton(onPressed: _timeSelected && _dateSelected ? (){} : null,
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child:  Text('Make Appointment',style: Styles.Title16.copyWith(
                  color: Color(0xffFFFFFF),
                  
              
              ),
              
              ),
              disabledColor: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _tableCalendar(){
  return TableCalendar(
    headerStyle: HeaderStyle(
      titleCentered: true,
      leftChevronIcon :  Icon(Icons.chevron_left, color: kPrimaryColor,),
      rightChevronIcon :  Icon(Icons.chevron_right, color: kPrimaryColor,),
      titleTextStyle: TextStyle(color: Colors.black
      
      )
    ),
    focusedDay: _focusDay,
     firstDay: DateTime.now(),
      lastDay: DateTime(2024,12,31),
      calendarFormat: _format,
      currentDay: _currentDay,
     daysOfWeekStyle: DaysOfWeekStyle(
      
      weekdayStyle: TextStyle(
        color: Colors.black
      ),
      weekendStyle: TextStyle(
        color: Colors.black
      )
     ),
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(
          color: Colors.black
        ),
        // defaultDecoration: BoxDecoration(
        //   color: Colors.black
        // ),
        todayDecoration: BoxDecoration(
          color: kPrimaryColor , shape: BoxShape.circle,

        ),
        

      ),
      availableCalendarFormats: const {
        CalendarFormat.month : 'Month'
      
      },
      onFormatChanged: (format){
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay,focusedDay){
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          if( selectedDay.weekday == 5 || selectedDay.weekday == 6){
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;

          }
          else{
            _isWeekend = false;
          }
        });
      }),
      );
}
}

