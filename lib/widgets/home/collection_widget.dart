import 'package:e_commerce/screens/home/see_more_screen.dart';
import 'package:flutter/material.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              GestureDetector(
                  onTap: () {
                    title == 'Special for you'
                        ? Navigator.pushNamed(context, SeeMoreScreen.id,
                            arguments: {'from': 'specialForYou'})
                        : Navigator.pushNamed(context, SeeMoreScreen.id,
                            arguments: {'from': 'popularProducts'});
                  },
                  child: const Text('See More'))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: children,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
