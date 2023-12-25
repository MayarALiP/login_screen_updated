class Vehicle {
  String brand;
  int year;

  // Default constructor
  Vehicle(this.brand, this.year);

  // Named constructor
  Vehicle.myNamedConstructor(this.brand, this.year);

  void start() {
    print('vooh vooh ----> Vehicle is starting...');
  }

  void stop() {
    print('EEEEeH ----> Vehicle is stopping...');
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  // Default constructor using super
  Car(String brand, int year, this.numberOfDoors) : super(brand, year);

  // Named constructor in the child class
  Car.customConstructor(String brand, int year, this.numberOfDoors)
      : super.myNamedConstructor(brand, year);

  @override
  void start() {
    print('Car is starting...');
   // Using super to call the parent class method
    super.start();
  }
}

class Truck extends Vehicle {
  double payloadCapacity;

  // Default constructor using super
  Truck(String brand, int year, this.payloadCapacity) : super(brand, year);

  @override
  void stop() {
    print('Truck is stopping... Check payload before exiting.');
    super.stop();
  }
}

class Motorcycle extends Vehicle {
  // Default constructor using super
  Motorcycle(String brand, int year) : super(brand, year);

  // Named constructor in the child class
  Motorcycle.customConstructor(String brand, int year)
      : super.myNamedConstructor(brand, year);
}

void main() {
  // Creating instances of the child classes
  Car myCar = Car('Toyota', 2022, 4);
  Truck myTruck = Truck('Ford', 2020, 1500.0);
  Motorcycle myMotorcycle = Motorcycle('Harley-Davidson', 2021);

  // Using the instances
  myCar.start();
  myCar.stop();

  print('---');

  myTruck.start();
  myTruck.stop();

  print('---');

  myMotorcycle.start();
  myMotorcycle.stop();
}
