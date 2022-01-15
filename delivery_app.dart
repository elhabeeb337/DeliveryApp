import 'dart:io';

void main() {
  print("enter unit of item");
  int? unit = int.parse(stdin.readLineSync()!);

  print("enter price of item");
  double? price = double.parse(stdin.readLineSync()!);

  double cartvalue = (unit * price);
  if (cartvalue <= 10) {
    print(10);
  } else {
    print((cartvalue));
  }

  print("enter store to customer distance in meters");
  int? distance = int.parse(stdin.readLineSync()!);
  const int basefee = 2;

  bool isUnitGreaterThan5 = true;
  bool isDeliveryFeelessThan15 = true;
  bool extraunit = unit > 4;

  if (cartvalue >= 100) {
    print("no delivery cost");
  } else if (isUnitGreaterThan5) {
    if (isDeliveryFeelessThan15) {
      if (extraunit) {
        print((basefee + ((distance / 500).ceil() - 2)) + ((unit - 4) * 0.5));
      } else {
        print(basefee + (distance / 500).ceil() - 2);
      }
    }
  }
  print("enter day the week");
  int? dayhour = int.parse(stdin.readLineSync()!);
  final int friday = 5;
  var rushhour = DateTime(5);
  bool isrushhour = true;

//
  //var time = DateTime.now();
  //var fridayrush = DateTime.friday;
  //bool isrushhour = true;
  //bool isfridayrush = true;

  if (isUnitGreaterThan5) {
    if (isDeliveryFeelessThan15) {
      if (extraunit) {
        if (isrushhour) {
          print((basefee + ((distance / 500).ceil() - 2)) +
              ((unit - 4) * 0.5) * 1.1);
        }
      } else if (isDeliveryFeelessThan15 && isrushhour) {
          print(((basefee + (distance / 500).ceil() - 2) * 1.1));
        }  
      } 
    }
  }
