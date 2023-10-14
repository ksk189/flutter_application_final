import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_final/servicescat/agrimach.dart';
import 'package:flutter_application_final/servicescat/agritech.dart';
import 'package:flutter_application_final/servicescat/farm_lands.dart';
import 'package:flutter_application_final/servicescat/farmworkers.dart';
import 'package:flutter_application_final/servicescat/feed.dart';
import 'package:flutter_application_final/servicescat/fertlizers.dart';
import 'package:flutter_application_final/servicescat/insecticides.dart';
import 'package:flutter_application_final/servicescat/livestock.dart';
import 'package:flutter_application_final/servicescat/pesticides.dart';
import 'package:flutter_application_final/servicescat/seeds.dart';
import 'package:flutter_application_final/servicescat/vedhika.dart';
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
    {"id": 1, "image_path": 'assets/pes10.jpg'},
    {"id": 2, "image_path": 'assets/feed.jpg'},
    {"id": 3, "image_path": 'assets/vedhika4.jpg'},
    {"id": 4, "image_path": 'assets/ins.jpg'},
    {"id": 4, "image_path": 'assets/seeds2.jpeg'},
    {"id": 4, "image_path": 'assets/FA1.jpg'},
    {"id": 4, "image_path": 'assets/fawo.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final String url = 'https://youtube.com';
  final String _phoneNumber = '+9-000-970-038';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(247, 255, 254, 255),
        body: ListView(padding: const EdgeInsets.all(14), children: [
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
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 15,
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
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'assets/call5.jpg',
                           
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16),
                    children: [
                                Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/pes10.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const PesticidesPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Pesticides",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/ins.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const InsecticidePagee(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Insecticides",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/FA1.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const FertilizerPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Fertlizers",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/seeds2.jpeg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const SeedsPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Seeds",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/feed.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const FeedPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Feed",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/Agrimac.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const AgriMachines(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Agriculture Machinery",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/fawo.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const FarmWorkersPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "FarmWorkers",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/farmland.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const FarmLandsPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "FarmLands",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/vedhika4.jpg'),
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const VedhikaPage(),
                                      ));
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Vedhika",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                          
                    ],
                  ))
            ]),
          ),
        ]));
  }
}
