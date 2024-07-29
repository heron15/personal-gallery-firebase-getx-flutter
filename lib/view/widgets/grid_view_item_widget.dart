import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:personal_gallery/utils/app_color.dart';
import 'package:personal_gallery/view/widgets/center_progress_indicator.dart';

class GridViewItemWidget extends StatelessWidget {
  const GridViewItemWidget({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.onTap,
  });

  final String imageUrl;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black.withOpacity(0.25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: 180,
                height: 180,
                color: Colors.black.withOpacity(0.25),
                colorBlendMode: BlendMode.darken,
                placeholder: (context, url) => const CenterProgressIndicator(
                  indicatorSize: 40,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
