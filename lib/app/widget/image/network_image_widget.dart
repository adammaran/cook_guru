import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  String imageUrl;
  bool isFullSized = false;

  NetworkImageWidget(this.imageUrl, {this.isFullSized = false});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: isFullSized ? 200 : 140,
      alignment: Alignment.center,
      fit: BoxFit.fitWidth,
      loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) =>
          loadingProgress == null
              ? child
              : SizedBox(
                  height: isFullSized ? 200 : 140,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
    );
  }
}
