List<dynamic> l = [
  [
    'pie',
    '100',
    'Most selling food in our rwstraunt ',
    'https://images.unsplash.com/photo-1596797038530-2c107229654b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aW5kaWFuJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'false'
  ],
  [
    'roti',
    '200',
    "Most selling food in our rwstraunt ",
    'https://images.pexels.com/photos/2679501/pexels-photo-2679501.jpeg?auto=compress&cs=tinysrgb&w=600',
    'false'
  ],
  [
    'chaawal',
    '300',
    'blehhh',
    'https://images.pexels.com/photos/4595313/pexels-photo-4595313.jpeg?auto=compress&cs=tinysrgb&w=600'
        'false'
  ],
  [
    'matar paneer',
    '400',
    'Most selling food in our rwstraunt ',
    'https://images.pexels.com/photos/6599106/pexels-photo-6599106.jpeg?auto=compress&cs=tinysrgb&w=600',
    'false'
  ],
  [
    'paneer',
    '500',
    '',
    'https://images.pexels.com/photos/7593253/pexels-photo-7593253.jpeg?auto=compress&cs=tinysrgb&w=600'
        'false'
  ],
];
// get shopitem => _shopitems;
List cartitem = [];

void add(int index) {
  cartitem.add(l[index]);
}

String calci() {
  int totalp = 0;
  for (int i = 0; i < cartitem.length; i++) {
    totalp += int.parse(cartitem[i][1]);
  }
  return totalp.toString();
}

void trigger() {}
