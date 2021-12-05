class StaticDataStore {
  static const String HOST = "10.9.208.154";
  static const int PORT = 8080;
  static const String SCHEME = "http://";
  static String get URI {
    return "$SCHEME$HOST:$PORT";
  }

  static String TOKEN = "";
}
