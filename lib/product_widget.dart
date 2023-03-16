import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(widget.imageUrl),
          ),
          SizedBox(height: 16),
          Text(widget.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('\$${widget.price}', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quantity: $_counter'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _counter--;
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
