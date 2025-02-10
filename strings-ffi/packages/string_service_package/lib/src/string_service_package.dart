class StringServicePackage {
  final _strings = <String>[];

  Future<List<String>> retrieveAllData() async {
    return _strings;
  }

  Future<void> addString(String newString) async {
    _strings.add(newString);
  }
}
