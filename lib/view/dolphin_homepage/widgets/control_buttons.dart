import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../../cubit/dolphin/dolphin_cubit.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons(this.cubit,{Key? key}) : super(key: key);
  final DolphinCubit cubit;

  @override
  Widget build(BuildContext context) {
    DolphinCubit cubit=DolphinCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              cubit.pauseFetchingPhoto();
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(kOrange)),
            child: Row(
              children: [
                const Icon(CupertinoIcons.pause, size: 16,),
                Text(ConstStrings.pause),
              ],
            )),
        ElevatedButton(
            onPressed: () {
              cubit.playFetchingPhoto();
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(kGreen)),
            child: Row(
              children: [
                const Icon(CupertinoIcons.play, size: 16,),
                Text(ConstStrings.play),
              ],
            )),
        ElevatedButton(
            onPressed: () {
              cubit.rewind();
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(kBlue)),
            child: Row(
              children: [
                const Icon(CupertinoIcons.photo_on_rectangle, size: 16,),
                const SizedBox(width: 8,),
                Text(ConstStrings.rewind),
              ],
            )),
      ],
    );
  }
}
