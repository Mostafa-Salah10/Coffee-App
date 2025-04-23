import 'package:flutter/material.dart';

class CustomCupDataWidget extends StatelessWidget {
  const CustomCupDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Volume 160ml", style: Theme.of(context).textTheme.labelSmall),
            SizedBox(height: 10),
            Text("\$ 25.40", style: Theme.of(context).textTheme.labelSmall),
          ],
        ),

        Icon(Icons.add_circle, size: 50),
      ],
    );
  }
}
