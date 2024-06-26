class AppStrings {
  static const String apiLink = "https://telegycare-s.onrender.com/api/";

  static const String apiConsultant = "${apiLink}consultants?populate=*";
  static const String apiDoctor = "${apiLink}doctors?populate=*";
  static const String apiPatient = "${apiLink}patients?populate=*";
  static const String apiHospital = "${apiLink}hospitals?populate=*";
  static const String apiAppointments = "${apiLink}appointments?populate=*";

  static const String apiDocConFilterReg = "&filters[reg_Num][\$eq]=";
  static const String apiHospitalFilterName =
      "${apiLink}hospitals/?populate=*&filters[Name][\$containsi]=";
  static const String apiAppointmentsFilter =
      "${apiLink}appointments/?populate=*&filters[patient][reg_Num][\$eq]=";

  static const String apiAppointmentsFilterReg =
      "$apiAppointments&filters[AppointmentID][\$eq]=";

  static const String apiAppointmentsFilterToday = "&filters[date][\$eq]=";
  static const String apiPatientsFilterID =
      "$apiPatient&filters[reg_Num][\$eq]=";

  static const String apiPatentsFilterName =
      "$apiPatient&filters[Name][\$containsi]=";

  static const String apiMedicalRecord = "${apiLink}medical-records?populate=*";

  static const String apiMedicalRecordFilterID =
      "$apiMedicalRecord&filters[patient][reg_Num][\$eq]=";

  static const String apiMedicalRecordFilterName =
      "$apiMedicalRecord&filters[patient][Name][\$containsi]=";

  static const String apiMedicalRecordFilterDoctor =
      "$apiMedicalRecord&filters[\$or][0][doctor][reg_Num][\$eq]=";

  static const String apiMedicalRecordFilterConsultant =
      "&filters[\$or][1][consultant][reg_Num][\$eq]=";

  static const String apiUploadFile = "${apiLink}upload";
  static const String apiPatientUpload = "${apiLink}patients/";
}
