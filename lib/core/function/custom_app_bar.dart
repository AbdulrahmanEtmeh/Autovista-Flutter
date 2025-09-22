import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: AppColors.backGround,
    elevation: 0,
    title: Text(title),
    titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.primaryWhite,
          fontWeight: FontWeight.bold,
        ),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: AppColors.primaryRed,
      size: 30,
    ),
  );
}

AppBar drawerAppBar(BuildContext context,
    {required String title, required void Function() onPressed}) {
  return AppBar(
    backgroundColor: AppColors.backGround,
    elevation: 0,
    title: Text(title),
    titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.primaryWhite,
          fontWeight: FontWeight.bold,
        ),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: AppColors.primaryWhite,
      size: 35,
    ),
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.menu,
      ),
    ),
  );
}

AppBar addCarAppBar(
  BuildContext context, {
  required String title,
  required void Function() onPressed,
}) {
  return AppBar(
    backgroundColor: AppColors.backGround,
    elevation: 0,
    title: Text(title),
    titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.primaryWhite,
          fontWeight: FontWeight.bold,
        ),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: AppColors.primaryRed,
      size: 30,
    ),
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.format_list_bulleted_add,
        ),
      ),
    ],
  );
}
