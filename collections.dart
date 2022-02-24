void main() {
  //List, Set, Map
  final emptyList = <int>[];
  final emptySet = <int>{};
  final emptyDict = <int, String>{};

  //List
  final heroes = <String>['Spiderman', 'Batman', 'Iron Man'];
  print(heroes.first);
  print(heroes.last);

  //List can has fixed length or growable
  final fixedList = List<int>.filled(5, 0);
  print(fixedList);
  fixedList[0] = 5;
  //can cause exception
  try {
    fixedList.add(10);
  } catch (e) {
    print(e.toString());
  }

  final growableList = <int>[1, 2];
  growableList.add(3);
  growableList.addAll({4, 5});
  print(growableList); //[1, 2, 3, 4, 5]

  growableList.removeLast();
  growableList.sort(((a, b) => b - a));
  print(growableList); //[4, 3, 2, 1]

  //Map
  final casts = <String, String>{
    "Aris": "Reza Rahadian",
    "Kinan": "Putri Marino",
    "Lidya": "Anya Geraldine"
  };
  print(casts["Aris"]); //Reza Rahadian
  print(casts["Lola"]); //null
  casts["Andre"] = "Marthino Lio";
  print(casts.keys.join(", ")); //Aris, Kinan, Lidya, Andre
  casts.remove("Andre");
  print(casts.keys.join(", ")); //Aris, Kinan, Lidya
}
