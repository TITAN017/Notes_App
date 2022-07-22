//import 'dart:async';

void main() async {
  print('Main program');
  print(await Future.delayed(Duration(seconds: 2), () {
    print("Hello woeld");
  }));
  print(await printfile());
  print('End');
}

Future<int> printfile() async {
  await file();
  print('Async fucntion');
  String f = await file();
  print(f);
  print('awaiting...');
  return 1;
}

Future<String> file() {
  return Future.delayed(
    const Duration(seconds: 5),
    () {
      return 'my file';
    },
  );
}
