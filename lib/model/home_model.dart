class FileModel {
  String? originalname;
  String? filename;
  String? location;

  FileModel({this.originalname, this.filename, this.location});

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
        originalname: json['originalname'],
        filename: json['filename'],
        location: json['location']);
  }
}
