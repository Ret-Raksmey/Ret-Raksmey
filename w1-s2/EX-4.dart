void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni','pineapple'];
  // Your code
    double total = 0.0;
    bool allOnMenu = true;

  for (String pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
      allOnMenu = false;
    }
  }
   if (allOnMenu) {
    print('Total: \$${total.toStringAsFixed(2)}');
  }
}


       
