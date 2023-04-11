import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Image.asset("assets/images/ForkKnife.png"),
              const Text("Diet")
            ],
          ),
        ),
        const CircleAvatar(
          child: Icon(Icons.person),
        )
      ],
    );
  }
}
