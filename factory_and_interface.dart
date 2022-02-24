import 'dart:math';

abstract class Shape {
  num get area;

  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw "Can't create $type.";
  }
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);

  //implement getter
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);

  //implement getter
  //can be used to declare computed property
  num get area => pow(side, 2);
}

//Factory Pattern 1: Top level function
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);

  //exception, should be caught at try-catch statement
  throw "Can't create $type.";
}

//Interface: every class defines an interface
class CircleMock implements Circle {
  final num area = 0; //implements area getter
  final num radius = 0;
}

void main() {
  //Factory Pattern 1
  final circle = shapeFactory('circle');
  final square = shapeFactory('square');
  //to catch exception
  //final anon = shapeFactory('triangle');
  print(circle.area);
  print(square.area);

  //Factory pattern 2
  final circle2 = Shape('circle');
  final square2 = Shape('square');
}
