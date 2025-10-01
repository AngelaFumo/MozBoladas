import 'package:flutter/material.dart';
import 'produto.dart';

class DefinicoesScreen extends StatelessWidget {
  const DefinicoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definições'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Configurações da Conta',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.deepPurple),
              title: const Text('Nome do Usuário'),
              subtitle: const Text('Spatilh Samba'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.deepPurple),
              title: const Text('E-mail'),
              subtitle: const Text('spatilh@example.com'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.deepPurple),
              title: const Text('Alterar Senha'),
              onTap: () {},
            ),
            const Divider(height: 32),
            // Botão para vender produto
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdicionarProdutoScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Vender Produto', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                print('Logout');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sair', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
