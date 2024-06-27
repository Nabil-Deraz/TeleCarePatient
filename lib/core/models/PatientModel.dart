class PatientModel {
  List<Data>? data;
  Meta? meta;

  PatientModel({this.data, this.meta});

  PatientModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if (json["meta"] is Map) {
      meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    }
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
    if (json["pagination"] is Map) {
      pagination = json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]);
    }
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
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if (json["pageCount"] is int) {
      pageCount = json["pageCount"];
    }
    if (json["total"] is int) {
      total = json["total"];
    }
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
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["attributes"] is Map) {
      attributes = json["attributes"] == null
          ? null
          : Attributes.fromJson(json["attributes"]);
    }
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
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["Email"] is String) {
      email = json["Email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["Birth_Date"] is String) {
      birthDate = json["Birth_Date"];
    }
    verifyCode = json["verify_Code"];
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if (json["reg_Num"] is String) {
      regNum = json["reg_Num"];
    }
    if (json["Governorate"] is String) {
      governorate = json["Governorate"];
    }
    if (json["NationalId"] is String) {
      nationalId = json["NationalId"];
    }
    if (json["City"] is String) {
      city = json["City"];
    }
    if (json["Street"] is String) {
      street = json["Street"];
    }
    if (json["Gender"] is String) {
      gender = json["Gender"];
    }
    if (json["Blood_Type"] is String) {
      bloodType = json["Blood_Type"];
    }
    if (json["Password"] is String) {
      password = json["Password"];
    }
    if (json["medical_records"] is Map) {
      medicalRecords = json["medical_records"] == null
          ? null
          : MedicalRecords.fromJson(json["medical_records"]);
    }
    if (json["appointments"] is Map) {
      appointments = json["appointments"] == null
          ? null
          : Appointments.fromJson(json["appointments"]);
    }
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
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data2.fromJson(e)).toList();
    }
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
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["attributes"] is Map) {
      attributes = json["attributes"] == null
          ? null
          : Attributes2.fromJson(json["attributes"]);
    }
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
    if (json["specializations"] is String) {
      specializations = json["specializations"];
    }
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["time"] is String) {
      time = json["time"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if (json["AppointmentID"] is String) {
      appointmentId = json["AppointmentID"];
    }
    if (json["State"] is String) {
      state = json["State"];
    }
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
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    }
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
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["attributes"] is Map) {
      attributes = json["attributes"] == null
          ? null
          : Attributes1.fromJson(json["attributes"]);
    }
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
  String? prescription;
  dynamic labNote;
  String? presState;
  String? height;
  String? weight;
  String? bodyMassIndex;
  String? bloodPressure;
  String? medicalRecordId;
  String? testOrders;

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
      this.medicalRecordId,
      this.testOrders});

  Attributes1.fromJson(Map<String, dynamic> json) {
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if (json["prescription"] is String) {
      prescription = json["prescription"];
    }
    labNote = json["Lab_note"];
    if (json["pres_state"] is String) {
      presState = json["pres_state"];
    }
    if (json["Height"] is String) {
      height = json["Height"];
    }
    if (json["Weight"] is String) {
      weight = json["Weight"];
    }
    if (json["Body_Mass_Index"] is String) {
      bodyMassIndex = json["Body_Mass_Index"];
    }
    if (json["Blood_Pressure"] is String) {
      bloodPressure = json["Blood_Pressure"];
    }
    if (json["Medical_RecordId"] is String) {
      medicalRecordId = json["Medical_RecordId"];
    }
    if (json["Test_Orders"] is String) {
      testOrders = json["Test_Orders"];
    }
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
    _data["Medical_RecordId"] = medicalRecordId;
    _data["Test_Orders"] = testOrders;
    return _data;
  }
}
