import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tecpatient/Features/auth/presentation/views/widgets/custom_drop_down_menu.dart';
import 'package:tecpatient/Features/booking/data/static/static.dart';
import 'package:tecpatient/Features/booking/presentation/view_models/create_appointment_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/custom_appbar.dart';
import 'package:tecpatient/core/models/hospitals_model.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/config.dart';
import 'package:tecpatient/core/utils/styles.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.data});
  final Data data;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: data.attributes?.name ?? '',
        icon: const FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width * .85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(data.attributes?.hospitalImg
                                      ?.data?.attributes?.url ??
                                  ''))),
                    ),
                  ),
                ),
                _tableCalendar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      'Select Appointment Time',
                      style: Styles.Title16.copyWith(color: Color(0xff000000)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          context.read<CreateAppointmentCubit>().isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  alignment: Alignment.center,
                  child: Text(
                      'Not available on weekends, please select another date',
                      style: Styles.Title18.copyWith(color: kDarkTitleColor)),
                ))
              : BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
                  builder: (context, state) {
                  return SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              context
                                  .read<CreateAppointmentCubit>()
                                  .changeCalendarSelection(index, true);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.75,
                                  color: context
                                              .read<CreateAppointmentCubit>()
                                              .currentIndex ==
                                          index
                                      ? Colors.white
                                      : kPrimaryColor,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: context
                                            .read<CreateAppointmentCubit>()
                                            .currentIndex ==
                                        index
                                    ? kPrimaryColor
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context
                                              .read<CreateAppointmentCubit>()
                                              .currentIndex ==
                                          index
                                      ? Colors.white
                                      : kPrimaryColor,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 8,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 1.5));
                }),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                  child: CustomDropDownMenu(
                    title: "Specitiality",
                    data: medicalSpecialities,
                    isGov: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.symmetric(vertical: 80),
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
                    child: MaterialButton(
                      onPressed:
                          context.read<CreateAppointmentCubit>().timeSelected &&
                                  context
                                      .read<CreateAppointmentCubit>()
                                      .dateSelected
                              ? () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kBookingSuccessful);
                                }
                              : null,
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Make Appointment',
                        style: Styles.Title16.copyWith(
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      disabledColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
      builder: (context, state) {
        return TableCalendar(
          headerStyle: const HeaderStyle(
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: kPrimaryColor,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: kPrimaryColor,
              ),
              titleTextStyle: TextStyle(color: Colors.black)),
          focusedDay: context.read<CreateAppointmentCubit>().focusDay,
          firstDay: DateTime.now(),
          lastDay: DateTime(2024, 12, 31),
          calendarFormat: context.read<CreateAppointmentCubit>().format,
          currentDay: context.read<CreateAppointmentCubit>().currentDay,
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.black),
              weekendStyle: TextStyle(color: Colors.black)),
          rowHeight: 48,
          calendarStyle: const CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.black),
            // defaultDecoration: BoxDecoration(
            //   color: Colors.black
            // ),
            todayDecoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
          ),
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          onFormatChanged: (format) {
            context.read<CreateAppointmentCubit>().changeFormat(format);
          },
          onDaySelected: ((selectedDay, focusedDay) {
            context
                .read<CreateAppointmentCubit>()
                .changeCurrentFocusDate(selectedDay, focusedDay, true);
            context.read<CreateAppointmentCubit>().weekends(selectedDay);
          }),
        );
      },
    );
  }
}
