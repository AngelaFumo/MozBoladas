import 'package:flutter/material.dart';

class MinhasComprasScreen extends StatelessWidget {
  const MinhasComprasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> compras = [
      {
        'produto': 'Sapatos Clássicos',
        'preco': 2500.0,
        'data': '01/10/2025',
        'imagem': 'imagens/image.png',
      },
      {
        'produto': 'Laptop Macbook',
        'preco': 1500.0,
        'data': '25/09/2025',
        'imagem': 'imagens/macbook.jpg',
      },
      {
        'produto': 'Fones de Ouvido',
        'preco': 3500.0,
        'data': '20/09/2025',
        'imagem': 'imagens/fones.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Compras'),
        backgroundColor: Colors.deepPurple,
        
      ),
      body: compras.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não fez compras.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: compras.length,
              itemBuilder: (context, index) {
                final compra = compras[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        compra['imagem'] as String,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      compra['produto'] as String, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preço: ${compra['preco']} Mt'),
                        Text('Data: ${compra['data']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
