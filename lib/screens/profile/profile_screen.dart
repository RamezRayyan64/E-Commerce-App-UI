import 'package:e_commerce/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  static const id = '/profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Profile image.png'),
                  ),
                  Positioned(
                      bottom: 0,
                      right: -12,
                      child: SizedBox(
                        height: 45,
                        width: 45,
                        child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50)))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFF5F6F9))),
                          onPressed: () {},
                          child:
                              SvgPicture.asset('assets/icons/Camera Icon.svg'),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileButtonWidget(
              iconSource: 'User Icon',
              title: 'My Account',
              onPressed: () {},
            ),
            ProfileButtonWidget(
              iconSource: 'Bell',
              title: 'Notification',
              onPressed: () {},
            ),
            ProfileButtonWidget(
              iconSource: 'Settings',
              title: 'Settings',
              onPressed: () {},
            ),
            ProfileButtonWidget(
              iconSource: 'Question mark',
              title: 'Help Center',
              onPressed: () {},
            ),
            ProfileButtonWidget(
              iconSource: 'Log out',
              title: 'Log Out',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    Key? key,
    required this.iconSource,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String iconSource;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor:
                MaterialStateProperty.all(const Color(0xFFF5F6F9))),
        child: ListTile(
          leading: SvgPicture.asset(
            'assets/icons/$iconSource.svg',
            color: kPrimaryColor,
            width: 22,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: kTextColor.withOpacity(0.15)),
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/icons/User.svg',
          color: kPrimaryColor,
        ),
        title: const Text('My Account'),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
