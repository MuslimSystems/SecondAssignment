import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class CardProvider extends ChangeNotifier{
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggeleProduct(Product product){
    if(_cart.contains(product)){
      for(Product element in _cart){
        element.quantity++;
      }
    }else{
      _cart.add(product);
    }
    notifyListeners();
  }
  incrementQuantity(int index)=> _cart[index].quantity++;
  decrementprovider(int index){
    _cart[index].quantity--;
    if(_cart[index].quantity < 1){
       _cart.remove(_cart[index]);
    }
  }
  getTotal(){
    double total = 0.0;
    for(Product element in _cart){
      total += element.price * element.quantity;
    }
    return total;
  }
  static CardProvider of(
    BuildContext context,{
      bool listen = true,
    })
    {
      return Provider.of<CardProvider>(
        context,
        listen: listen,
      );
    }
}