class FileModel {
  int? id;
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
  ProviderMetadata2? providerMetadata;
  String? createdAt;
  String? updatedAt;

  FileModel(
      {this.id,
      this.name,
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

  FileModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    alternativeText = json["alternativeText"];
    caption = json["caption"];
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["formats"] is Map) {
      formats =
          json["formats"] == null ? null : Formats.fromJson(json["formats"]);
    }
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
          : ProviderMetadata2.fromJson(json["provider_metadata"]);
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
    _data["id"] = id;
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

class ProviderMetadata2 {
  String? publicId;
  String? resourceType;

  ProviderMetadata2({this.publicId, this.resourceType});

  ProviderMetadata2.fromJson(Map<String, dynamic> json) {
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

class Formats {
  Small? small;
  Thumbnail? thumbnail;

  Formats({this.small, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    if (json["small"] is Map) {
      small = json["small"] == null ? null : Small.fromJson(json["small"]);
    }
    if (json["thumbnail"] is Map) {
      thumbnail = json["thumbnail"] == null
          ? null
          : Thumbnail.fromJson(json["thumbnail"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (small != null) {
      _data["small"] = small?.toJson();
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
  ProviderMetadata1? providerMetadata;

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
    if (json["ext"] is String) {
      ext = json["ext"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["hash"] is String) {
      hash = json["hash"];
    }
    if (json["mime"] is String) {
      mime = json["mime"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    path = json["path"];
    if (json["size"] is double) {
      size = json["size"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["provider_metadata"] is Map) {
      providerMetadata = json["provider_metadata"] == null
          ? null
          : ProviderMetadata1.fromJson(json["provider_metadata"]);
    }
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
  ProviderMetadata? providerMetadata;

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
    if (json["ext"] is String) {
      ext = json["ext"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["hash"] is String) {
      hash = json["hash"];
    }
    if (json["mime"] is String) {
      mime = json["mime"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    path = json["path"];
    if (json["size"] is double) {
      size = json["size"];
    }
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["provider_metadata"] is Map) {
      providerMetadata = json["provider_metadata"] == null
          ? null
          : ProviderMetadata.fromJson(json["provider_metadata"]);
    }
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
