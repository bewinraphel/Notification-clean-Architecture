import 'package:boardingweek/icons/cart.dart';
import 'package:boardingweek/icons/doubleAcount.dart';
import 'package:flutter/material.dart';
import 'package:boardingweek/icons/gregorIcons.dart';

enum AppTab {
  home,
  cart,
  myorder,
  account;

 
  String get path {
    switch (this) {
      case AppTab.home:
        return '/home';
      case AppTab.cart:
        return '/cart';
      case AppTab.myorder:
        return '/myorder';
      case AppTab.account:
        return '/account';
    }
  }

  String get label {
    switch (this) {
      case AppTab.home:
        return 'Home';

      case AppTab.cart:
        return 'Cart';
      case AppTab.myorder:
        return 'My Order';
      case AppTab.account:
        return 'Account';
    }
  }

  IconData get icon {
    switch (this) {
      case AppTab.home:
        return GregorIcons.store;
      case AppTab.cart:
        return Cart.cart;
      case AppTab.myorder:
        return Icons.shopping_bag_outlined;
      case AppTab.account:
        return DoubleAccount.users;
    }
  }
}
