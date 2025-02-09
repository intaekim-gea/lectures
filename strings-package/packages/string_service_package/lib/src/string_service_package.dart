class StringServicePackage {
  final strings = <String>[];

  Future<List<String>> retrieveAllData() async {
    return strings;
  }

  Future<void> addString(String newString) async {
    strings.add(newString);
  }
}
