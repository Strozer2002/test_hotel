import 'package:flutter/material.dart';

import '../../../../app_data/app_data.dart';
import '../../../widgets/header_text.dart';

class StatisticHotel extends StatefulWidget {
  final int rating;
  final String ratingName;
  final String name;
  final String adress;
  const StatisticHotel({
    super.key,
    required this.rating,
    required this.ratingName,
    required this.name,
    required this.adress,
  });

  @override
  State<StatisticHotel> createState() => _StatisticHotelState();
}

class _StatisticHotelState extends State<StatisticHotel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppData.colors.orange20,
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: AppData.colors.orange,
              ),
              Text(
                "${widget.rating} ${widget.ratingName}",
                style: TextStyle(
                  color: AppData.colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        HeaderText(text: widget.name),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {},
          child: Text(
            widget.adress,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
