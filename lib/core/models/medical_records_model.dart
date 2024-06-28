class MedicalRecordsModel {
  List<Data>? data;
  Meta? meta;

  MedicalRecordsModel({this.data, this.meta});

  MedicalRecordsModel.fromJson(Map<String, dynamic> json) {
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
  LabFiles? labFiles;
  Patient? patient;
  Doctor? doctor;
  Laboratory? laboratory;
  Consultant? consultant;
  DoctorFiles? doctorFiles;

  Attributes(
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
      this.testOrders,
      this.labFiles,
      this.patient,
      this.doctor,
      this.laboratory,
      this.consultant,
      this.doctorFiles});

  Attributes.fromJson(Map<String, dynamic> json) {
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
    if (json["Lab_Files"] is Map) {
      labFiles = json["Lab_Files"] == null
          ? null
          : LabFiles.fromJson(json["Lab_Files"]);
    }
    if (json["patient"] is Map) {
      patient =
          json["patient"] == null ? null : Patient.fromJson(json["patient"]);
    }
    if (json["doctor"] is Map) {
      doctor = json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]);
    }
    if (json["laboratory"] is Map) {
      laboratory = json["laboratory"] == null
          ? null
          : Laboratory.fromJson(json["laboratory"]);
    }
    if (json["consultant"] is Map) {
      consultant = json["consultant"] == null
          ? null
          : Consultant.fromJson(json["consultant"]);
    }
    if (json["doctor_Files"] is Map) {
      doctorFiles = json["doctor_Files"] == null
          ? null
          : DoctorFiles.fromJson(json["doctor_Files"]);
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
    if (labFiles != null) {
      _data["Lab_Files"] = labFiles?.toJson();
    }
    if (patient != null) {
      _data["patient"] = patient?.toJson();
    }
    if (doctor != null) {
      _data["doctor"] = doctor?.toJson();
    }
    if (laboratory != null) {
      _data["laboratory"] = laboratory?.toJson();
    }
    if (consultant != null) {
      _data["consultant"] = consultant?.toJson();
    }
    if (doctorFiles != null) {
      _data["doctor_Files"] = doctorFiles?.toJson();
    }
    return _data;
  }
}

class DoctorFiles {
  List<Data4>? data;

  DoctorFiles({this.data});

  DoctorFiles.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data4.fromJson(e)).toList();
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

class Data4 {
  int? id;
  Attributes4? attributes;

  Data4({this.id, this.attributes});

  Data4.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["attributes"] is Map) {
      attributes = json["attributes"] == null
          ? null
          : Attributes4.fromJson(json["attributes"]);
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

class Attributes4 {
  String? name;
  dynamic alternativeText;
  dynamic caption;
  dynamic width;
  dynamic height;
  dynamic formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Attributes4(
      {this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  Attributes4.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    alternativeText = json["alternativeText"];
    caption = json["caption"];
    width = json["width"];
    height = json["height"];
    formats = json["formats"];
    if (json["hash"] is String) {
      hash = json["hash"];
    }
    if (json["ext"] is String) {
      ext = json["ext"];
    }
    if (json["mime"] is String) {
      mime = json["mime"];
    }
    if (json["size"] is double) {
      size = json["size"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    previewUrl = json["previewUrl"];
    if (json["provider"] is String) {
      provider = json["provider"];
    }
    if (json["provider_metadata"] is Map) {
      providerMetadata = json["provider_metadata"] == null
          ? null
          : ProviderMetadata.fromJson(json["provider_metadata"]);
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["alternativeText"] = alternativeText;
    _data["caption"] = caption;
    _data["width"] = width;
    _data["height"] = height;
    _data["formats"] = formats;
    _data["hash"] = hash;
    _data["ext"] = ext;
    _data["mime"] = mime;
    _data["size"] = size;
    _data["url"] = url;
    _data["previewUrl"] = previewUrl;
    _data["provider"] = provider;
    if (providerMetadata != null) {
      _data["provider_metadata"] = providerMetadata?.toJson();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class ProviderMetadata {
  String? publicId;
  String? resourceType;

  ProviderMetadata({this.publicId, this.resourceType});

  ProviderMetadata.fromJson(Map<String, dynamic> json) {
    if (json["public_id"] is String) {
      publicId = json["public_id"];
    }
    if (json["resource_type"] is String) {
      resourceType = json["resource_type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}

class Consultant {
  dynamic data;

  Consultant({this.data});

  Consultant.fromJson(Map<String, dynamic> json) {
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["data"] = data;
    return _data;
  }
}

class Laboratory {
  Data3? data;

  Laboratory({this.data});

  Laboratory.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data3.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data3 {
  int? id;
  Attributes3? attributes;

  Data3({this.id, this.attributes});

  Data3.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["attributes"] is Map) {
      attributes = json["attributes"] == null
          ? null
          : Attributes3.fromJson(json["attributes"]);
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

class Attributes3 {
  String? regNum;
  String? name;
  String? password;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? category;

  Attributes3(
      {this.regNum,
      this.name,
      this.password,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.category});

  Attributes3.fromJson(Map<String, dynamic> json) {
    if (json["reg_Num"] is String) {
      regNum = json["reg_Num"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["Password"] is String) {
      password = json["Password"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["Address"] is String) {
      address = json["Address"];
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
    if (json["Category"] is String) {
      category = json["Category"];
    }
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
    _data["Category"] = category;
    return _data;
  }
}

class Doctor {
  Data2? data;

  Doctor({this.data});

  Doctor.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data2.fromJson(json["data"]);
    }
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

  Attributes2(
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

  Attributes2.fromJson(Map<String, dynamic> json) {
    if (json["reg_Num"] is String) {
      regNum = json["reg_Num"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["Email"] is String) {
      email = json["Email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["Address"] is String) {
      address = json["Address"];
    }
    if (json["Password"] is String) {
      password = json["Password"];
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
    if (json["LicenseNumber"] is String) {
      licenseNumber = json["LicenseNumber"];
    }
    if (json["NationalID"] is String) {
      nationalId = json["NationalID"];
    }
    if (json["Type_of_Spec"] is String) {
      typeOfSpec = json["Type_of_Spec"];
    }
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

class Patient {
  Data1? data;

  Patient({this.data});

  Patient.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data1.fromJson(json["data"]);
    }
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

  Attributes1(
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

  Attributes1.fromJson(Map<String, dynamic> json) {
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

class LabFiles {
  List<DataL>? data;

  LabFiles({this.data});

  LabFiles.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataL.fromJson(e)).toList();
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

class DataL {
  int? id;
  AttributesL? attributes;

  DataL({this.id, this.attributes});

  DataL.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["attributes"] is Map) {
      attributes = json["attributes"] == null
          ? null
          : AttributesL.fromJson(json["attributes"]);
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

class AttributesL {
  String? name;
  dynamic alternativeText;
  dynamic caption;
  dynamic width;
  dynamic height;
  dynamic formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  AttributesL(
      {this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  AttributesL.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    alternativeText = json["alternativeText"];
    caption = json["caption"];
    width = json["width"];
    height = json["height"];
    formats = json["formats"];
    if (json["hash"] is String) {
      hash = json["hash"];
    }
    if (json["ext"] is String) {
      ext = json["ext"];
    }
    if (json["mime"] is String) {
      mime = json["mime"];
    }
    if (json["size"] is double) {
      size = json["size"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    previewUrl = json["previewUrl"];
    if (json["provider"] is String) {
      provider = json["provider"];
    }
    if (json["provider_metadata"] is Map) {
      providerMetadata = json["provider_metadata"] == null
          ? null
          : ProviderMetadata.fromJson(json["provider_metadata"]);
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["alternativeText"] = alternativeText;
    _data["caption"] = caption;
    _data["width"] = width;
    _data["height"] = height;
    _data["formats"] = formats;
    _data["hash"] = hash;
    _data["ext"] = ext;
    _data["mime"] = mime;
    _data["size"] = size;
    _data["url"] = url;
    _data["previewUrl"] = previewUrl;
    _data["provider"] = provider;
    if (providerMetadata != null) {
      _data["provider_metadata"] = providerMetadata?.toJson();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class ProviderMetadataL {
  String? publicId;
  String? resourceType;

  ProviderMetadataL({this.publicId, this.resourceType});

  ProviderMetadataL.fromJson(Map<String, dynamic> json) {
    if (json["public_id"] is String) {
      publicId = json["public_id"];
    }
    if (json["resource_type"] is String) {
      resourceType = json["resource_type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}
