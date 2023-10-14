import 'package:flutter/material.dart';
import 'package:flutter_application_final/seeds.dart/seed_c.dart';
import 'package:flutter_application_final/seeds.dart/seeds_c.dart';






import 'package:iconly/iconly.dart';

class SeedsDetailsPage extends StatefulWidget {
  const SeedsDetailsPage({super.key, required this.seed,});

  final Seed seed;

  @override
  State<SeedsDetailsPage> createState() => _SeedsDetailsPageState();
}

class _SeedsDetailsPageState extends State<SeedsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBroken.bookmark),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    widget.seed.image,
                  )),
            ),
          ),
          Text(
            widget.seed.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available in stock",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "₹${widget.seed.price}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextSpan(
                    text: widget.seed.unit,
                    style: const TextStyle(
                              color: Colors.green,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade400,
              ),
              Text("${widget.seed.rating}"),
              const Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  iconSize: 25,
                  color: const Color.fromARGB(255, 12, 81, 230),
                  icon: const Icon(Icons.remove_circle),
                  hoverColor: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  " ${widget.seed.unit}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  iconSize: 25,
                  color: const Color.fromARGB(255, 12, 81, 230),
                  icon: const Icon(Icons.add_circle),
                  hoverColor: Colors.black12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              " ${widget.seed.description}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Related products',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          seeds[index].image,
                        )),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: seeds.length,
            ),
          ),
          const SizedBox(height: 30),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(IconlyLight.bag),
              label: const Text('Add To Cart'))
        ],
      ),
    );
  }
}
