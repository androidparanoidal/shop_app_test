import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.icon,
    required this.title,
    @required this.onTapMethod,
  });

  final Icon icon;
  final String title;
  final VoidCallback? onTapMethod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapMethod,
      child: Container(
        width: 170,
        height: 86,
        decoration: BoxDecoration(
            color: AppColors.lightColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 15),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
