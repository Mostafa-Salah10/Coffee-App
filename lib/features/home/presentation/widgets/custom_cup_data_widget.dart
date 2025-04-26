import 'package:flutter/material.dart';

class CustomCupDataWidget extends StatelessWidget {
  const CustomCupDataWidget({
    super.key,
    required this.price,
    required this.volume,
  });
  final double price;
  final double volume;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Volume $volume ml",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 10),
            Text("\$ $price", style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
        Icon(Icons.add_circle, size: 50),
      ],
    );
  }
}
