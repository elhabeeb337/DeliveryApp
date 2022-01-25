import 'dart:math';

//calculate delivery fee total

double feeCalc(
    double cartValue, double distance, int itemsNum, DateTime transactionTime) {
  double totalDeliveryFee = 0.0;
  const double kMaxDeliveryFee = 15;
  //First senario (no cart value or item to deliver)
  if (cartValue == 0.0 && itemsNum == 0.0) {
    return totalDeliveryFee;
  }
  //Second senario (with cartValue < 100)
  if (cartValue < 100) {
    totalDeliveryFee = surchargeCartValue(cartValue) +
        distanceFee(distance) +
        surchargeOnItemsNum(itemsNum);

    //Third senario (Friday rush hour)
    bool rushHr = isRushHr(transactionTime);
    if (rushHr) {
      totalDeliveryFee = totalDeliveryFee * 1.1;
    }
  }
  return min(totalDeliveryFee, kMaxDeliveryFee);
    }

  //Adding surcharge when cartValue < 10
  double surchargeCartValue(double cartValue) {
    const double kMinDeliveryFee = 10;

    if (cartValue < kMinDeliveryFee) {
      return kMinDeliveryFee - cartValue;
    }
    return 0.0;
  }

  // Distance fee calculation
  double distanceFee(double distance) {
    const double kMinDistance = 1000;
    const double kMinDistanceFee = 2;
    const double kAddDistance = 500;

    if (distance < kMinDistance) {
      return kMinDistanceFee;
    }
    return kMinDistanceFee + ((distance - kMinDistance) / kAddDistance).ceil();
  }

  //Adding Surcharge when itemNum > 4
  double surchargeOnItemsNum(int itemsNum) {
    double itemSurcharge = 0.0;
    const double kItemsurcharge = 0.50;

    if (itemsNum > 4) {
      itemSurcharge = ((itemsNum - 4) * kItemsurcharge);
   }
    return itemSurcharge;
  }

//Friday rush hour
  bool isRushHr(DateTime transactionTime) {
    bool isFridayRush = false;

    if ((transactionTime.weekday == DateTime.friday) &&
        (15 <= transactionTime.hour) &&
        (transactionTime.hour <= 19)) {
      isFridayRush = true;
    }

    return isFridayRush;
  }

