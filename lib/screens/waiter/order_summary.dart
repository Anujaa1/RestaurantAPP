import 'package:flutter/material.dart';

import '../../models/models.dart';

class OrderSummaryScreen extends StatefulWidget {

  final RestaurantTable table;
  final List<OrderItem> items;

  const OrderSummaryScreen({
    super.key,
    required this.table,
    required this.items,
  });

  @override
  State<OrderSummaryScreen> createState() =>
      _OrderSummaryScreenState();
}

class _OrderSummaryScreenState
    extends State<OrderSummaryScreen> {

  double get total {

    return widget.items.fold(
      0,
          (sum, item) => sum + item.total,
    );
  }

  void placeOrder() {

    final order = RestaurantOrder(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),

      tableNumber: widget.table.tableNumber,

      items: widget.items,
    );

    widget.table.orders.add(order);

    Navigator.pop(context);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Order placed for Table ${widget.table.tableNumber}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Order Summary • Table ${widget.table.tableNumber}',
        ),
      ),

      body: Column(
        children: [

          Expanded(

            child: ListView.builder(

              padding: const EdgeInsets.all(16),

              itemCount: widget.items.length,

              itemBuilder: (context, index) {

                final orderItem =
                widget.items[index];

                return Card(

                  margin:
                  const EdgeInsets.only(bottom: 12),

                  child: ListTile(

                    title: Text(
                      orderItem.item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      '${orderItem.quantity} × Rs. ${orderItem.item.price.toStringAsFixed(0)}',
                    ),

                    trailing: Text(
                      'Rs. ${orderItem.total.toStringAsFixed(0)}',

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // TOTAL
          Container(

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.orange.shade50,

              borderRadius:
              const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Rs. ${total.toStringAsFixed(0)}',

                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton.icon(

                    onPressed: placeOrder,

                    icon: const Icon(
                      Icons.send,
                    ),

                    label: const Text(
                      'PLACE ORDER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}