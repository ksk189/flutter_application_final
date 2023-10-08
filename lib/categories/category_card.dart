import 'package:flutter/material.dart';

import 'package:flutter_application_final/categories/category.dart';
import 'package:flutter_application_final/categories/category_detail.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categories,
  });

  final category categories;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryDetailPage(
              categories: categories,
              category: categories,
            ),
          ));
        },
        
        child: Card(
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                width: 0.2,
                color: Color.fromARGB(255, 209, 199, 199),
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 135,
                alignment: Alignment.topRight,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(categories.image),
                    scale: 1.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories.name,
                      style: const TextStyle(
                        color: Color.fromARGB(210, 159, 21, 218),
                        fontSize: 15,
                        
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
