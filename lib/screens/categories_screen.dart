import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(
      //       'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRBSFqfiSsNW4QmrpuymxgBxmc-6p-jro84oeUZF2__RXg3HdQe&usqp=CAU',
      //     ),
      //     fit: BoxFit.fill
      //   ),
      // ),
      child: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(
                  cat.id,
                  cat.title,
                  cat.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
