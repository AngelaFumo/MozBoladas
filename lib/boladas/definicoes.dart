import 'package:flutter/material.dart';
import 'produto.dart';

class DefinicoesScreen extends StatefulWidget {
  const DefinicoesScreen({super.key});

  @override
  State<DefinicoesScreen> createState() => _DefinicoesScreenState();
}

class _DefinicoesScreenState extends State<DefinicoesScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Angela Isabel');
  final TextEditingController _emailController =
      TextEditingController(text: 'angelaisabel@example.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');
  final TextEditingController _contactController =
      TextEditingController(text: '823456789');

  String? _profileImage;
  bool _obscure = true;
  bool _receberNotificacoes = true; 

  void _alterarFoto() {
    setState(() {
      _profileImage = 'assets/images/profile_placeholder.jpg'; 
    });
  }

  void _atualizarDados() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Dados atualizados!\nNome: ${_nameController.text}\nEmail: ${_emailController.text}\nContacto: ${_contactController.text}\nNotificações: ${_receberNotificacoes ? "Ativadas" : "Desativadas"}'),
      ),
    );
    FocusScope.of(context).unfocus();
  }

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

                    
                    GestureDetector(
                      onTap: _alterarFoto,
                      child: Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              _profileImage != null ? AssetImage(_profileImage!) : null,
                          child: _profileImage == null
                              ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                   
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.deepPurple),
                      title: const Text('Nome do Usuário'),
                      subtitle: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Digite o nome',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.deepPurple),
                      title: const Text('E-mail'),
                      subtitle: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Digite o email',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    
                    ListTile(
                      leading: const Icon(Icons.lock, color: Colors.deepPurple),
                      title: const Text('Alterar Senha'),
                      subtitle: TextField(
                        controller: _passwordController,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          hintText: 'Digite a nova senha',
                          border: const OutlineInputBorder(),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          suffixIcon: IconButton(
                            icon: Icon(_obscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.deepPurple),
                      title: const Text('Contacto'),
                      subtitle: TextField(
                        controller: _contactController,
                        keyboardType: TextInputType.number,
                        maxLength: 9,
                        decoration: const InputDecoration(
                          counterText: '',
                          hintText: 'Digite o número de contacto',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Preferências',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    SwitchListTile(
                      value: _receberNotificacoes,
                      activeColor: Colors.deepPurple,
                      title: const Text('Receber notificações'),
                      onChanged: (v) {
                        setState(() {
                          _receberNotificacoes = v;
                        });
                      },
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
                      MaterialPageRoute(
                          builder: (context) => const AdicionarProdutoScreen()),
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

              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _atualizarDados,
                  icon: const Icon(Icons.update, color: Colors.white),
                  label: const Text(
                    'Atualizar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
