import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/order_page.dart';
import 'package:flutter_application_final/pages/aboutus.dart';
import 'package:flutter_application_final/pages/myprofile.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
    
      body:ListView(
        
        
        children:  [const Stack(
          children: [
            
          ],
        ),
          
        
          const Padding(padding: EdgeInsets.only(top: 25,bottom: 15,),
          
          
          child: CircleAvatar(
            radius: 50,
            child: CircleAvatar(
              
              
              radius: 48,
              backgroundColor: Color.fromARGB(255, 243, 124, 251),
              foregroundImage: AssetImage('assets/sas18.jpeg'),
              
            ),
          ),
          
          ),
        
          const Center(
            child: Text('sasi kumar',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          const Center(
            child: Text('sasitech33@gmail.com',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
            
            ),
          ),
           const SizedBox(height:25),
           const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
            ListTile(
            title: const Text('My Profile',
            style: TextStyle(
              color: Color.fromARGB(255, 152, 9, 235),
              fontWeight: FontWeight.normal

            ),
            ),
            
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MYProfile(),
                ));
              },
            
          
            
            
            leading: const Icon(IconlyLight.profile,
            color: Color.fromARGB(254, 151, 7, 240),
            size: 25,
            ),
          ),
          const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
            ListTile(
            title: const Text('My orders',
            style: TextStyle(
              color: Color.fromARGB(255, 152, 9, 235),
              fontWeight: FontWeight.normal

            ),
            ),
            
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderPage(),
                ));
              },
            
          
            
            
            leading: const Icon(IconlyLight.bag_2,
            color: Color.fromARGB(254, 151, 7, 240),
            size: 25,
            ),
          ),
          const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
         
            ListTile(
            title: const Text('About Us',
            style: TextStyle(
              color: Color.fromARGB(255, 173, 7, 240),
              fontWeight: FontWeight.normal

            ),
            ),
            onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Aboutus(),
                ));
              },
            leading: const Icon(Icons.info_outline,
            color: Color.fromARGB(254, 151, 7, 240),
            size: 25,
            ),
          ),
          const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
          const ListTile(
            title: Text('Customer Care',
            style: TextStyle(
              color: Color.fromARGB(255, 173, 7, 240),
              fontWeight: FontWeight.normal

            ),
            ),
            leading: Icon(Icons.help_outline_rounded,
            color: Color.fromARGB(254, 151, 7, 240),
            size: 25,
            ),
          ),
          const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
          ListTile(
            title: const Text('Log out',
            style: TextStyle(
              color: Color.fromARGB(255, 173, 8, 238),
              fontWeight: FontWeight.normal

            ),
            ),
            onTap: (){
              FirebaseAuth.instance.signOut();

            },
            
            leading: const Icon(Icons.logout_outlined,
            color: Color.fromARGB(254, 151, 7, 240),
            size: 25,
            
            ),
            
          ),
          const Divider(height: 0.5,
            thickness: 1,
            color: Color.fromARGB(57, 172, 99, 214),
            ),
          
          

        ],
      )
    );
  }
}
