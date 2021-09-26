class Language {
  int id;
  String name;
  String languageCode;
  String flag;

  Language(this.id, this.name, this.languageCode, this.flag);

  static List<Language> getLanguages() {
    return <Language>[
      Language(0, 'English', 'en', 'Images/News/flags/ic_us.png'),
      Language(1, 'Hindi', 'hi', 'Images/News/flags/ic_india.png'),
      Language(2, 'Spanish', 'es', 'Images/News/flags/ic_spain.png'),
      Language(3, 'Afrikaans', 'af', 'Images/News/flags/ic_south_africa.png'),
      Language(4, 'French', 'fr', 'Images/News/flags/ic_france.png'),
      Language(5, 'German', 'de', 'Images/News/flags/ic_germany.png'),
      Language(6, 'Indonesian', 'id', 'Images/News/flags/ic_indonesia.png'),
      Language(7, 'Portuguese', 'pt', 'Images/News/flags/ic_portugal.png'),
      Language(8, 'Turkish', 'tr', 'Images/News/flags/ic_turkey.png'),
    ];
  }
}