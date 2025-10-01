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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
             
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  children: [
                    const Text(
                      'Configurações da Conta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
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

                    
                    const SizedBox(height: 24),
                    const Text(
                      'Preferências',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      value: true,
                      activeColor: Colors.deepPurple,
                      title: const Text('Receber notificações'),
                      onChanged: (v) {},
                    ),

                    const SizedBox(height: 120), 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(height: 1, thickness: 1),
              const SizedBox(height: 12),
         
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                   
                    FocusScope.of(context).unfocus();
                  
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdicionarProdutoScreen()),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: const Text(
                    'Vender Produto',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Sair
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    'Sair',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
