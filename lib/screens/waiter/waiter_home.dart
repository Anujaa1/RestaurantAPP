import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'table_menu.dart';
import 'table_bill.dart';

class WaiterHome extends StatefulWidget {
  const WaiterHome({super.key});

  @override
  State<WaiterHome> createState() => _WaiterHomeState();
}

class _WaiterHomeState extends State<WaiterHome> {

  final List<RestaurantTable> tables = List.generate(
    12,
        (index) => RestaurantTable(
      tableNumber: index + 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'GoodFood',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Tables',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Select a table to take an order',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(

              child: GridView.builder(

                itemCount: tables.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),

                itemBuilder: (context, index) {

                  final table = tables[index];

                  final hasOrders = table.orders.isNotEmpty;

                  return InkWell(

                    borderRadius: BorderRadius.circular(18),

                    onTap: () {

                      showModalBottomSheet(
                        context: context,

                        builder: (context) {

                          return SafeArea(

                            child: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [

                                ListTile(

                                  leading: const Icon(
                                    Icons.restaurant_menu,
                                  ),

                                  title: const Text(
                                    'Take New Order',
                                  ),

                                  onTap: () {

                                    Navigator.pop(context);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TableMenuScreen(
                                              table: table,
                                            ),
                                      ),
                                    );
                                  },
                                ),

                                ListTile(

                                  leading: const Icon(
                                    Icons.receipt_long,
                                  ),

                                  title: const Text(
                                    'View Table Bill',
                                  ),

                                  onTap: () {

                                    Navigator.pop(context);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TableBillScreen(
                                              table: table,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },

                    child: Container(

                      decoration: BoxDecoration(
                        color: hasOrders
                            ? Colors.orange.shade50
                            : Colors.white,

                        borderRadius:
                        BorderRadius.circular(18),

                        border: Border.all(
                          color: hasOrders
                              ? Colors.orange
                              : Colors.grey.shade300,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.table_restaurant,
                            size: 42,
                            color: hasOrders
                                ? Colors.orange
                                : Colors.green,
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Table ${table.tableNumber}',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            hasOrders
                                ? 'Order active'
                                : 'Available',

                            style: TextStyle(
                              fontSize: 12,
                              color: hasOrders
                                  ? Colors.orange
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}