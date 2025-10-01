import 'package:flutter/material.dart';

class ComprarScreen extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double rating;
  final String contact;
  final String imagePath;

  const ComprarScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.contact,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('${price.toStringAsFixed(0)} Mt',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (i) {
                final filled = i < rating.round();
                return Icon(
                  Icons.star,
                  size: 20,
                  color: filled ? Colors.amber : Colors.grey[300],
                );
              }),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                print('Ligando para $contact');
              },
              icon: const Icon(Icons.call),
              label: const Text('Ligar'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                print('Mandando mensagem para $contact');
              },
              icon: const Icon(Icons.message),
              label: const Text('Mensagem'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
