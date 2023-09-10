import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_hotel/features/hotel/presentation/widgets/custom_radio.dart';

class CaruselWidget extends StatefulWidget {
  final List<String> imageUrl;
  const CaruselWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  State<CaruselWidget> createState() => _CaruselWidgetState();
}

class _CaruselWidgetState extends State<CaruselWidget> {
  CarouselController carouselController = CarouselController();

  int selectedPhotoIndex = 0;

  void handleRadioValueChange(int? value) {
    setState(() {
      selectedPhotoIndex = value!;
      carouselController.animateToPage(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            padEnds: false,
            height: 257.0,
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: true,
            viewportFraction: 1,
            initialPage: selectedPhotoIndex,
            onPageChanged: (index, reason) {
              setState(() {
                selectedPhotoIndex = index;
              });
            },
          ),
          items: widget.imageUrl
              .map(
                (url) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 20 + widget.imageUrl.length * (7 + 4),
              height: 17,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageUrl.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.5,
                    ),
                    child: CustomRadio(
                      value: index,
                      groupValue: selectedPhotoIndex,
                      onChanged: handleRadioValueChange,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
