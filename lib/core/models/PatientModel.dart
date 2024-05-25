class PatientModel {
  List<Data>? data;
  Meta? meta;

  PatientModel({this.data, this.meta});

  PatientModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if (meta != null) {
      _data["meta"] = meta?.toJson();
    }
    return _data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json["pagination"] == null
        ? null
        : Pagination.fromJson(json["pagination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (pagination != null) {
      _data["pagination"] = pagination?.toJson();
    }
    return _data;
  }
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({this.page, this.pageSize, this.pageCount, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    pageSize = json["pageSize"];
    pageCount = json["pageCount"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["pageSize"] = pageSize;
    _data["pageCount"] = pageCount;
    _data["total"] = total;
    return _data;
  }
}

class Data {
  int? id;
  Attributes? attributes;

  Data({this.id, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    attributes = json["attributes"] == null
        ? null
        : Attributes.fromJson(json["attributes"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    return _data;
  }
}

class Attributes {
  String? name;
  String? email;
  String? phone;
  String? birthDate;
  dynamic verifyCode;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? regNum;
  String? governorate;
  String? nationalId;
  String? city;
  String? street;
  String? gender;
  String? bloodType;
  String? password;
  MedicalRecords? medicalRecords;
  Appointments? appointments;

  Attributes(
      {this.name,
      this.email,
      this.phone,
      this.birthDate,
      this.verifyCode,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.regNum,
      this.governorate,
      this.nationalId,
      this.city,
      this.street,
      this.gender,
      this.bloodType,
      this.password,
      this.medicalRecords,
      this.appointments});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json["Name"];
    email = json["Email"];
    phone = json["phone"];
    birthDate = json["Birth_Date"];
    verifyCode = json["verify_Code"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    regNum = json["reg_Num"];
    governorate = json["Governorate"];
    nationalId = json["NationalId"];
    city = json["City"];
    street = json["Street"];
    gender = json["Gender"];
    bloodType = json["Blood_Type"];
    password = json["Password"];
    medicalRecords = json["medical_records"] == null
        ? null
        : MedicalRecords.fromJson(json["medical_records"]);
    appointments = json["appointments"] == null
        ? null
        : Appointments.fromJson(json["appointments"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Name"] = name;
    _data["Email"] = email;
    _data["phone"] = phone;
    _data["Birth_Date"] = birthDate;
    _data["verify_Code"] = verifyCode;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["reg_Num"] = regNum;
    _data["Governorate"] = governorate;
    _data["NationalId"] = nationalId;
    _data["City"] = city;
    _data["Street"] = street;
    _data["Gender"] = gender;
    _data["Blood_Type"] = bloodType;
    _data["Password"] = password;
    if (medicalRecords != null) {
      _data["medical_records"] = medicalRecords?.toJson();
    }
    if (appointments != null) {
      _data["appointments"] = appointments?.toJson();
    }
    return _data;
  }
}

class Appointments {
  List<Data2>? data;

  Appointments({this.data});

  Appointments.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data2.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data2 {
  int? id;
  Attributes2? attributes;

  Data2({this.id, this.attributes});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    attributes = json["attributes"] == null
        ? null
        : Attributes2.fromJson(json["attributes"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    return _data;
  }
}

class Attributes2 {
  String? specializations;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? appointmentId;
  String? state;

  Attributes2(
      {this.specializations,
      this.date,
      this.time,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.appointmentId,
      this.state});

  Attributes2.fromJson(Map<String, dynamic> json) {
    specializations = json["specializations"];
    date = json["date"];
    time = json["time"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    appointmentId = json["AppointmentID"];
    state = json["State"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["specializations"] = specializations;
    _data["date"] = date;
    _data["time"] = time;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["AppointmentID"] = appointmentId;
    _data["State"] = state;
    return _data;
  }
}

class MedicalRecords {
  List<Data1>? data;

  MedicalRecords({this.data});

  MedicalRecords.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data1 {
  int? id;
  Attributes1? attributes;

  Data1({this.id, this.attributes});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    attributes = json["attributes"] == null
        ? null
        : Attributes1.fromJson(json["attributes"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    return _data;
  }
}

class Attributes1 {
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  dynamic prescription;
  dynamic labNote;
  int? presState;
  int? height;
  dynamic weight;
  dynamic bodyMassIndex;
  dynamic bloodPressure;
  dynamic pulse;
  String? medicalRecordId;
  dynamic testOrders;

  Attributes1(
      {this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.prescription,
      this.labNote,
      this.presState,
      this.height,
      this.weight,
      this.bodyMassIndex,
      this.bloodPressure,
      this.pulse,
      this.medicalRecordId,
      this.testOrders});

  Attributes1.fromJson(Map<String, dynamic> json) {
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    prescription = json["prescription"];
    labNote = json["Lab_note"];
    presState = json["pres_state"];
    height = json["Height"];
    weight = json["Weight"];
    bodyMassIndex = json["Body_Mass_Index"];
    bloodPressure = json["Blood_Pressure"];
    pulse = json["Pulse"];
    medicalRecordId = json["Medical_RecordId"];
    testOrders = json["Test_Orders"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["prescription"] = prescription;
    _data["Lab_note"] = labNote;
    _data["pres_state"] = presState;
    _data["Height"] = height;
    _data["Weight"] = weight;
    _data["Body_Mass_Index"] = bodyMassIndex;
    _data["Blood_Pressure"] = bloodPressure;
    _data["Pulse"] = pulse;
    _data["Medical_RecordId"] = medicalRecordId;
    _data["Test_Orders"] = testOrders;
    return _data;
  }
}
