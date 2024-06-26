import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/patient_appointment_cubit.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/custom_day_date_box.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/models/appointments_model.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/functions/time_24_to_12_hour_convert.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/custom_loading.dart';

class PatientsAppointments extends StatelessWidget {
  const PatientsAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Scan Appointments",
            style: Styles.Title20.copyWith(color: Color(0xff455A64))),
        SizedBox(
          height: 15,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child:
                BlocBuilder<PatientAppointmentCubit, PatientAppointmentState>(
              builder: (context, state) {
                return state is PatientAppointmentSuccess
                    ? Scrollbar(
                        controller: context
                            .read<PatientAppointmentCubit>()
                            .scrollController,
                        child: ListView.builder(
                          controller: context
                              .read<PatientAppointmentCubit>()
                              .scrollController,
                          itemCount: state.appointmentsModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                .02),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                color: kBlack,
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                              )
                                            ],
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: DateDayBoxWidget(
                                            date: state.appointmentsModel
                                                .data![index].attributes!.date!,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        AppointmentInfo(
                                          data: state
                                              .appointmentsModel.data![index],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        ),
                      )
                    : state is PatientAppointmentLoading
                        ? const CustomLoading()
                        : state is PatientAppointmentFailure
                            ? Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  'No appointments today',
                                  style: Styles.Title16.copyWith(
                                      color: kPrimaryColor),
                                ),
                              )
                            : Text('error');
              },
            )),
      ]),
    );
  }
}

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({
    super.key,
    required this.data,
  });
  final Data data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 65,
          width: MediaQuery.of(context).size.width * 0.55,
          decoration: BoxDecoration(
            color: kWhitecomp,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: AspectRatio(
                  aspectRatio: 0.2 / 0.3,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetsData.heartMri))),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.attributes?.specializations ?? '',
                        style: Styles.Title11.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        time24To12HoursConvert(data!.attributes!.time!),
                        style: Styles.Title11.copyWith(
                            color: Color(0xffA5A5A5),
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60, left: 13),
          width: 198,
          height: 43,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                'By',
                style: TextStyle(fontSize: 10, color: Color(0xffFFFFFF)),
              ),
              SizedBox(width: 16),
              Text(
                data.attributes?.hospital?.data?.attributes?.name ?? '',
                style: Styles.Title11.copyWith(
                    fontWeight: FontWeight.w700, color: kWhitecomp),
              ),
              SizedBox(width: 6),
              AspectRatio(
                aspectRatio: 0.1 / 0.2,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetsData.militaryHospital))),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
