String addSpaceEveryFourChars(String input) {
  final result = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    result.write(input[i]);
    if ((i + 1) % 4 == 0 && i != input.length - 1) {
      result.write('   ');
    }
  }
  return result.toString();
}
