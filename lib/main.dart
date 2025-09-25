import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //superclasse
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp envolve os demais
    return MaterialApp(
      // titulo da aplicação
      title: 'Manipulação da interface',
      //tema do app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 61, 96, 194),
        ),
      ),

      home: const MyHomePage(title: 'Flutter primeiro contato com a interface'),
    );
  }
}

// MyHomePage é um widget com estado (StatefulWidget)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  // Cria o objeto de estado mutável widget.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// A classe de estado para MyHomePage._privada
class _MyHomePageState extends State<MyHomePage> {
  // Uma variável de estado para o contador
  int _counter = 0;

  // Um método que incrementa o contador.
  void _incrementCounter() {
    // setState() notifica o estado interno do widget para que ele seja atualizado.
    // Isso faz com que o framework execute o build()
    setState(() {
      _counter++;
    });
  }

  // Um método que decremeta o contador.
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que setState é chamado.
    // O framework do Flutter foi otimizado para tornar a reexecução dos métodos de build rápida.
    // Scaffold é um widget que implementa a estrutura visual básica do Material Design.
  return Scaffold(
  // A barra de aplicativos na parte superior da tela.
  appBar: AppBar(
    // Define a cor de fundo da AppBar usando o esquema de cores do tema.
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    // O título exibido na AppBar, obtido do objeto MyHomePage.
    title: Text(widget.title),
  ),
  // O corpo principal da tela.
  body: Center(
    // Center é um widget de layout que centraliza seu filho.
    child: Column(
      // Column é um widget de layout que organiza seus filhos verticalmente.
      // mainAxisAlignment.center centraliza os filhos verticalmente.
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Um widget de texto estático.
        const Text('Você pressionou o botão tantas vezes:'),
        // Um widget de texto que exibe o valor atual do contador, com fonte maior.
        Text(
          '$_counter',
          // Estiliza o texto usando o estilo headlineMedium do tema, com tamanho ajustado.
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30),
        ),
        // Espaçamento vertical entre o texto e os botões.
        const SizedBox(height: 32),

        // 1. BOTÃO DE INCREMENTAR ESTILIZADO COM BORDA
        ElevatedButton.icon(
          onPressed: _incrementCounter,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // A borda é definida aqui
              side: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: const Icon(Icons.add),
          label: const Text('Incrementar'),
        ),
        const SizedBox(height: 16),

        // 2. BOTÃO DE DECREMENTAR ESTILIZADO COM BORDA
        TextButton.icon(
          onPressed: _decrementCounter,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black87,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // A borda é definida aqui
              side: const BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          icon: const Icon(Icons.remove),
          label: const Text('Decrementar'),
        ),
        
        // 
      ],
    ),
  ),
  // O botão de ação flutuante foi removido para uma UI mais limpa.
);
  }
}
//crt + shift + i = identação