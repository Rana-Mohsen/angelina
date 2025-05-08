class OrderRequest {
  final String paymentMethod;
  final String paymentMethodTitle;
  final bool setPaid;
  final Billing billing;
  final List<LineItem> lineItems;

  OrderRequest({
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.setPaid,
    required this.billing,
    required this.lineItems,
  });

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
    "payment_method_title": paymentMethodTitle,
    "set_paid": setPaid,
    "billing": billing.toJson(),
    "line_items": lineItems.map((item) => item.toJson()).toList(),
  };
}

class Billing {
  final String firstName;
  final String lastName;
  final String address1;
  final String city;
  final String postcode;
  final String country;
  final String email;
  final String phone;

  Billing({
    required this.firstName,
    required this.lastName,
    required this.address1,
    required this.city,
    required this.postcode,
    required this.country,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "address_1": address1,
    "city": city,
    "postcode": postcode,
    "country": country,
    "email": email,
    "phone": phone,
  };
}

class LineItem {
  final int productId;
  final int quantity;

  LineItem({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
  };
}
