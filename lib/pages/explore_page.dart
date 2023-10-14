import 'package:flutter/material.dart';
import 'package:flutter_application_final/pages/ml_camerapage.dart';
import 'package:flutter_application_final/products/product_card.dart';
import 'package:flutter_application_final/products/products.dart';
import 'package:iconly/iconly.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  //final String _phoneNumber = '9000970038';
  final _url = ('https://youtube.com/@EkisaanStore?si=tMdERVSMGeO4eosQ');
  final whatsApp = ('https://wa.me//+9000970038');
  final String _phoneNumber = '+9-000-970-038';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ' search here...',
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 236, 234, 234),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      prefixIcon: Icon(IconlyLight.search),
                      // prefixIconColor: Color.fromARGB(255, 135, 133, 124),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.filter),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 140,
              child: Card(
                elevation: 20,
                shadowColor: const Color.fromARGB(237, 198, 193, 189),
                color: const Color.fromARGB(255, 250, 250, 250),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'know your Crop disease !',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          191, 125, 41, 159)),
                            ),
                            const Text('Click on camera to test!   '),
                            FilledButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return   const TFLite();
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                IconlyBold.camera,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/crop.jpg',
                        width: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          //consul.. card..

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 140,
              child: Card(
                elevation: 25,
                shadowColor: const Color.fromARGB(226, 185, 182, 178),
                color: const Color.fromARGB(255, 250, 249, 249),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Flexible(
                        child: Column(
                          children: [
                            SizedBox(height: 6,),
                            Text(
                              'Follow our social media for more updates!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(191, 125, 41, 159),
                                fontSize: 15,
                                fontWeight:FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      FilledButton(
                        onPressed: () async {
                         await  launchUrlString(whatsApp);
                        },
                        child: const SocialMediaButton.whatsapp(
                          color: Color.fromARGB(255, 7, 243, 15),
                          size: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FilledButton(
                        onPressed: () async {
                         await  launchUrlString(_url);
                        },
                        child: const SocialMediaButton.youtube(
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FilledButton(
                        onPressed: () async {
                          final text = 'sms:$_phoneNumber';
                          await launchUrlString(text);
                        },
                        child: const SocialMediaButton.twitter(
                          color: Color.fromARGB(255, 104, 131, 241),
                          size: 25,
                        ),
                      ),
                    ],
                    
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured products',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text('See all'))
            ],
          ),
          const grid_products()
        ],
      ),
    );
  }
}

class grid_products extends StatelessWidget {
  const grid_products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        });
  }
}
