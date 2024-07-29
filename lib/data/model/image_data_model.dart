import 'package:cloud_firestore/cloud_firestore.dart';

class ImageDataModel {
  final String imageUrl;
  final String label;
  final DateTime uploadedAt;

  ImageDataModel({
    required this.imageUrl,
    required this.label,
    required this.uploadedAt,
  });

  factory ImageDataModel.fromMap(Map<String, dynamic> map) {
    return ImageDataModel(
      imageUrl: map['imageUrl'] as String,
      label: map['label'] as String,
      uploadedAt: (map['uploadedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'label': label,
      'uploadedAt': uploadedAt,
    };
  }
}
