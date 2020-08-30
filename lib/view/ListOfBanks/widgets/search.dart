

import 'package:banklocator/utils/emptyContainer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

Widget searchBar(List list) {
 return Container(
    child: GFSearchBar(
      searchList: list,
      noItemsFoundWidget: EmptyContainer(),
      searchQueryBuilder: (query, list) {
        return list
            .where((item) => item
            .toLowerCase()
            .contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          color: Colors.transparent,
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      onItemSelected: (item) {
        print(item);
      },
    ),
  );
}