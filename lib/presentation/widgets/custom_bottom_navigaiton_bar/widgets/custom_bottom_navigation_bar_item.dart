import 'package:bidder/presentation/widgets/custom_bottom_navigaiton_bar/cubit/bottomnavigationbar_cubit.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    Key? key,
    this.onTap,
    required this.icon,
    required this.title,
    required this.index,
  }) : super(key: key);

  final void Function()? onTap;
  final IconData icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationbarCubit, int>(
      builder: (context, state) {
        final isActive = state == index;
        return CustomContainer(
          color: isActive ? primaryColor : Colors.white,
          hideShadow: true,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.white : Colors.grey,
                  size: 26,
                ),
                isActive ? Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color:  Colors.white,
                  ),
                ): const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
