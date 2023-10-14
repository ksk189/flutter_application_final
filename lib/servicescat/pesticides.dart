import 'package:flutter/material.dart';

import 'package:flutter_application_final/products/pesticide_card.dart';
import 'package:flutter_application_final/products/pesticides.dart';

import 'package:iconly/iconly.dart';

class PesticidesPage extends StatelessWidget {
  const PesticidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          SizedBox(height: 20,),
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
              height: 130,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get high quality pesticies from different brands..',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          191, 125, 41, 159)),
                            ),
                            SizedBox(height: 10,),
                            const Text('click it we will get it....!   ',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic
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

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cotton seeds',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text('Buy now !'))
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
        itemCount: pesticides.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemBuilder: (context, index) {
          return PesticideCard(pesticide: pesticides[index],
            
          );
        });
  }
}

    
  

