List<dynamic> l = [
  [
    'Pie',
    '100',
    'Most selling food in our restaurant ',
    'https://images.pexels.com/photos/461431/pexels-photo-461431.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    0
  ],
  [
    'Roti',
    '200',
    "Most selling food in our restaurant ",
    'https://images.pexels.com/photos/9797029/pexels-photo-9797029.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    0
  ],
  [
    'Rice',
    '300',
    '',
    'https://images.pexels.com/photos/674574/pexels-photo-674574.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    0
  ],
  [
    'Matar Paneer',
    '400',
    'Most selling food in our restaurant ',
    'https://images.pexels.com/photos/6599106/pexels-photo-6599106.jpeg?auto=compress&cs=tinysrgb&w=600',
    0
  ],
  [
    'Paneer',
    '500',
    '',
    'https://images.pexels.com/photos/7593253/pexels-photo-7593253.jpeg?auto=compress&cs=tinysrgb&w=600',
    0
  ],
  [
    ' matar masala Paneer',
    '500',
    '',
    'https://images.pexels.com/photos/7593253/pexels-photo-7593253.jpeg?auto=compress&cs=tinysrgb&w=600',
    0
  ],
];
// get shopitem => _shopitems;
List cartitem = [];

void add(int index) {
  cartitem.add(l[index]);
}

int calci() {
  int totalPrice = 0;
  for (int i = 0; i < cartitem.length; i++) {
    int price = int.parse(cartitem[i][1].toString());
    int quantity = int.parse(cartitem[i][4].toString());
    totalPrice += price * quantity + 50;
  }
  return totalPrice;
}

String multiply() {
  int res = 0;
  for (var i = 0; i < cartitem.length; i++) {
    res = int.parse(cartitem[i][1]) * int.parse(cartitem[i][4]);
  }
  return res.toString();
}

class Counter {
  static int counter = 0;
}
