import 'dart:convert' as json;
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  @nullable
  bool get deleted;

  /// This is the type of the article.
  ///
  /// It can be any of 'job', 'story', 'comment', 'poll', and 'pollopt'.
  String get type;
  String get by;
  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  int get parent;

  @nullable
  int get poll;

  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  BuiltList<int> get parts;

  @nullable
  int get descendants;

  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  return List<int>.from(parsed);
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr); // Map<String, dynamic>
  Article article =
      standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}
