import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/booking/presentation/view_models/create_appointment_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class CustomDropDownMenuSpecs extends StatefulWidget {
  const CustomDropDownMenuSpecs({
    super.key,
    required this.data,
    required this.title,
    required this.isGov,
  });
  final List<String> data;
  final String title;
  final bool isGov;
  @override
  State<CustomDropDownMenuSpecs> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenuSpecs> {
  String? _selectedSpeciality;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kGreyLight.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kGreyLight, width: 1)),
      child: DropdownButton(
        style: Styles.Title13.copyWith(color: kBlack),
        menuMaxHeight: MediaQuery.of(context).size.height * .5,
        icon: const Icon(Icons.keyboard_arrow_down),
        padding: const EdgeInsets.all(10.0),
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        hint: Text(
          widget.title,
          style: Styles.Title14.copyWith(color: kBlack),
        ),
        value: _selectedSpeciality,
        items: widget.data.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedSpeciality = value;
          });
          context.read<CreateAppointmentCubit>().dropDownMenuValue(value!);
        },
      ),
    );
  }
}
