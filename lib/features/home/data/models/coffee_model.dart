class CoffeeModel {}

//1 => String categoryName
//2 => String description
//3 => List<CoffeeSize> coffeeSize
//4 => double rate
//5 => double volume
//6=> double price
//7=> int quantity



///create a final attributes and create a constructor with required parameters.
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*create one method that returns a CaffeeModel with all the attributes but takes the parameters 
    as arguments and if the parameters are null, use the default values.=>liske this if we have this Model:
class Student{ final String name,final int age;}
the method like this=>  Student copyWith({String? name, int? age}) => Student(name: name??this.name, age: age??this.age);
*/