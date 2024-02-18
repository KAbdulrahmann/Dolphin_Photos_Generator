

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/colors.dart';

import '../../../cubit/dolphin/dolphin_cubit.dart';

class FetchingStatusIcons extends StatelessWidget {
  const FetchingStatusIcons(this.cubit,{Key? key}) : super(key: key);
  final DolphinCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.photo_library_outlined),
                SizedBox(width: 10,),
                Text(context.read<DolphinCubit>().showCount.toString()),
              ],
            ),
          ),
          Icon(Icons.circle,color: context.read<DolphinCubit>().isPlaying?kGreen:kOrange,),
        ],
      ),
    );
  }
}
