import 'dart:math';

int generateRandomNumber() {
  final random = Random();
  return 100000 +
      random.nextInt(900000 - 100000); // generate a random 6-digit number
}
