import 'package:flutter/material.dart';
import 'package:flutter_application_final/feeds.dart/feed.dart';
import 'package:flutter_application_final/feeds.dart/feed_details.dart';







import 'package:iconly/iconly.dart';

class FeedsCard extends StatelessWidget {
  const FeedsCard ({super.key, required this.feed});

  final Feed feed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>   FeedsDetailsPage( feed : feed)
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(feed.image),
                  scale: 1.0,
                  fit: BoxFit.contain,
                ),
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feed.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: "₹${feed.price}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),

                          
                        
                         
                          TextSpan(
                          
                            text: feed.unit,
                          
                            style: const TextStyle(
                              color: Colors.green,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(IconlyLight.plus),
                            color: Colors.green.shade500,
                            iconSize: 19,
                            splashColor: Colors.green.shade400,
                            splashRadius: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
