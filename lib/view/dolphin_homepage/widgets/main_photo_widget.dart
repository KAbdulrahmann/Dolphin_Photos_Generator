
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../cubit/dolphin/dolphin_cubit.dart';
import '../../../models/dolphin_model.dart';

class MainPhoto extends StatelessWidget {
  const MainPhoto(this.cubit, {Key? key}) : super(key: key);
  final DolphinCubit cubit;

  @override
  Widget build(BuildContext context) {
    DolphinCubit cubit = DolphinCubit.get(context);
    return StreamBuilder<DolphinModel>(
      stream: cubit.dolphinStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(16),
            ),
          );
        }
        return CachedNetworkImage(
          imageUrl: cubit.photoUrl.isEmpty?snapshot.data!.photoUrl:cubit.photoUrl,
          imageBuilder: (context, img) {
            return Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: img,fit: BoxFit.cover)),
            );
          },
          height: 300,
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          width: double.infinity,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      },
    );
  }
}
