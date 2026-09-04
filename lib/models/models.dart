enum UserRole {
  waiter,
  chef,
}

enum OrderStatus {
  pending,
  inProgress,
  done,
}

class MenuItem {
  final String id;
  final String name;
  final String category;
  final String subCategory;
  final double price;

  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.price,
  });
}

class OrderItem {
  final MenuItem item;
  int quantity;
  OrderStatus status;

  OrderItem({
    required this.item,
    this.quantity = 1,
    this.status = OrderStatus.pending,
  });

  double get total => item.price * quantity;
}

class RestaurantOrder {
  final String id;
  final int tableNumber;
  final List<OrderItem> items;
  OrderStatus status;

  RestaurantOrder({
    required this.id,
    required this.tableNumber,
    required this.items,
    this.status = OrderStatus.pending,
  });

  double get total {
    return items.fold(
      0,
          (sum, orderItem) => sum + orderItem.total,
    );
  }
}

class RestaurantTable {
  final int tableNumber;
  final List<RestaurantOrder> orders;

  RestaurantTable({
    required this.tableNumber,
    this.orders = const [],
  });

  double get totalBill {
    return orders.fold(
      0,
          (sum, order) => sum + order.total,
    );
  }
}