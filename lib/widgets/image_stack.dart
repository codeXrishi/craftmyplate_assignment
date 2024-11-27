import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class ImageStackWidget extends StatelessWidget {
  const ImageStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<ImageProvider> images = [
      const ExactAssetImage("assets/image2.png"),
      const ExactAssetImage("assets/image1.png"),
      const ExactAssetImage("assets/image1.png"),
    ];
    return FlutterImageStack.providers(providers: images, totalCount: 2);
  }
}
