import 'package:flutter/material.dart';

import '../../models/models.dart';

class TableBillScreen extends StatelessWidget {

  final RestaurantTable table;

  const TableBillScreen({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Table ${table.tableNumber} Bill',
        ),
      ),

      body: table.orders.isEmpty

          ? const Center(
        child: Text(
          'No orders yet.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      )

          : Column(
        children: [

          Expanded(

            child: ListView.builder(

              padding:
              const EdgeInsets.all(16),

              itemCount: table.orders.length,

              itemBuilder: (context, index) {

                final order =
                table.orders[index];

                return Card(

                  margin:
                  const EdgeInsets.only(
                    bottom: 16,
                  ),

                  child: Padding(
                    padding:
                    const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Order ${index + 1}',

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const Divider(),

                        ...order.items.map(
                              (orderItem) {

                            return Padding(

                              padding:
                              const EdgeInsets
                                  .symmetric(
                                vertical: 6,
                              ),

                              child: Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      '${orderItem.quantity} × ${orderItem.item.name}',
                                    ),
                                  ),

                                  Text(
                                    'Rs. ${orderItem.total.toStringAsFixed(0)}',
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        const Divider(),

                        Align(
                          alignment:
                          Alignment.centerRight,

                          child: Text(
                            'Order Total: Rs. ${order.total.toStringAsFixed(0)}',

                            style: const TextStyle(
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // FINAL BILL
          Container(

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.orange.shade50,

              borderRadius:
              const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),

            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  'TOTAL BILL',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Rs. ${table.totalBill.toStringAsFixed(0)}',

                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
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