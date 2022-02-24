import 'dart:math';

//Example of Future wrapping a type
Future<String> createMessage() async {
  try {
    final message = await fetchMessage();
    return 'Message: $message';
  } catch (e) {
    return '';
  }
}

Future<String> fetchMessage() async {
  final random = Random();
  return Future.delayed(
      const Duration(seconds: 2),
      () => (random.nextInt(100) % 2 == 0)
          ? throw Exception("Can't fetch message")
          : "Hello!");
}

//Approach 2: no try - catch closure
Future<String?> createMessage2() async {
  final message = await fetchMessage2();
  return message;
}

Future<String?> fetchMessage2() async {
  final random = Random();
  return Future.delayed(const Duration(seconds: 2),
      () => (random.nextInt(100) % 2 == 0) ? null : "Hello!");
}

Future<void> main() async {
  print("Fetching message");
  final message = await createMessage();
  if (message.isEmpty) {
    print("No message fetched");
  } else {
    print(message);
  }

  print("Fetching mesasge 2");
  final message2 = await createMessage2();
  if (message2 != null) {
    print(message2);
  } else {
    print("No message fetched");
  }
}
