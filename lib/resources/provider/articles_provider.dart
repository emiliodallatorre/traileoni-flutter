import 'dart:convert';

import 'package:app/models/article_model.dart';
import 'package:app/models/author_model.dart';
import 'package:app/models/category_model.dart';
import 'package:app/models/preferences_model.dart';
import 'package:app/references.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:http/http.dart' as http;

class ArticlesProvider {
  static Future<List<ArticleModel>> getArticles(int page, int perPage, {bool full}) async {
    DateTime startTime = DateTime.now();

    List<Post> rawArticles = await References.wordPress.fetchPosts(
      postParams: ParamsPostList(
        context: WordPressContext.view,
        pageNum: page,
        perPage: perPage,
        order: Order.desc,
        orderBy: PostOrderBy.date,
      ),
      fetchAuthor: full ?? true,
      fetchFeaturedMedia: full ?? true,
      // fetchComments: true,
      fetchCategories: full ?? true,
    );

    List<ArticleModel> articles = List<ArticleModel>();

    for (int index = 0; index < rawArticles.length; index++) {
      ArticleModel articleModel = ArticleModel.fromWordpressPost(rawArticles.elementAt(index));

      if (full) articleModel.authors = await _fetchFullAuthors(articleModel.authorsRefs);

      articles.add(articleModel);
    }

    debugPrint("Recuperati $perPage articoli in ${DateTime.now().difference(startTime).inSeconds} secondi.");
    debugPrint("Gli articoli ${!(full ?? true) ? "non " : ""}sono completi.");
    return articles;
  }

  static Future<List<ArticleModel>> getSaveds(PreferencesModel preferences) async {
    if (preferences.savedPosts.isEmpty) {
      debugPrint("Non ci sono articoli salvati, restituisco vuoto.");
      return List<ArticleModel>();
    }
    debugPrint("Cerco gli articoli salvati: " + preferences.savedPosts.toString() + ".");

    List<Post> rawArticles = await References.wordPress.fetchPosts(postParams: ParamsPostList(includePostIDs: preferences.savedPosts), fetchFeaturedMedia: true);

    List<ArticleModel> articles = List<ArticleModel>();
    for (int index = 0; index < rawArticles.length; index++) {
      ArticleModel articleModel = ArticleModel.fromWordpressPost(rawArticles.elementAt(index));

      articleModel.authors = await _fetchFullAuthors(articleModel.authorsRefs);

      articles.add(articleModel);
    }

    debugPrint("Recuperati ${rawArticles.length} articoli salvati.");
    return articles;
  }

  static Future<List<ArticleModel>> getArticlesByCategory(CategoryModel category, {int numberOfArticles, int page}) async {
    List<Post> rawArticles = await References.wordPress.fetchPosts(
      postParams: ParamsPostList(
        context: WordPressContext.view,
        pageNum: page ?? 1,
        perPage: numberOfArticles ?? References.articlesPerPage,
        order: Order.desc,
        orderBy: PostOrderBy.date,
        includeCategories: [category.id],
      ),
      // fetchAuthor: true,
      fetchFeaturedMedia: true,
      // fetchComments: true,
      fetchCategories: true,
    );

    List<ArticleModel> articles = List<ArticleModel>();
    for (int index = 0; index < rawArticles.length; index++) {
      ArticleModel articleModel = ArticleModel.fromWordpressPost(rawArticles.elementAt(index));

      articleModel.authors = await _fetchFullAuthors(articleModel.authorsRefs);

      articles.add(articleModel);
    }

    debugPrint("Recuperati ${articles.length} articoli della categoria \"${category.name}\".");
    return articles;
  }

  static Future<List<AuthorModel>> _fetchFullAuthors(List<AuthorModel> authorRefs) async {
    List<AuthorModel> fullAuthors = List<AuthorModel>();
    for (int index = 0; index < authorRefs.length; index++) {
      http.Response response = await http.get(authorRefs.elementAt(index).href);

      if (response.statusCode == 200)
        fullAuthors.add(AuthorModel.fromJson(jsonDecode(response.body)["author_data"]));
      else
        throw response.body;
    }

    return fullAuthors;
  }
}
