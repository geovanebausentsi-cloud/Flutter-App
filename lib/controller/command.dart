import 'package:flutter/material.dart';
import '../model/app_data.dart';
import '../view/playlist_view.dart';

abstract class Command {
  final String name;
  final String description;
  final Terminal terminal;

  Command(this.name, this.description, this.terminal);

  void execute(List<String> args);
}

class Terminal {
  final Function(List<Widget>) onOutputChanged;
  final BuildContext context;
  final _output = <Widget>[];

  Terminal({required this.onOutputChanged, required this.context});

  void printOutput(String text) {
    _output.add(Text(text, style: TextStyle(color: Colors.white)));
    onOutputChanged(List.from(_output));
  }

  void printHTML(Widget widget) {
    _output.add(widget);
    onOutputChanged(List.from(_output));
  }

  void clear() {
    _output.clear();
    onOutputChanged(List.from(_output));
  }

  void navigateTo(Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class CommandHandler {
  final Terminal terminal;
  final Map<String, Command> _commands = {};

  CommandHandler(this.terminal) {
    _registerCommands();
  }

  void _registerCommands() {
    final commands = [
      HelpCommand(terminal, []),
      AboutCommand(terminal),
      CharactersCommand(terminal),
      GalleryCommand(terminal),
      ClearCommand(terminal),
      PlaylistCommand(terminal),
    ];
    for (var cmd in commands) {
      _commands[cmd.name] = cmd;
    }
    // This is a bit of a hack to give the help command access to all commands
    // after they have been registered.
    (_commands['help'] as HelpCommand)._allCommands = commands;
  }

  void execute(String commandString) {
    terminal.printOutput('> $commandString');
    final parts = commandString.trim().split(' ');
    final commandName = parts[0];
    final args = parts.length > 1 ? parts.sublist(1) : <String>[];

    final command = _commands[commandName];
    if (command != null) {
      command.execute(args);
    } else {
      terminal.printOutput("Comando não encontrado: '$commandName'. Digite 'help' para ver a lista de comandos.");
    }
  }
}

class HelpCommand extends Command {
  List<Command> _allCommands;

  HelpCommand(Terminal terminal, this._allCommands)
      : super("help", "Mostra a lista de comandos disponíveis.", terminal);

  @override
  void execute(List<String> args) {
    terminal.printOutput("--- Guia de Comandos: XCellCorp V2097 ---");
    for (var cmd in _allCommands) {
      terminal.printOutput("> ${cmd.name}: ${cmd.description}");
    }
    terminal.printOutput("---------------------------------------");
  }
}

class AboutCommand extends Command {
  AboutCommand(Terminal terminal)
      : super("about", "Exibe a história (lore) do universo de Brasil, 2097.",
            terminal);

  @override
  void execute(List<String> args) {
    terminal.printOutput("[SOBRE O UNIVERSO DE BRASIL, 2097]");
    terminal.printOutput(AppData.LORE);
  }
}

class CharactersCommand extends Command {
  CharactersCommand(Terminal terminal)
      : super(
            "personagens", "Mostra informações sobre os personagens.", terminal);

  @override
  void execute(List<String> args) {
    terminal.printOutput("--- Personagens da Trama ---");
    for (var char in AppData.CHARACTERS) {
      terminal.printOutput("> ${char.name} (${char.role}) - Status: ${char.status}");
    }
    terminal.printOutput("--------------------------");
  }
}

class GalleryCommand extends Command {
  GalleryCommand(Terminal terminal)
      : super("gallery",
            "Exibe uma página da HQ. Uso: gallery [numero] ou gallery all", terminal);

  @override
  void execute(List<String> args) {
    if (args.isEmpty) {
      terminal.printOutput("Uso: gallery [numero] ou gallery all");
      return;
    }

    final arg = args[0];

    if (arg == 'all') {
      terminal.printOutput("[CARREGANDO TODAS AS PÁGINAS...]");
      for (var i = 0; i < AppData.HQ_IMAGES.length; i++) {
        final imageData = AppData.HQ_IMAGES[i];
        final pageNum = i + 1;
        terminal.printOutput("[PÁGINA $pageNum / ${AppData.HQ_IMAGES.length}]");
        terminal.printHTML(Image.network(imageData.path));
        terminal.printOutput(">> Título: ${imageData.title}");
        terminal.printOutput(">> ${imageData.description}");
        terminal.printOutput(" ");
      }
      return;
    }

    final pageNum = int.tryParse(arg);

    if (pageNum == null || pageNum < 1 || pageNum > AppData.HQ_IMAGES.length) {
      terminal.printOutput("ERRO: Página '$arg' inexistente. Tente um número de 1 a ${AppData.HQ_IMAGES.length} ou 'all'.");
      return;
    }

    final imageData = AppData.HQ_IMAGES[pageNum - 1];

    terminal.printOutput("[CARREGANDO PÁGINA $pageNum / ${AppData.HQ_IMAGES.length}]");
    terminal.printHTML(Image.network(imageData.path));
    terminal.printOutput(">> Título: ${imageData.title}");
    terminal.printOutput(">> ${imageData.description}");
  }
}

class ClearCommand extends Command {
  ClearCommand(Terminal terminal)
      : super("clear", "Limpa a tela do terminal.", terminal);

  @override
  void execute(List<String> args) {
    terminal.clear();
  }
}

class PlaylistCommand extends Command {
  PlaylistCommand(Terminal terminal)
      : super("playlist", "Abre a sua playlist de músicas.", terminal);

  @override
  void execute(List<String> args) {
    terminal.navigateTo(const PlaylistView());
  }
}
