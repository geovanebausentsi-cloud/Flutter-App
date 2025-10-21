
# Blueprint: Interactive Terminal in Flutter

## 1. Project Overview

This document outlines the plan to build an interactive terminal interface within a Flutter application. The terminal will replicate the functionality of the provided JavaScript-based terminal, allowing users to interact with a fictional universe ("Brasil, 2097") through a command-line interface.

## 2. Style, Design, and Features

### Core Components:
- **Terminal View**: A full-screen, scrollable view that displays command history and output.
- **Input Field**: A persistent text input field at the bottom of the screen for entering commands.
- **Command Handling**: A robust system based on the Command design pattern to process user input and execute corresponding actions.

### Visual Design:
- **Theme**: A dark theme to emulate a classic terminal look and feel.
- **Typography**: A monospaced font (like `Roboto Mono` from `google_fonts`) for terminal output to enhance readability and aesthetics.
- **Layout**: A clean, structured layout with a clear distinction between input and output sections.
- **Imagery**: The gallery command will display images. Placeholder images will be used initially.

### Implemented Commands:
- **`help`**: Lists all available commands and their descriptions.
- **`about`**: Displays the lore and background story of the "Brasil, 2097" universe.
- **`personagens`**: Shows details about the key characters.
- **`gallery [numero | all]`**: Displays one or all pages of the associated comic book/graphic novel.
- **`clear`**: Clears the terminal screen.

## 3. Current Plan: Initial Implementation

This is the plan to create the interactive terminal from scratch.

### Steps:
1.  **Create `lib/data.dart`**: Translate the story, character, and image data from the provided `DATA.js` into Dart data structures. Placeholder image URLs will be used since local asset creation is not possible.
2.  **Add `google_fonts` dependency**: To use a monospaced font for the terminal text.
3.  **Create `lib/command.dart`**:
    *   Define an abstract `Command` class that acts as an interface for all specific commands.
    *   Implement concrete command classes (`HelpCommand`, `AboutCommand`, `CharactersCommand`, `GalleryCommand`, `ClearCommand`) that extend the `Command` class.
    *   Create a `CommandHandler` class to register all commands and execute them based on user input.
4.  **Create `lib/terminal_view.dart`**:
    *   Build the primary UI for the terminal as a `StatefulWidget`.
    *   This widget will manage the terminal's state, including the list of output widgets and the input `TextEditingController`.
    *   It will render the output using a `ListView` and handle user input submission.
    *   It will integrate the `CommandHandler` to process commands.
5.  **Update `lib/main.dart`**:
    *   Remove the existing counter application code.
    *   Set up a `MaterialApp` with a dark theme.
    *   Set the `TerminalView` as the home screen of the application.
