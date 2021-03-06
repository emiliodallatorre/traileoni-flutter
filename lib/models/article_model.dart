import 'package:app/models/author_model.dart';
import 'package:app/models/category_model.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:html/parser.dart';

class ArticleModel {
  final int id;
  final String title;
  final String excerpt;
  final String featuredMediaUrl;
  final String featuredMediaCaption;
  final String htmlBody, plainBody;
  final List<CategoryModel> categories;
  final String link;
  List<AuthorModel> authors;

  ArticleModel({
    this.id,
    this.title,
    this.excerpt,
    this.featuredMediaUrl,
    this.featuredMediaCaption,
    this.htmlBody,
    this.plainBody,
    this.categories,
    this.link,
    this.authors,
  });

  factory ArticleModel.fromWordpressPost(Post wordpressPost) => ArticleModel(
        title: parse(wordpressPost.title.rendered).documentElement.text,
        excerpt: parse(wordpressPost.excerpt.rendered).documentElement.text.replaceFirst("Reading time:", "[\u{23F3}:").replaceFirst(" minutes", " minutes]").replaceFirst(" \u{2026} Continue", "\u{2026}"),
        featuredMediaUrl: wordpressPost.featuredMedia != null ? wordpressPost.featuredMedia.link : null,
        featuredMediaCaption: wordpressPost.featuredMedia != null ? wordpressPost.featuredMedia.title.rendered : null,
        htmlBody: wordpressPost.content.rendered.replaceFirst("Reading time:", "\u{23F3} Reading time:"),
        plainBody: parse(wordpressPost.content.rendered).documentElement.text.replaceAll("\n\n", "\n").trim(),
        categories: wordpressPost.categories != null ? wordpressPost.categories.map((rawCategory) => CategoryModel.fromWordpressCategory(rawCategory)).toList() : null,
        link: wordpressPost.link,
        id: wordpressPost.id,
        authors: (wordpressPost.rawJson["_links"]["authors"] as List<dynamic>).map<AuthorModel>((e) => AuthorModel.fromRef(e)).toList(),
      );
}
