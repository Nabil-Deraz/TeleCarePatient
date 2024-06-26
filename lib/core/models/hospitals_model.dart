class HospitalModel {
  List<Data>? data;
  Meta? meta;

  HospitalModel({this.data, this.meta});

  HospitalModel.fromJson(Map<String, dynamic> json) {
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
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? name;
  String? idHospital;
  Doctors? doctors;
  Consultants? consultants;
  Manager? manager;
  Receptionists? receptionists;
  Appointments? appointments;
  HospitalImg? hospitalImg;

  Attributes(
      {this.address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.name,
      this.idHospital,
      this.doctors,
      this.consultants,
      this.manager,
      this.receptionists,
      this.appointments,
      this.hospitalImg});

  Attributes.fromJson(Map<String, dynamic> json) {
    address = json["Address"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    name = json["Name"];
    idHospital = json["Id_Hospital"];
    doctors =
        json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]);
    consultants = json["consultants"] == null
        ? null
        : Consultants.fromJson(json["consultants"]);
    manager =
        json["manager"] == null ? null : Manager.fromJson(json["manager"]);
    receptionists = json["receptionists"] == null
        ? null
        : Receptionists.fromJson(json["receptionists"]);
    appointments = json["appointments"] == null
        ? null
        : Appointments.fromJson(json["appointments"]);
    hospitalImg = json["Hospital_Img"] == null
        ? null
        : HospitalImg.fromJson(json["Hospital_Img"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Address"] = address;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["Name"] = name;
    _data["Id_Hospital"] = idHospital;
    if (doctors != null) {
      _data["doctors"] = doctors?.toJson();
    }
    if (consultants != null) {
      _data["consultants"] = consultants?.toJson();
    }
    if (manager != null) {
      _data["manager"] = manager?.toJson();
    }
    if (receptionists != null) {
      _data["receptionists"] = receptionists?.toJson();
    }
    if (appointments != null) {
      _data["appointments"] = appointments?.toJson();
    }
    if (hospitalImg != null) {
      _data["Hospital_Img"] = hospitalImg?.toJson();
    }
    return _data;
  }
}

class HospitalImg {
  Data4? data;

  HospitalImg({this.data});

  HospitalImg.fromJson(Map<String, dynamic> json) {
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
  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  ProviderMetadata4? providerMetadata;
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
    name = json["name"];
    alternativeText = json["alternativeText"];
    caption = json["caption"];
    width = json["width"];
    height = json["height"];
    formats =
        json["formats"] == null ? null : Formats.fromJson(json["formats"]);
    hash = json["hash"];
    ext = json["ext"];
    mime = json["mime"];
    size = json["size"];
    url = json["url"];
    previewUrl = json["previewUrl"];
    provider = json["provider"];
    providerMetadata = json["provider_metadata"] == null
        ? null
        : ProviderMetadata4.fromJson(json["provider_metadata"]);
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["alternativeText"] = alternativeText;
    _data["caption"] = caption;
    _data["width"] = width;
    _data["height"] = height;
    if (formats != null) {
      _data["formats"] = formats?.toJson();
    }
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

class ProviderMetadata4 {
  String? publicId;
  String? resourceType;

  ProviderMetadata4({this.publicId, this.resourceType});

  ProviderMetadata4.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    resourceType = json["resource_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}

class Formats {
  Large? large;
  Small? small;
  Medium? medium;
  Thumbnail? thumbnail;

  Formats({this.large, this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    large = json["large"] == null ? null : Large.fromJson(json["large"]);
    small = json["small"] == null ? null : Small.fromJson(json["small"]);
    medium = json["medium"] == null ? null : Medium.fromJson(json["medium"]);
    thumbnail = json["thumbnail"] == null
        ? null
        : Thumbnail.fromJson(json["thumbnail"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (large != null) {
      _data["large"] = large?.toJson();
    }
    if (small != null) {
      _data["small"] = small?.toJson();
    }
    if (medium != null) {
      _data["medium"] = medium?.toJson();
    }
    if (thumbnail != null) {
      _data["thumbnail"] = thumbnail?.toJson();
    }
    return _data;
  }
}

class Thumbnail {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  ProviderMetadata3? providerMetadata;

  Thumbnail(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height,
      this.providerMetadata});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    ext = json["ext"];
    url = json["url"];
    hash = json["hash"];
    mime = json["mime"];
    name = json["name"];
    path = json["path"];
    size = json["size"];
    width = json["width"];
    height = json["height"];
    providerMetadata = json["provider_metadata"] == null
        ? null
        : ProviderMetadata3.fromJson(json["provider_metadata"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ext"] = ext;
    _data["url"] = url;
    _data["hash"] = hash;
    _data["mime"] = mime;
    _data["name"] = name;
    _data["path"] = path;
    _data["size"] = size;
    _data["width"] = width;
    _data["height"] = height;
    if (providerMetadata != null) {
      _data["provider_metadata"] = providerMetadata?.toJson();
    }
    return _data;
  }
}

class ProviderMetadata3 {
  String? publicId;
  String? resourceType;

  ProviderMetadata3({this.publicId, this.resourceType});

  ProviderMetadata3.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    resourceType = json["resource_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}

class Medium {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  ProviderMetadata2? providerMetadata;

  Medium(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height,
      this.providerMetadata});

  Medium.fromJson(Map<String, dynamic> json) {
    ext = json["ext"];
    url = json["url"];
    hash = json["hash"];
    mime = json["mime"];
    name = json["name"];
    path = json["path"];
    size = json["size"];
    width = json["width"];
    height = json["height"];
    providerMetadata = json["provider_metadata"] == null
        ? null
        : ProviderMetadata2.fromJson(json["provider_metadata"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ext"] = ext;
    _data["url"] = url;
    _data["hash"] = hash;
    _data["mime"] = mime;
    _data["name"] = name;
    _data["path"] = path;
    _data["size"] = size;
    _data["width"] = width;
    _data["height"] = height;
    if (providerMetadata != null) {
      _data["provider_metadata"] = providerMetadata?.toJson();
    }
    return _data;
  }
}

class ProviderMetadata2 {
  String? publicId;
  String? resourceType;

  ProviderMetadata2({this.publicId, this.resourceType});

  ProviderMetadata2.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    resourceType = json["resource_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}

class Small {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  ProviderMetadata1? providerMetadata;

  Small(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height,
      this.providerMetadata});

  Small.fromJson(Map<String, dynamic> json) {
    ext = json["ext"];
    url = json["url"];
    hash = json["hash"];
    mime = json["mime"];
    name = json["name"];
    path = json["path"];
    size = json["size"];
    width = json["width"];
    height = json["height"];
    providerMetadata = json["provider_metadata"] == null
        ? null
        : ProviderMetadata1.fromJson(json["provider_metadata"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ext"] = ext;
    _data["url"] = url;
    _data["hash"] = hash;
    _data["mime"] = mime;
    _data["name"] = name;
    _data["path"] = path;
    _data["size"] = size;
    _data["width"] = width;
    _data["height"] = height;
    if (providerMetadata != null) {
      _data["provider_metadata"] = providerMetadata?.toJson();
    }
    return _data;
  }
}

class ProviderMetadata1 {
  String? publicId;
  String? resourceType;

  ProviderMetadata1({this.publicId, this.resourceType});

  ProviderMetadata1.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    resourceType = json["resource_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}

class Large {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  ProviderMetadata? providerMetadata;

  Large(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height,
      this.providerMetadata});

  Large.fromJson(Map<String, dynamic> json) {
    ext = json["ext"];
    url = json["url"];
    hash = json["hash"];
    mime = json["mime"];
    name = json["name"];
    path = json["path"];
    size = json["size"];
    width = json["width"];
    height = json["height"];
    providerMetadata = json["provider_metadata"] == null
        ? null
        : ProviderMetadata.fromJson(json["provider_metadata"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ext"] = ext;
    _data["url"] = url;
    _data["hash"] = hash;
    _data["mime"] = mime;
    _data["name"] = name;
    _data["path"] = path;
    _data["size"] = size;
    _data["width"] = width;
    _data["height"] = height;
    if (providerMetadata != null) {
      _data["provider_metadata"] = providerMetadata?.toJson();
    }
    return _data;
  }
}

class ProviderMetadata {
  String? publicId;
  String? resourceType;

  ProviderMetadata({this.publicId, this.resourceType});

  ProviderMetadata.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    resourceType = json["resource_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["resource_type"] = resourceType;
    return _data;
  }
}

class Appointments {
  List<Data3>? data;

  Appointments({this.data});

  Appointments.fromJson(Map<String, dynamic> json) {
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
  String? specializations;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? appointmentId;
  String? state;

  Attributes3(
      {this.specializations,
      this.date,
      this.time,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.appointmentId,
      this.state});

  Attributes3.fromJson(Map<String, dynamic> json) {
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

class Receptionists {
  List<Data2>? data;

  Receptionists({this.data});

  Receptionists.fromJson(Map<String, dynamic> json) {
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
  String? regNum;
  String? name;
  String? password;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  Attributes2(
      {this.regNum,
      this.name,
      this.password,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  Attributes2.fromJson(Map<String, dynamic> json) {
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

class Manager {
  dynamic data;

  Manager({this.data});

  Manager.fromJson(Map<String, dynamic> json) {
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["data"] = data;
    return _data;
  }
}

class Consultants {
  List<Data1>? data;

  Consultants({this.data});

  Consultants.fromJson(Map<String, dynamic> json) {
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
  String? regNum;
  String? email;
  String? address;
  String? name;
  String? phone;
  String? typeOfSpec;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? licenseNumber;
  String? nationalId;

  Attributes1(
      {this.regNum,
      this.email,
      this.address,
      this.name,
      this.phone,
      this.typeOfSpec,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.licenseNumber,
      this.nationalId});

  Attributes1.fromJson(Map<String, dynamic> json) {
    regNum = json["reg_Num"];
    email = json["Email"];
    address = json["Address"];
    name = json["Name"];
    phone = json["phone"];
    typeOfSpec = json["Type_of_Spec"];
    password = json["Password"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    publishedAt = json["publishedAt"];
    licenseNumber = json["LicenseNumber"];
    nationalId = json["NationalID"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reg_Num"] = regNum;
    _data["Email"] = email;
    _data["Address"] = address;
    _data["Name"] = name;
    _data["phone"] = phone;
    _data["Type_of_Spec"] = typeOfSpec;
    _data["Password"] = password;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["publishedAt"] = publishedAt;
    _data["LicenseNumber"] = licenseNumber;
    _data["NationalID"] = nationalId;
    return _data;
  }
}

class Doctors {
  List<dynamic>? data;

  Doctors({this.data});

  Doctors.fromJson(Map<String, dynamic> json) {
    data = json["data"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}
