import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ImageContainer extends StatelessWidget {
  final String urlToImage;
  final bool isSmall;
  const ImageContainer({super.key, required this.urlToImage,required this.isSmall});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmall?100:double.infinity,
      height: 300,
      child: Container(
        child: urlToImage.isEmpty
            ? Image.asset(
                'assets/logo.png',
                fit: BoxFit.fill,
              )
            : FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image: urlToImage,
                fit: BoxFit.fill,
                imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fitWidth,
                      
                    )),
      ),
    );
  }
}
