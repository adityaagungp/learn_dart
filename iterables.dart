class Villain {
  final String name;
  final bool deceased;

  Villain(this.name, this.deceased);

  @override
  String toString() => "$name is ${deceased ? "dead" : "still alive"}";
}

void main() {
  Iterable<Villain> villains = [
    Villain('Ultron', true),
    Villain('Hela', true),
    Villain('Thanos', true),
    Villain('Sandman', false)
  ];
  print("Last villain is ${villains.last.name}.");

  final foundVillain =
      villains.firstWhere((element) => element.name.startsWith('T'));
  print(foundVillain); //Thanos
  final notFoundVillain = villains.firstWhere(
    (element) => element.name.startsWith('L'),
    orElse: () => Villain("L", false),
  );
  print(notFoundVillain); //if no orElse provided, will throw StateError
  final firstAliveVillain = villains.firstWhere((element) => !element.deceased);
  print(firstAliveVillain); //print Sandman

  //Checking conditions: any and every, applicable to List too
  final bool allDeceased = villains.every((element) => element.deceased);
  print(allDeceased);

  final bool hasAliveVillain = villains.any((element) => !element.deceased);
  print(hasAliveVillain);

  //Filtering
  final deceasedVillains = villains.where((element) => element.deceased);
  deceasedVillains.forEach((element) {
    print(element);
  });

  //Map
  final info = villains.map((e) => e.toString());
  info.forEach((element) {
    print(element);
  });
}
