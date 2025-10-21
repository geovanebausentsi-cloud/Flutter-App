
import 'character.dart';
import 'image_data.dart';
import 'music_track.dart';

class AppData {
  static const String LORE =
      "A história se passa no Brasil, 2097, uma megalópole onde a tecnologia avançou a níveis inimagináveis. A sociedade está rigidamente dividida: no topo, a Oligarquia Sintética os donos do capital governantes que desde a invasão e escravização do povo original se mantem no poder.\n\nAlgoritmos de IA ajudam a controlar o sistema. Na Cidade Baixa, a maioria da população (os \"TRASH-PUNKs!\") vivem na sombra digital, na miséria, forçados a roubar  dados de empresas que não ligam pra nada alem de lucro e vender, vivem do lixo tecnológico achado nas ruas e disputam por trabalhos precários com robos ultrapassados.\n\nNosso protagonista, Ita, um ex-engenheiro de algoritmos que perdeu sua licença de cidadania do Japão após ficar doente e não poder mais trabalhar, agora ele chega de volta à cidade de Juguti-ES, depois de anos.\n\nIta agora quer viver abaixo dos radares usar IA para automatizar sua vida e não forçar tanto a cabeça para empresas dos outros.\n\nNo Brasil ele encontra uma aliada: Coral, uma netrunner que utiliza IAs de código aberto e \"artefatos digitais\" proibidos. Juntos, eles pretendem viver uma vida pacata longe de desafios impostos pelo sistema.";

  static final List<ImageData> HQ_IMAGES = [
    ImageData(
        title: "capa: Brasil, 2097",
        description: "capa",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/capa.png"),
    ImageData(
        title: "Página 1: Chegada na cidade",
        description:
            "Ita retorna, vendo a miséria na Cidade Baixa. Mais fica feliz qunado encontra sua amiga Coral.",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/1.png"),
    ImageData(
        title: "Página 2: Encontro com Mari",
        description:
            "Mari, a netrunner, tem uma conversa com Ita sobre a Existencia'.",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/2.png"),
    ImageData(
        title: "Página 3:  Encontro com Mari 2",
        description:
            "Mari, a netrunner, tem uma conversa com Ita sobre a Existencia'.",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/3.png"),
    ImageData(
        title: "Página 4: Ansiedade",
        description: "Ita se apresentara em minutos.",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/4.png"),
    ImageData(
        title: "Página 5: show",
        description: "Ita se apresenta e deixa todo mundo feliz e se divertindo.",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/5.png"),
    ImageData(
        title: "Página 6: Meditação ativa",
        description: "Coral e uma amiga dançam com a alma.",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/6.png"),
    ImageData(
        title: "Página 7: A Fuga",
        description:
            "Coral e uma amiga dançam com a alma. \nNa próximo capítulo Ita e Coral conhecem dj Thot...",
        path: "https://cdn.jsdelivr.net/gh/geovanebausentsi-cloud/IAHQ@2bb8169/src/img/cena1/8.png"),
  ];

  static final List<Character> CHARACTERS = [
    Character(
        name: "Ita",
        status: "Procurado/Des-Licenciado",
        role: "Ex-Engenheiro de Algoritmos"),
    Character(
        name: "Coral",
        status: "Anonimo/Oculto",
        role: "Netrunner (Ciberativista)"),
    Character(
        name: "Oligarquia Sintética",
        status: "Governante/Intocável",
        role: "Elite do Capital"),
  ];

  static final List<MusicTrack> PLAYLIST = [
    MusicTrack(
      title: "Linkin Park - Given Up Live In Clarkston",
      artist: "Linkin Park",
      url: "https://www.youtube.com/watch?v=aHPaee9Xz3g",
      videoId: "aHPaee9Xz3g",
    ),
    MusicTrack(
      title: "Somewhere I Belong – Linkin Park",
      artist: "Geovane Bausen",
      url: "https://www.youtube.com/watch?v=zsCD5XCu6CM",
      videoId: "zsCD5XCu6CM",
    ),
    MusicTrack(
      title: "P.O.D. - Youth of the Nation",
      artist: "P.O.D.",
      url: "https://www.youtube.com/watch?v=EDKwCvD56kw",
      videoId: "EDKwCvD56kw",
    ),
    MusicTrack(
      title: "Lil Peep - JUST IN CASE",
      artist: "Lil Peep",
      url: "https://www.youtube.com/watch?v=UGp1Lv333BQ",
      videoId: "UGp1Lv333BQ",
    ),
  ];
}
