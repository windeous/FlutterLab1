import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('196047'),
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsetsDirectional.all(12.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 3 / 4,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      imageUrl: images[index]['url']!,
                      price: images[index]['price'] ?? 'N/A',
                      title: images[index]['title']!,
                      description: images[index]['description']!,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(images[index]['url']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;
  final String description;

  const DetailPage({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 400.0),
            const SizedBox(height: 16.0),
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8.0),
            Text('Price: \$$price',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8.0),
            Text('Description: $description',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> images = [
  {
    'url':
        'https://thalasiknitfab.com/cdn/shop/files/ANIMEOVERSIZEDTSHIRT_6e28c0e6-b2a8-4932-a59b-4cc93ec85245_490x@2x.progressive.jpg?v=1710145766',
    'price': '29.99',
    'title': 'Item 1',
    'description': 'Description for Item 1',
  },
  {
    'url':
        'https://cdn.shopify.com/s/files/1/0583/3218/4771/files/Michael-Jackon_E2_80_99s-Thriller-Jacket.jpg',
    'price': '39.99',
    'title': 'jacket 1',
    'description': 'Expensive jacket 1',
  },
  {
    'url':
        'https://furcaravan.com/cdn/shop/products/Men_s_croco_leather_jacket_luxuryMS__1854_900x.jpg?v=1630405866',
    'price': '44.99',
    'title': 'jacket 2',
    'description': 'Expensive jacket 2',
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR76oEDP62ZmcUC53-2vPf9bIG07CS5zBW-LA&s',
    'price': '55.99',
    'title': 'jacket 3',
    'description': 'Expensive jacket 3',
  },
  {
    'url':
        'https://cdn.shopify.com/s/files/1/0583/3218/4771/files/Balmain-Embroidered-Leather-Jacket.jpg',
    'price': '66.99',
    'title': 'jacket 4',
    'description': 'Expensive jacket 4',
  },
  {
    'url':
        'https://leatherskinshop.com/cdn/shop/articles/leather-jacket-men-model.jpg',
    'price': '77.99',
    'title': 'jacket 5',
    'description': 'Expensive jacket 5',
  },
  {
    'url':
        'https://3amoto.com/cdn/shop/articles/expensive-jackets.jpg?v=1684493130&width=1920',
    'price': '88.99',
    'title': 'jacket 6',
    'description': 'Expensive jacket 6',
  },
  {
    'url':
        'https://media.kohlsimg.com/is/image/kohls/4567520_Black?wid=400&hei=400&op_sharpen=1',
    'price': '99.99',
    'title': 'jacket 7',
    'description': 'Expensive jacket 7',
  },

  // Add more items here
];
