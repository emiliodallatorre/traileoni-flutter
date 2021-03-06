import 'package:app/generated/l10n.dart';
import 'package:app/interface/widget/article_list_element_collapsed.dart';
import 'package:app/models/currentstate_model.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  final CurrentStateModel currentState;

  SavedPage({
    @required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            S.of(context).readingList,
            style: Theme.of(context).brightness == Brightness.dark ? null : TextStyle(color: Colors.black),
          ),
          centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: currentState.saveds.isEmpty
            ? Center(child: Text(S.of(context).noSaveds))
            : ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                    ArticleListElementCollapsed(article: currentState.saveds.elementAt(index), preferences: currentState.preferences),
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: currentState.saveds.length,
              ),
      ),
    );
  }
}
