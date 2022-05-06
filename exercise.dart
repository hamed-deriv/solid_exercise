abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() => width * height;
}

class UnknownShape extends Shape {
  @override
  double calculateArea() =>
      throw UnimplementedError('area method is not implemented.');
}

class Calculator {
  void calculate(Object shape) {
    if (shape is Circle) {
      print('Circle area: ${shape.calculateArea()}');
    } else if (shape is Rectangle) {
      print('Rectangle area: ${shape.calculateArea()}');
    } else if (shape is UnknownShape) {
      print('UnknownShape area: ${shape.calculateArea()}');
    }
  }

  void printType(Object shape) => print('Shape name: ${shape.runtimeType}');
}

void main(List<String> args) {
  final List<Shape> shapes = [Circle(4), Rectangle(3, 5), UnknownShape()];

  final Calculator calculator = Calculator();

  for (Object shape in shapes) {
    calculator.printType(shape);
    calculator.calculate(shape);
  }
}
