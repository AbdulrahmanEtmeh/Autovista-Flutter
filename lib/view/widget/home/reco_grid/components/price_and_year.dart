import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class PriceAndYear extends StatelessWidget {
  final BoxConstraints constraints;
  final int price;
  const PriceAndYear(
      {super.key, required this.constraints, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: constraints.maxWidth * 0.35,
          height: constraints.maxHeight * 0.12,
          child: FittedBox(
            child: Text(
              '\$ $price',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.primaryWhite),
            ),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.075,
          child: const VerticalDivider(
            color: AppColors.primaryWhite,
            thickness: 2,
          ),
        ),
        SizedBox(
          width: constraints.maxWidth * 0.2,
          height: constraints.maxHeight * 0.12,
          child: FittedBox(
            child: Text(
              '2020',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.primaryWhite),
            ),
          ),
        ),
      ],
    );
  }
}
