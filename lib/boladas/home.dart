// lib/boladas/home.dart
import 'package:flutter/material.dart';
import 'comprar.dart';
import 'definicoes.dart'; // importar a tela de definições

final List<Map<String, dynamic>> sampleProducts = [
  {
    'name': 'Spatilh Samba',
    'desc': 'Sapatos estilosos e confortáveis',
    'price': 5000.0,
    'image': 'assets/images/product1.jpg',
    'rating': 4.5,
    'contact': '912345678',
  },
  {
    'name': 'Camisa Azul',
    'desc': 'Camisa de algodão premium',
    'price': 2000.0,
    'image': 'assets/images/product2.jpg',
    'rating': 4.0,
    'contact': '912345679',
  },
  {
    'name': 'Relógio Digital',
    'desc': 'Design moderno, resistente à água',
    'price': 3500.0,
    'image': 'assets/images/product3.jpg',
    'rating': 4.7,
    'contact': '912345680',
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(radius: 28, backgroundColor: Colors.white),
                  SizedBox(height: 12),
                  Text('Olá, Angela Isabel ', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Minhas Compras'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Definições'),
              onTap: () {
                Navigator.pop(context); // fecha o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DefinicoesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 28, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'MozBoladas',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_cart_outlined),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search, color: Colors.grey),
                            hintText: 'Pesquisar produtos...',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView.builder(
          itemCount: sampleProducts.length,
          itemBuilder: (context, index) {
            final p = sampleProducts[index];
            return ProductCard(
              name: p['name']!,
              description: p['desc']!,
              price: p['price']!,
              imagePath: p['image']!,
              rating: p['rating']!,
              contact: p['contact']!,
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final double rating;
  final String contact;

  const ProductCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported, size: 36, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(description, style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 8),
                  Text('${price.toStringAsFixed(0)} Mt',
                      style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(5, (i) {
                          final filled = i < rating.round();
                          return Icon(
                            Icons.star,
                            size: 16,
                            color: filled ? Colors.amber : Colors.grey[300],
                          );
                        }),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ComprarScreen(
                                name: name,
                                description: description,
                                price: price,
                                rating: rating,
                                contact: contact,
                                imagePath: imagePath,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Adicionar', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
