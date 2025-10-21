# Brasil, 2097 - Terminal Interativo

![Capa](https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/capa.png)

## 🚀 Sobre o Projeto

Este é um aplicativo Flutter que simula um terminal interativo, imerso no universo cyberpunk de "Brasil, 2097". A aplicação oferece uma experiência narrativa onde o usuário pode interagir com o sistema para desvendar a história, conhecer os personagens, ver uma história em quadrinhos digital e ouvir a uma playlist de músicas temáticas.

## 🌌 A História: Brasil, 2097

A história se passa no Brasil, 2097, uma megalópole onde a tecnologia avançou a níveis inimagináveis. A sociedade está rigidamente dividida: no topo, a Oligarquia Sintética, os donos do capital e governantes que se mantêm no poder desde a invasão e escravização do povo original.

Algoritmos de IA ajudam a controlar o sistema. Na Cidade Baixa, a maioria da população (os "TRASH-PUNKs!") vive na sombra digital, na miséria, forçados a roubar dados de empresas que não ligam para nada além de lucro e vender. Eles vivem do lixo tecnológico achado nas ruas e disputam por trabalhos precários com robôs ultrapassados.

Nosso protagonista, Ita, um ex-engenheiro de algoritmos que perdeu sua licença de cidadania do Japão após ficar doente e não poder mais trabalhar, agora chega de volta à cidade de Juguti-ES, depois de anos.

Ita agora quer viver abaixo dos radares, usar IA para automatizar sua vida e não forçar tanto a cabeça para empresas dos outros.

No Brasil, ele encontra uma aliada: Coral, uma netrunner que utiliza IAs de código aberto e "artefatos digitais" proibidos. Juntos, eles pretendem viver uma vida pacata, longe dos desafios impostos pelo sistema.

## ✨ Funcionalidades

- **Terminal Interativo:** Uma interface de linha de comando para interagir com o universo do jogo.
- **Exploração da História (Lore):** Descubra os segredos de Brasil, 2097 através do comando `lore`.
- **Perfis de Personagens:** Conheça os protagonistas e antagonistas com o comando `characters`.
- **Leitor de HQ Digital:** Visualize uma história em quadrinhos diretamente no terminal com o comando `hq`.
- **Player de Música Integrado:** Ouça uma playlist de músicas temáticas (Synthwave/Cyberpunk) com o comando `playlist`.
- **Design Cyberpunk:** Tema escuro com fontes monoespaçadas para uma imersão completa.

## ⚙️ Comandos Disponíveis

- `help`: Lista todos os comandos disponíveis.
- `lore`: Exibe a história e o plano de fundo do universo de "Brasil, 2097".
- `characters`: Mostra os perfis dos personagens principais.
- `hq`: Abre um visualizador com as páginas da história em quadrinhos.
- `playlist`: Exibe uma lista de músicas e permite que sejam tocadas em um player de vídeo do YouTube incorporado.
- `clear`: Limpa o histórico do terminal.
- `exit`: Fecha o aplicativo.

## 🛠️ Estrutura do Projeto

O projeto é organizado da seguinte forma:

- **`lib/main.dart`**: O ponto de entrada do aplicativo. Responsável pela inicialização do Flutter, configuração do tema geral e definição da tela inicial (`TerminalView`).

- **`lib/view/terminal_view.dart`**: Contém a interface principal do terminal. Gerencia a entrada de comandos do usuário e exibe o histórico de comandos e respostas.

- **`lib/controller/command_handler.dart`**: O cérebro do terminal. Processa e interpreta os comandos digitados pelo usuário, retornando a resposta apropriada.

- **`lib/model/`**: Contém as classes de modelo de dados da aplicação.
  - `app_data.dart`: Um arquivo central que armazena todos os dados estáticos, como a história (lore), informações dos personagens, links para as imagens da HQ e a lista de músicas.
  - `character.dart`: Define a estrutura de um personagem.
  - `image_data.dart`: Define a estrutura de uma página da HQ.
  - `music_track.dart`: Define a estrutura de uma faixa musical.

- **`lib/view/widgets/`**: Widgets reutilizáveis para exibir conteúdo específico.
  - `character_card.dart`: Widget para exibir as informações de um personagem.
  - `hq_viewer.dart`: Widget que exibe as imagens da HQ em um carrossel.
  - `music_player.dart`: Widget que contém o player de vídeo (WebView) para tocar as músicas do YouTube.

## 💻 Como Executar o Projeto

1. **Clone o repositório:**
   ```sh
   git clone <url-do-seu-repositorio>
   ```
2. **Entre na pasta do projeto:**
   ```sh
   cd <nome-do-projeto>
   ```
3. **Instale as dependências:**
   ```sh
   flutter pub get
   ```
4. **Execute o aplicativo:**
   ```sh
   flutter run
   ```

## 🌐 Build para Web

Para gerar uma versão de produção para a web, utilize o comando:

```sh
flutter build web
```

Isso criará a build na pasta `build/web`, pronta para ser hospedada em qualquer serviço de hospedagem estática, como o Firebase Hosting.

**Observação sobre o player de vídeo na web:**
Para que o player de vídeo do YouTube funcione corretamente na versão web, foi necessário adicionar a seguinte meta tag de Content Security Policy (CSP) no arquivo `web/index.html`:

```html
<meta http-equiv="Content-Security-Policy" content="frame-src https://www.youtube.com/">
```

## 🧑‍💻 Autor

Desenvolvido por **Geovane Bausen**.
