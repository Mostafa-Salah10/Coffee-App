import 'package:flutter/material.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(onTap: () {}, child: Text("Home Veiw"))),
    );
  }
}
