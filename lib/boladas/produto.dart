import 'package:flutter/material.dart';
import 'previsualizacao.dart'; 

class AdicionarProdutoScreen extends StatefulWidget {
  const AdicionarProdutoScreen({super.key});

  @override
  State<AdicionarProdutoScreen> createState() => _AdicionarProdutoScreenState();
}

class _AdicionarProdutoScreenState extends State<AdicionarProdutoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _tamanhoController = TextEditingController();
  String? _imagePath;

  void _limparCampos() {
    _nomeController.clear();
    _precoController.clear();
    _tamanhoController.clear();
    setState(() {
      _imagePath = null;
    });
  }

  void _postarProduto() {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text;
      final preco = double.tryParse(_precoController.text) ?? 0;
      final tamanho = _tamanhoController.text;

      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PrevisualizacaoProdutoScreen(
            nome: nome,
            preco: preco,
            tamanho: tamanho,
            quantidade: 1, 
            imagem: _imagePath,
          ),
        ),
      );
    }
  }

  void _selecionarImagem() {
    
    setState(() {
      _imagePath = 'assets/images/product_placeholder.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'MozBoladas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              GestureDetector(
                onTap: _selecionarImagem,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: _imagePath == null
                      ? const Center(
                          child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            _imagePath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira o nome do produto';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _precoController,
                decoration: const InputDecoration(
                  labelText: 'Preço do Produto',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira o preço do produto';
                  if (double.tryParse(value) == null) return 'Insira um valor numérico válido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tamanhoController,
                decoration: const InputDecoration(
                  labelText: 'Tamanho do Produto',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira o tamanho do produto';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _limparCampos,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Adicionar mais produto', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _postarProduto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Postar agora', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
