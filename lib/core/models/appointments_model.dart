class Appointments {
  List<Data>? data;
  Meta? meta;

  Appointments({this.data, this.meta});

  Appointments.fromJson(Map<String, dynamic> json) {
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
  String? specializations;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? appointmentId;
  String? state;
  Hospital? hospital;
  Patient? patient;
  Receptionists? receptionists;
  Doctor? doctor;

  Attributes(
      {this.specializations,
      this.date,
      this.time,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.appointmentId,
      this.state,
      this.hospital,
      this.patient,
      this.receptionists,
      this.doctor});

  Attributes.fromJson(Map<String, dynamic> json) {
    specializations = json["specializations"];
    date = json["date"];
    time = json["time"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    appointmentId = json["AppointmentID"];
    state = json["State"];
    hospital =
        json["hospital"] == null ? null : Hospital.fromJson(json["hospital"]);
    patient =
        json["patient"] == null ? null : Patient.fromJson(json["patient"]);
    receptionists = json["receptionists"] == null
        ? null
        : Receptionists.fromJson(json["receptionists"]);
    doctor = json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]);
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
    if (hospital != null) {
      _data["hospital"] = hospital?.toJson();
    }
    if (patient != null) {
      _data["patient"] = patient?.toJson();
    }
    if (receptionists != null) {
      _data["receptionists"] = receptionists?.toJson();
    }
    if (doctor != null) {
      _data["doctor"] = doctor?.toJson();
    }
    return _data;
  }
}

class Doctor {
  Data4? data;

  Doctor({this.data});

  Doctor.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data4.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data4 {
  int? id;
  Attributes4? attributes;

  Data4({this.id, this.attributes});

  Data4.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    attributes = json["attributes"] == null
        ? null
        : Attributes4.fromJson(json["attributes"]);
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

class Attributes4 {
  String? regNum;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? licenseNumber;
  String? nationalId;
  String? typeOfSpec;

  Attributes4(
      {this.regNum,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.licenseNumber,
      this.nationalId,
      this.typeOfSpec});

  Attributes4.fromJson(Map<String, dynamic> json) {
    regNum = json["reg_Num"];
    name = json["Name"];
    email = json["Email"];
    phone = json["phone"];
    address = json["Address"];
    password = json["Password"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    licenseNumber = json["LicenseNumber"];
    nationalId = json["NationalID"];
    typeOfSpec = json["Type_of_Spec"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reg_Num"] = regNum;
    _data["Name"] = name;
    _data["Email"] = email;
    _data["phone"] = phone;
    _data["Address"] = address;
    _data["Password"] = password;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["LicenseNumber"] = licenseNumber;
    _data["NationalID"] = nationalId;
    _data["Type_of_Spec"] = typeOfSpec;
    return _data;
  }
}

class Receptionists {
  List<Data3>? data;

  Receptionists({this.data});

  Receptionists.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data3.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data3 {
  int? id;
  Attributes3? attributes;

  Data3({this.id, this.attributes});

  Data3.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    attributes = json["attributes"] == null
        ? null
        : Attributes3.fromJson(json["attributes"]);
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

class Attributes3 {
  String? regNum;
  String? name;
  String? password;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  Attributes3(
      {this.regNum,
      this.name,
      this.password,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  Attributes3.fromJson(Map<String, dynamic> json) {
    regNum = json["reg_Num"];
    name = json["Name"];
    password = json["Password"];
    phone = json["phone"];
    address = json["Address"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reg_Num"] = regNum;
    _data["Name"] = name;
    _data["Password"] = password;
    _data["phone"] = phone;
    _data["Address"] = address;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    return _data;
  }
}

class Patient {
  Data2? data;

  Patient({this.data});

  Patient.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data2.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
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

  Attributes2(
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
      this.password});

  Attributes2.fromJson(Map<String, dynamic> json) {
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
    return _data;
  }
}

class Hospital {
  Data1? data;

  Hospital({this.data});

  Hospital.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data1.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
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
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? name;
  dynamic idHospital;

  Attributes1(
      {this.address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.name,
      this.idHospital});

  Attributes1.fromJson(Map<String, dynamic> json) {
    address = json["Address"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    name = json["Name"];
    idHospital = json["Id_Hospital"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Address"] = address;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["Name"] = name;
    _data["Id_Hospital"] = idHospital;
    return _data;
  }
}
