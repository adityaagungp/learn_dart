//Reuse code in multiple class
mixin Piloted {
  int pilot = 1;

  void describeCrew() {
    print("Number of pilots: $pilot");
  }
}

class Aircraft with Piloted {
  static const int maxPilot = 3;
  final String airline;
  String? _license;

  Aircraft(this.airline);

  void addPilot(int nPilot) {
    if (pilot < maxPilot) {
      pilot = (pilot + nPilot > maxPilot) ? maxPilot : pilot + nPilot;
    }
  }

  set license(String? value) {
    _license ??= value;
  }

  @override
  String toString() => "${airline} airlines with license ${_license ?? ""}.";
}

void main() {
  final Aircraft plane = Aircraft("Garuda");
  plane.addPilot(5);
  plane.describeCrew();
  print(plane); //won't print license number

  plane.license = "AX 4545";
  print(plane);

  plane.license = "BY 2323"; //won't change license
  print(plane);
}
