import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets_conteudo.dart';
import 'package:flutter_application_1/screens/widgets_layout.dart';
import 'package:flutter_application_1/screens/ver_clima.dart';
import 'package:flutter_application_1/models/clima.dart';
import 'package:flutter_application_1/widgets/titulo_secao.dart';
import 'package:flutter_application_1/screens/stateful.dart';
import 'package:flutter_application_1/widgets/contador.dart';
import 'package:flutter_application_1/screens/formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ListContents(),
    );
  }
}

class ListContents extends StatelessWidget {
  const ListContents({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatalogoItem> secoes = [
      CatalogoItem(
        titulo: 'Widgets de conteudo',
        icone: Icons.text_fields,
        descricao: 'Exemplos de Widgets de Conteudo feitos na aula 1',
        destino: const WidgetsConteudo(),
      ),
      CatalogoItem(
        titulo: 'Widgets de Layout',
        icone: Icons.view_agenda,
        descricao: 'Exemplos de Widgets de Layout feitos na aula 2',
        destino: const WidgetsLayout(),
      ),
      CatalogoItem(
        titulo: 'Clima de São Paulo',
        icone: Icons.cloud,
        descricao: 'Clique para ver clima de São Paulo',
        destino: VerClima(
          clima: Clima(
            cidade: 'São Paulo',
            temperaturaAtual: 25,
            temperaturaMinima: 20,
            temperaturaMaxima: 30,
            umidade: 60,
            chancheChuva: 20,
          ),
        ),
      ),

      CatalogoItem(
        titulo: 'Clima de Rio de Janeiro',
        icone: Icons.cloud,
        descricao: 'Clique para ver clima do Rio de Janeiro',
        destino: VerClima(
          clima: Clima(
            cidade: 'Rio de Janeiro',
            temperaturaAtual: 33,
            temperaturaMinima: 25,
            temperaturaMaxima: 35,
            umidade: 70,
            chancheChuva: 30,
          ),
        ),
      ),

      CatalogoItem(
        titulo: 'Ciclo de vida Stateful',
        icone: Icons.sync,
        descricao: "Aprendendo ciclo de vida de um Widget Stateful",
        destino: StatefulPai(),
      ),
      CatalogoItem(
        titulo: 'Contador de cliques',
        icone: Icons.touch_app,
        descricao: "Selecione para contar os cliques",
        destino: Contador(cor: Colors.blue),
      ),

      CatalogoItem(
        titulo: 'Formulario',
        icone: Icons.login,
        descricao: "Clique aqui para ver os formulários",
        destino:Formulario(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
        children: [
          ...secoes.map(
            (item) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.destino),
              ),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Icon(item.icone, size: 48, color: Colors.blue),
                      Text(
                        item.titulo,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        item.descricao,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogoItem {
  final String titulo;
  final IconData icone;
  final String descricao;
  final Widget destino;

  CatalogoItem({
    required this.titulo,
    required this.icone,
    required this.descricao,
    required this.destino,
  });
}
