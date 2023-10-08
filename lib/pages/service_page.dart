import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/categories/categories_items.dart';
import 'package:flutter_application_final/categories/category_card.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({
    super.key,
  });

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/pes.jpg'},
    {"id": 2, "image_path": 'assets/AM1.jpg'},
    {"id": 3, "image_path": 'assets/ved.jpg'},
    {"id": 4, "image_path": 'assets/ins.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final String url = 'https://youtube.com';
  final String _phoneNumber = '+9-000-970-038';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(247, 255, 254, 255),
        body: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                child: Column(children: [
                  const Text(
                    'Find the best service you need!',
                    
                    style: TextStyle(
                        color: Color.fromARGB(191, 125, 41, 159),
                        
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              print(currentIndex);
                            },
                            child: CarouselSlider(
                                items: imageList
                                    .map(
                                      (item) => Image.asset(
                                        item['image_path'],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    )
                                    .toList(),
                                carouselController: carouselController,
                                options: CarouselOptions(
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 2,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                )),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imageList.asMap().entries.map((entry) {
                                print(entry);
                                print(entry.key);
                                return GestureDetector(
                                  onTap: () => carouselController
                                      .animateToPage(entry.key),
                                  child: Container(
                                    width: currentIndex == entry.key ? 17 : 7,
                                    height: 7,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: currentIndex == entry.key
                                            ? const Color.fromARGB(255, 141, 8, 182)
                                            : const Color.fromARGB(
                                                255, 245, 242, 242)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: 190,
                      child: Card(
                        elevation: 5,
                        shadowColor: const Color.fromARGB(225, 144, 142, 139),
                        color: const Color.fromARGB(255, 250, 249, 249),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get our Services  Right Now !',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  191, 125, 41, 159)),
                                    ),
                                    const Text(
                                        'Contact our Expert to know more!   '),
                                    FilledButton(
                                        onPressed: () async {
                                          final call = 'tel:$_phoneNumber';
                                          //final text = 'sms:$_phoneNumber';
                                          if (await launchUrlString(call)) {}
                                        },
                                        child: const Text('call')),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/sas18.jpeg',
                                width: 140,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categories: categories[index],
                      );
                    },
                  )
                ])),
          ],
        ));
  }
}
