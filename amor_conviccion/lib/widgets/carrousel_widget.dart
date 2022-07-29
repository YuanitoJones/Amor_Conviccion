import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrouselWidget extends StatelessWidget {
  CarrouselWidget(this.item, {Key? key}) : super(key: key);

  final List item;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CarouselSlider(
            carouselController: carouselController,
            items: [for (int i = 0; i < item.length; i++) item[i]],
            options: CarouselOptions(
                aspectRatio: 2 / 3,
                enableInfiniteScroll: false,
                initialPage: 0,
                enlargeCenterPage: true,
                viewportFraction: 0.95),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ClipOval(
            child: Container(
              color: Colors.black54,
              child: IconButton(
                onPressed: () {
                  // Use the controller to change the current page
                  carouselController.nextPage();
                },
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ClipOval(
            child: Container(
              color: Colors.black54,
              child: IconButton(
                onPressed: () {
                  // Use the controller to change the current page
                  carouselController.previousPage();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
