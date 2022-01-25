import 'dart:io';
import 'delivery_app.dart';

// The variables used to calculate the Fee.
double cartValue = 0.0, distance = 0.0;
int itemsNum = 0;

void main() {

   print("Enter cart value");
  cartValue = double.parse(stdin.readLineSync()!);

  print("Enter the amount of items");
  itemsNum = int.parse(stdin.readLineSync()!);

  print("Enter distance in meters");
  distance = double.parse(stdin.readLineSync()!);

  print("Enter delivery date and time in the format YYYYMMDD HHMMSS");
  DateTime transactionTime = DateTime.parse(stdin.readLineSync()!);

  // to calculate delivery fee
  double totalDeliveryFee = feeCalc(cartValue, distance, itemsNum, transactionTime);
  print("Delivery totalDeliveryFee is $totalDeliveryFee");
}
