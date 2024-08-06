import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_app/model/cartmanager.dart';

import 'router.gr.dart';
@RoutePage()
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartManager cartManager = CartManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartManager.cartItems.isEmpty
          ? Center(child: Text('No items in the cart'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartManager.cartItems.length,
              itemBuilder: (context, index) {
                var item = cartManager.cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: item.images.src.isNotEmpty
                        ? Image.network(
                      item.images.src,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    )
                        : Icon(Icons.fastfood),
                    title: Text(item.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${item.variations.first.price} each'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (item.variations.first.cartQuantity > 1) {
                                    item.variations.first.cartQuantity--;
                                  } else {
                                    cartManager.removeItem(item);
                                  }
                                });
                              },
                            ),
                            Text('${item.variations.first.cartQuantity}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  item.variations.first.cartQuantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          cartManager.removeItem(item);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: \$${cartManager.getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Place Order'),
              onPressed: () {
                // Place order logic
                setState(() {
                  cartManager.clearCart();
                });
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
