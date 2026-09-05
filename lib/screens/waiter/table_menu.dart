import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../data/menu_data.dart';
import '/screens/waiter/order_summary.dart';

class TableMenuScreen extends StatefulWidget {

  final RestaurantTable table;

  const TableMenuScreen({
    super.key,
    required this.table,
  });

  @override
  State<TableMenuScreen> createState() =>
      _TableMenuScreenState();
}

class _TableMenuScreenState
    extends State<TableMenuScreen> {

  final Map<String, int> quantities = {};

  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Beverages',
    'Appetizers',
    'Full Course',
    'Desserts',
  ];

  void increaseQuantity(MenuItem item) {

    setState(() {

      quantities[item.id] =
          (quantities[item.id] ?? 0) + 1;
    });
  }

  void decreaseQuantity(MenuItem item) {

    setState(() {

      final current =
          quantities[item.id] ?? 0;

      if (current <= 1) {
        quantities.remove(item.id);
      } else {
        quantities[item.id] = current - 1;
      }
    });
  }

  List<MenuItem> get filteredItems {

    if (selectedCategory == 'All') {
      return menuItems;
    }

    return menuItems
        .where(
          (item) =>
      item.category == selectedCategory,
    )
        .toList();
  }

  int get totalItems {

    return quantities.values.fold(
      0,
          (sum, quantity) => sum + quantity,
    );
  }

  double get currentTotal {

    double total = 0;

    for (final item in menuItems) {

      final quantity =
          quantities[item.id] ?? 0;

      total += item.price * quantity;
    }

    return total;
  }

  void openSummary() {

    if (quantities.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please add at least one item.',
          ),
        ),
      );

      return;
    }

    final selectedItems = <OrderItem>[];

    for (final item in menuItems) {

      final quantity =
          quantities[item.id] ?? 0;

      if (quantity > 0) {

        selectedItems.add(
          OrderItem(
            item: item,
            quantity: quantity,
          ),
        );
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderSummaryScreen(
          table: widget.table,
          items: selectedItems,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Table ${widget.table.tableNumber}',
        ),
      ),

      body: Column(
        children: [

          // CATEGORY FILTER
          SizedBox(
            height: 55,

            child: ListView.builder(

              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),

              itemCount: categories.length,

              itemBuilder: (context, index) {

                final category =
                categories[index];

                final selected =
                    selectedCategory == category;

                return Padding(
                  padding:
                  const EdgeInsets.only(right: 8),

                  child: ChoiceChip(

                    label: Text(category),

                    selected: selected,

                    onSelected: (_) {

                      setState(() {
                        selectedCategory =
                            category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // MENU
          Expanded(

            child: ListView.builder(

              padding: const EdgeInsets.all(12),

              itemCount: filteredItems.length,

              itemBuilder: (context, index) {

                final item =
                filteredItems[index];

                final quantity =
                    quantities[item.id] ?? 0;

                return Card(

                  margin:
                  const EdgeInsets.only(bottom: 10),

                  child: Padding(
                    padding: const EdgeInsets.all(14),

                    child: Row(
                      children: [

                        // ICON
                        Container(
                          height: 55,
                          width: 55,

                          decoration: BoxDecoration(
                            color:
                            Colors.orange.shade50,
                            borderRadius:
                            BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.restaurant,
                            color: Colors.deepOrange,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // NAME + PRICE
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'Rs. ${item.price.toStringAsFixed(0)}',

                                style: TextStyle(
                                  color:
                                  Colors.deepOrange,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 3),

                              Text(
                                item.subCategory,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // QUANTITY
                        Row(
                          children: [

                            IconButton(
                              onPressed: quantity > 0
                                  ? () =>
                                  decreaseQuantity(item)
                                  : null,

                              icon: const Icon(
                                Icons.remove_circle_outline,
                              ),
                            ),

                            Text(
                              '$quantity',

                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              onPressed: () =>
                                  increaseQuantity(item),

                              icon: const Icon(
                                Icons.add_circle,
                                color:
                                Colors.deepOrange,
                              ),
                            ),
                          ],
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

      // BOTTOM ORDER BAR
      bottomNavigationBar: totalItems == 0
          ? null
          : SafeArea(
        child: Container(

          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color:
                Colors.black.withOpacity(0.1),
                blurRadius: 10,
              ),
            ],
          ),

          child: Row(
            children: [

              Expanded(
                child: Column(
                  mainAxisSize:
                  MainAxisSize.min,

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      '$totalItems items',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    Text(
                      'Rs. ${currentTotal.toStringAsFixed(0)}',

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: openSummary,

                child: const Text(
                  'VIEW ORDER',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}