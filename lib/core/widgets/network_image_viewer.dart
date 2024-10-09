import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer({
    super.key,
    this.imagePath,
    this.width,
    this.height,
  });

  final String? imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        child: CachedNetworkImage(
            imageUrl: imagePath ?? "",
            // placeholder: (context, url) =>
            //     const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) {
              return const Center(child: Icon(Icons.image));
            }),
      ),
    );
  }
}
