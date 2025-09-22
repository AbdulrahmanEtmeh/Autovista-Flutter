import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class GearAndSize extends StatelessWidget {
  final BoxConstraints constraints;
  final String gearType;
  final int nmuOfPeople;
  const GearAndSize(
      {super.key,
      required this.constraints,
      required this.gearType,
      required this.nmuOfPeople});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryRed,
            borderRadius: BorderRadius.circular(40),
          ),
          child: SizedBox(
            width: constraints.maxWidth * 0.3,
            child: FittedBox(
              child: Text(
                gearType,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.primaryWhite),
              ),
            ),
          ),
        ),
        SizedBox(width: constraints.maxWidth * 0.05),
        Container(
          height: constraints.maxHeight * 0.1,
          width: constraints.maxWidth * 0.225,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryRed,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.group_outlined,
                color: AppColors.primaryWhite,
                size: constraints.maxHeight * 0.075,
              ),
              SizedBox(width: constraints.maxWidth * 0.01),
              Text(
                '$nmuOfPeople',
                style: const TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poopins'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
