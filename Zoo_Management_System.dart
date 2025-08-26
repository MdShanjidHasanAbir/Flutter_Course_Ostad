// Abstract class
abstract class Animal {
  String _name; // private field

  Animal(this._name); // constructor

  void makeSound(); // Abstract method

  // Concrete method
  String getName() => _name;
}

// Lion class
class Lion extends Animal {
  double _maneSize; // private property

  Lion(String name, double maneSize) : _maneSize = maneSize, super(name);

  double get maneSize => _maneSize;

  set maneSize(double value) {
    if (value > 0) {
      _maneSize = value;
    } else {
      print("Invalid mane size for ${getName()}");
    }
  }

  @override
  void makeSound() {
    print("Rooooaaarrrr!!!!!!!");
  }
}

// Elephant class
class Elephant extends Animal {
  double _trunkLength; // private property

  Elephant(String name, double trunkLength) : _trunkLength = trunkLength, super(name);

  double get trunkLength => _trunkLength;

  set trunkLength(double value) {
    if (value > 0) {
      _trunkLength = value;
    } else {
      print("Invalid trunk length for ${getName()}");
    }
  }

  @override
  void makeSound() {
    print("Trumpet!!!!!!");
  }
}

// Parrot class
class Parrot extends Animal {
  int _vocabularySize; // private property

  Parrot(String name, int vocabularySize)
      : _vocabularySize = vocabularySize >= 0 ? vocabularySize : 0,
        super(name);

  int get vocabularySize => _vocabularySize;

  set vocabularySize(int value) {
    if (value >= 0) {
      _vocabularySize = value;
    } else {
      print("Vocabulary size cannot be negative for ${getName()}");
    }
  }

  @override
  void makeSound() {
    print("Hello mr..!!!");
  }
}

void main() {

  List<Animal> zoo = [];

  zoo.add(Lion("Simba", 25.5));
  zoo.add(Elephant("Moti Miya", 150.0));
  zoo.add(Parrot("Bacchu", 100));

  for (var animal in zoo) {
    print("Animal: ${animal.getName()}");

    if (animal is Lion) {
      print("Mane Size: ${animal.maneSize} cm");
    } else if (animal is Elephant) {
      print("Trunk Length: ${animal.trunkLength} cm");
    } else if (animal is Parrot) {
      print("Vocabulary Size: ${animal.vocabularySize} words");
    }

    print("Sound: ");
    animal.makeSound();
    print("-------------------");
  }
}
