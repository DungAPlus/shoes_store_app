import 'dart:math';

String generateRandomString(int n) {
  const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numbers = '0123456789';

  Random random = Random();

  // Chọn một chữ cái in thường ngẫu nhiên
  String randomLowercaseLetter =
      lowercaseLetters[random.nextInt(lowercaseLetters.length)];

  // Chọn một chữ cái in hoa ngẫu nhiên
  String randomUppercaseLetter =
      uppercaseLetters[random.nextInt(uppercaseLetters.length)];

  // Chọn một số ngẫu nhiên
  String randomNumber = numbers[random.nextInt(numbers.length)];

  // Tạo chuỗi ngẫu nhiên bằng cách kết hợp chữ cái và số
  String randomString =
      '$randomNumber$randomLowercaseLetter$randomUppercaseLetter';

  // Tạo thêm (n-3) ký tự ngẫu nhiên nữa
  for (int i = 0; i < n - 3; i++) {
    int randomType = random.nextInt(3); // 0: lowercase, 1: uppercase, 2: number
    String randomChar = '';
    switch (randomType) {
      case 0:
        randomChar = lowercaseLetters[
            random.nextInt(lowercaseLetters.length)]; // Chọn chữ cái in thường
        break;
      case 1:
        randomChar = uppercaseLetters[
            random.nextInt(uppercaseLetters.length)]; // Chọn chữ cái in hoa
        break;
      case 2:
        randomChar = numbers[random.nextInt(numbers.length)]; // Chọn số
        break;
    }
    randomString += randomChar;
  }

  return randomString;
}

String generateRandomNumberString(int n) {
  Random random = Random();
  String result = '';

  for (int i = 0; i < n; i++) {
    int randomNumber = random.nextInt(10); // Số ngẫu nhiên từ 0 đến 9
    result += '$randomNumber';
  }

  return result;
}
