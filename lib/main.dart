// Importa o pacote material.dart, que contém os widgets do Flutter que implementam o Material Design.
import 'package:flutter/material.dart';

// A função main() é o ponto de entrada da aplicação.
void main() {
  // runApp() infla o widget fornecido e o anexa à tela.
  runApp(const MyApp());
}

// MyApp é um widget sem estado (StatelessWidget), o que significa que ele descreve uma parte da interface do usuário que não depende de nada além das informações de configuração (os parâmetros passados para ele).
class MyApp extends StatelessWidget {
  // O construtor para este widget. A anotação {super.key} passa a chave para o construtor da superclasse.
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    // MaterialApp é um widget que envolve vários outros widgets que são comumente necessários para aplicações Material Design.
    return MaterialApp(
      // O título da aplicação, usado pelo sistema operacional para identificar a aplicação.
      title: 'Flutter Demo',
      // O tema da aplicação, que define a aparência visual, como cores, fontes, etc.
      theme: ThemeData(
        // ColorScheme.fromSeed() cria um esquema de cores a partir de uma única cor semente.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // O widget que será exibido na rota inicial (a "home") da aplicação.
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage é um widget com estado (StatefulWidget), o que significa que ele pode manter um estado que pode mudar durante a vida do widget.
class MyHomePage extends StatefulWidget {
  // Construtor do widget. Ele recebe um título.
  const MyHomePage({super.key, required this.title});

  // Esta classe é a configuração para o estado. Ela contém os valores (neste caso, o título) fornecidos pelo pai (o widget App).
  // Os campos em uma subclasse de Widget são sempre marcados como "final".
  final String title;

  // Cria o objeto de estado mutável para este widget.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// A classe de estado para MyHomePage. O "_" no início do nome a torna privada para a biblioteca.
class _MyHomePageState extends State<MyHomePage> {
  // Uma variável de estado para armazenar o número de vezes que o botão foi pressionado.
  int _counter = 0;

  // Um método que incrementa o contador.
  void _incrementCounter() {
    // setState() notifica o Flutter framework que o estado interno deste objeto mudou.
    // Isso faz com que o framework execute novamente o método build() abaixo para que a exibição possa refletir os valores atualizados.
    setState(() {
      _counter++;
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
            // Um widget de texto que exibe o valor atual do contador.
            Text(
              '$_counter',
              // Estiliza o texto usando o estilo headlineMedium do tema.
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // Um botão de ação flutuante.
      floatingActionButton: FloatingActionButton(
        // A função que é chamada quando o botão é pressionado.
        onPressed: _incrementCounter,
        // Um texto de dica que aparece quando o usuário passa o mouse sobre o botão.
        tooltip: 'Incrementar',
        // O ícone exibido no botão.
        child: const Icon(Icons.add),
      ),
    );
  }
}
