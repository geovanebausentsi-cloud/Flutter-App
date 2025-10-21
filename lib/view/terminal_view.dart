import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/controller/command.dart';

class TerminalView extends StatefulWidget {
  @override
  _TerminalViewState createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  final _textController = TextEditingController();
  late final Terminal _terminal;
  late final CommandHandler _commandHandler;
  List<Widget> _output = [];

  @override
  void initState() {
    super.initState();
    _terminal = Terminal(
      onOutputChanged: (output) {
        setState(() {
          _output = output;
        });
      },
      context: context,
    );
    _commandHandler = CommandHandler(_terminal);
    _terminal.printOutput("Bem-vindo ao Brasil, 2097. Digite 'help' para começar.");
  }

  void _handleCommand(String command) {
    _commandHandler.execute(command);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _output.length,
                itemBuilder: (context, index) => _output[index],
              ),
            ),
            TextField(
              controller: _textController,
              autofocus: true,
              style: GoogleFonts.robotoMono(color: Colors.white),
              cursorColor: Colors.green,
              decoration: InputDecoration(
                prefixText: '> ',
                prefixStyle: GoogleFonts.robotoMono(color: Colors.green, fontSize: 16),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onSubmitted: _handleCommand,
            ),
          ],
        ),
      ),
    );
  }
}
