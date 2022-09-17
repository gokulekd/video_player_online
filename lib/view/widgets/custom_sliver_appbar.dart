import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     SliverAppBar(pinned: true,
      floating:true ,
            leadingWidth: 100,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Image.asset(
                "assets/youtube.png",
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined)),
              IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: const CircleAvatar(
                  foregroundImage: AssetImage(
                    "assets/User-Icon.png",
                  ),
                ),
              )
            ],
          );
  }
}