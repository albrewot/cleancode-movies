// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;

  const MovieModel(
    this.id,
    this.title,
    this.posterPath,
  );

  MovieModel copyWith({
    int? id,
    String? title,
    String? posterPath,
  }) {
    return MovieModel(
      id ?? this.id,
      title ?? this.title,
      posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      map['id'] as int,
      map['title'] as String,
      map['poster_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title, posterPath];
}
