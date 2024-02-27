int hashGenerator(String input) {
  int hash = 0;
  for (int i = 0; i < input.length; i++) {
    hash = (31 * hash + input.codeUnitAt(i)) & 0xFFFFFFFF;
  }
  return hash;
}
