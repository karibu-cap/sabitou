import 'package:flutter/material.dart';

class CustomReceiptWidget extends StatelessWidget {
  const CustomReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'MY STORE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('Thank you for your purchase!'),
        ],
      ),
    );
  }

  Widget _buildItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name), Text(price)],
      ),
    );
  }
}
