import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';

class ProfileUserItem extends StatelessWidget {
  const ProfileUserItem({
    Key? key,
    required this.icon,
    required this.title,
    this.iconContainerColor,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color? iconContainerColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: CustomContainer(
        hideShadow: true,
        color: iconContainerColor ?? Colors.green,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
        size: 30,
      ),
    );
  }
}
