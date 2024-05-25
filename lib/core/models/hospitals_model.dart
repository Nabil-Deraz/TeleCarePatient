class HospitalsModel {
  List<Data>? data;
  Meta? meta;

  HospitalsModel({this.data, this.meta});

  HospitalsModel.fromJson(Map<String, dynamic> json) {
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
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? name;
  dynamic idHospital;
  Doctors? doctors;
  Consultants? consultants;
  Manager? manager;
  Receptionists? receptionists;
  Appointments? appointments;

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
      this.appointments});

  Attributes.fromJson(Map<String, dynamic> json) {
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
    if (json["Name"] is String) {
      name = json["Name"];
    }
    idHospital = json["Id_Hospital"];
    if (json["doctors"] is Map) {
      doctors =
          json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]);
    }
    if (json["consultants"] is Map) {
      consultants = json["consultants"] == null
          ? null
          : Consultants.fromJson(json["consultants"]);
    }
    if (json["manager"] is Map) {
      manager =
          json["manager"] == null ? null : Manager.fromJson(json["manager"]);
    }
    if (json["receptionists"] is Map) {
      receptionists = json["receptionists"] == null
          ? null
          : Receptionists.fromJson(json["receptionists"]);
    }
    if (json["appointments"] is Map) {
      appointments = json["appointments"] == null
          ? null
          : Appointments.fromJson(json["appointments"]);
    }
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
    return _data;
  }
}

class Appointments {
  List<Data1>? data;

  Appointments({this.data});

  Appointments.fromJson(Map<String, dynamic> json) {
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
  String? specializations;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? appointmentId;

  Attributes1(
      {this.specializations,
      this.date,
      this.time,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.appointmentId});

  Attributes1.fromJson(Map<String, dynamic> json) {
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
    return _data;
  }
}

class Receptionists {
  List<dynamic>? data;

  Receptionists({this.data});

  Receptionists.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data;
    }
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
  List<dynamic>? data;

  Consultants({this.data});

  Consultants.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}

class Doctors {
  List<dynamic>? data;

  Doctors({this.data});

  Doctors.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}
