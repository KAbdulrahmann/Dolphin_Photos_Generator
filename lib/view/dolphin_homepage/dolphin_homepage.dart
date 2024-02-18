import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/colors.dart';
import 'package:new_app/core/extensions/sizedbox.dart';
import 'package:new_app/view/dolphin_homepage/widgets/control_buttons.dart';
import 'package:new_app/view/dolphin_homepage/widgets/fetching_status_icons.dart';
import 'package:new_app/view/dolphin_homepage/widgets/main_photo_widget.dart';
import '../../core/constants/strings.dart';
import '../../cubit/dolphin/dolphin_cubit.dart';
import '../../cubit/dolphin/dolphin_state.dart';

class DolphinHomepage extends StatelessWidget {
   const DolphinHomepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DolphinCubit cubit = DolphinCubit.get(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
        appBar: PreferredSize(preferredSize: Size(double.infinity, 100), child: AppBar(
          title: Text(
            ConstStrings.dolphinTitle,
            style: const TextStyle(color: kBlack, fontSize: 35),
          ),
          backgroundColor: kBackgroundColor,
          elevation: 0,
        )),
        body: BlocConsumer<DolphinCubit, DolphinState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                FetchingStatusIcons(cubit),
                MainPhoto(cubit),
                ControlButtons(cubit),
                16.h,
                cubit.showMemory
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      cubit.photos.length,
                          (index) =>
                          InkWell(
                            onTap: (){
                              cubit.setPhotoIndex(index);
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(18)),
                              child: CachedNetworkImage(
                                useOldImageOnUrlChange: true,
                                fit: BoxFit.cover,
                                imageBuilder: (context,img){
                                  return  Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        image: DecorationImage(image: img,fit: BoxFit.cover)),
                                  );
                                },
                                imageUrl: context
                                    .watch<DolphinCubit>()
                                    .photos[index]
                                    .photoUrl,
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                          )),
                )
                    : const SizedBox(),
              ],
            );
          },
        ));
  }
}
