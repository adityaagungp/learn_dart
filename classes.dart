import 'dart:math';

class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  //Default constructor
  //Bicycle(this.cadence, this.speed, this.gear);

  //Constructor if speed is private
  Bicycle(this.cadence, this.gear);

  //Getter
  int get speed => _speed;

  @override
  String toString() => 'Bicycle: $_speed mph';

  void applyBrake(int dec) {
    _speed -= dec;
  }

  void speedUp(int inc) {
    _speed += inc;
  }
}

class Rectangle {
  int width;
  int height;
  Point origin;

  //Optional parameters
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  //Example of string interpolation
  @override
  String toString() =>
      'Origin (${origin.x}, ${origin.y}), width: $width, height: $height';
}

class Square extends Rectangle {
  Square(Point origin, int length)
      : super(origin: origin, width: length, height: length);

  Square.unit() : super(width: 1, height: 1);
}

void main() {
  //Bicycle test
  var bike = Bicycle(2, 1);
  print(bike);

  //Rectangle test
  print(Rectangle(origin: const Point(10, 10), width: 20, height: 50));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 20, height: 50));
  print(Rectangle());

  //Square test
  print(Square(Point(5, 5), 10));
  print(Square.unit());

  //Cascading code test
  print('===== Cascading code test =====');
  var rect = Rectangle();
  print(rect);

  rect
    ..origin = const Point(4, 4)
    ..height = 10
    ..width = 5;
  print(rect);
}
