import 'dart:math';

void main(List<String> arguments) {
  // exampleOne(arguments);
  // try { distanceTo(Point(2, 4)); } catch (e) { print(e); }
  variablesExample();
  fibonacci(20);
}


void distanceTo(Point other) => throw UnimplementedError();

void exampleOne(List<String> arguments){
  var boolValue = Random().nextBool();

  // assert(boolValue, "Random Chance");

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  print('Hello, World! + $arguments');

  int? lineCount;
  assert(lineCount == null);

  // Custom errors can be thrown
  // throw 'Out of llamas';

  /*
  use "on" to specify the error type
  use "catch" to return error type
  i.e. "on Exception catch (e)"
   */
  try
  { assert(true, "Try Catch Test"); }
  catch (e)
      { print("Assertion Error caught: $e"); }
}

void variablesExample() {
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };
  print(name 
      + year.toString() + '\n' 
      + antennaDiameter.toString() + '\n' 
      + flybyObjects.toString() + '\n'
      + image.toString() + '\n'
      + image['tags'].toString() + '\n'
      + image['url'].toString() + '\n'
  );
  
  controlFlowExample(year, flybyObjects);
}

void controlFlowExample(int year, List<String> flybyObjects) {
  
  if (year >= 2001) { print('21st century'); }
  else if (year >= 1901) { print('20th century'); }

  print('\n');
  
  for (final object in flybyObjects) {
    print(object);
  }

  print('\n');
  
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  
  print('\n');
  
  while (year < 2016) {
    print(year);
    year += 1;
  }

  print('\n');

  // Lambda expression => is useful when you need a function that contains a 
  // single statement. Easy to pass complex functions as arguments.
  flybyObjects.where((name) => 
      name.contains('turn'))
      .forEach(print);
}


int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
