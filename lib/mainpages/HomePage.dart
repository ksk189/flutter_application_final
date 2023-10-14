

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/pages/cart_page.dart';
import 'package:flutter_application_final/pages/explore_page.dart';
import 'package:flutter_application_final/pages/ml_camerapage.dart';
import 'package:flutter_application_final/pages/profile_page.dart';
import 'package:flutter_application_final/pages/service_page.dart';
import 'package:flutter_application_final/servicescat/vedhika.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
      const TFLite(),
    const VedhikaPage(),
    const ProfilePage()
  ];

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(249, 253, 253, 253),
        child: ListView(
          children: [
            // ignore: prefer_const_constructors
            DrawerHeader(
               padding: const EdgeInsets.all(5),
            
              child:  Card(
                
                
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                       
             
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              height: 135,
              alignment: Alignment.topRight,
             
              
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sas52.jpg'),
                  
                  
                  fit: BoxFit.cover,
                ),
              ),

                    )
                  ],

                  
                ),
                
               
                
              ),
              
              
            ),
            const SizedBox(height: 20,),
             ListTile(
              leading: const Icon(IconlyBold.profile),
              title: const Text(
                'profile',
                style: TextStyle(
                  color: Color.fromARGB(206, 123, 14, 186),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              },
              titleAlignment: ListTileTitleAlignment.center,
              iconColor: const Color.fromARGB(206, 123, 14, 186),
            ),
            const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
              ListTile(
              leading: const Icon(Icons.store_mall_directory),
              title: const Text(
                'services',
                style: TextStyle(
                  color: Color.fromARGB(206, 123, 14, 186),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ServicesPage(),
                ));
              },
              titleAlignment: ListTileTitleAlignment.center,
              iconColor: const Color.fromARGB(206, 123, 14, 186),
            ),
            const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),

             ListTile(
              leading: const Icon(IconlyBold.buy),
              title: const Text(
                'cart items',
                style: TextStyle(
                  color: Color.fromARGB(206, 123, 14, 186),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
              },
              titleAlignment: ListTileTitleAlignment.center,
              iconColor: const Color.fromARGB(206, 123, 14, 186),
            ),
            const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'sign out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              textColor: const Color.fromARGB(206, 123, 14, 186),
              iconColor: const Color.fromARGB(224, 123, 14, 186),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
           
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 123, 14, 186),
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hello Farmer 🧑🏻‍🌾',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 253, 255),
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  //backgroundColor: Color.fromARGB(66, 255, 255, 255),
                )),
            Text('we love your presence ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(239, 244, 243, 245),
                  fontSize: 15,
                )),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(IconlyLight.notification),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        color: const Color.fromARGB(225, 123, 14, 186),
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.fastOutSlowIn,
        height: 50,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          Icon(
            IconlyLight.home,
            color: Colors.white,
          ),
          Icon(
            IconlyLight.bag,
            color: Colors.white,
          ),
          Icon(
            IconlyLight.camera,
            color: Colors.white,
          ),
          Icon(
            Icons.play_circle_outline,
            color: Colors.white,
          ),
          Icon(
            IconlyLight.profile,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
