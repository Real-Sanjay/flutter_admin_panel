import 'package:admin/utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utility/constants.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(flex: 1),
        Expanded(
            child: SearchField(
          onChange: (val) {
            context.dataProvider.filterProducts(val);
          },
        )),
        ProfileCard()
      ],
    );
  }
}


class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  void _logout(BuildContext context) {
    // Clear any stored user data (if necessary) and navigate to the login screen
    Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Admin"),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _logout(context);
              }
            },
            icon: Icon(Icons.keyboard_arrow_down),
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// class ProfileCard extends StatelessWidget {
//   const ProfileCard({
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: defaultPadding),
//       padding: EdgeInsets.symmetric(
//         horizontal: defaultPadding,
//         vertical: defaultPadding / 2,
//       ),
//       decoration: BoxDecoration(
//         color: secondaryColor,
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//         border: Border.all(color: Colors.white10),
//       ),
//       child: Row(
//         children: [
//           Image.asset(
//             "assets/images/profile_pic.png",
//             height: 38,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//             child: Text("Admin"),
//           ),
//           // Icon(Icons.keyboard_arrow_down),
//         ],
//       ),
//     );
//   }
// }

class SearchField extends StatelessWidget {
  final Function(String) onChange;

  const SearchField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
