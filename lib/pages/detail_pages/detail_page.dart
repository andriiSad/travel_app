import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/cubit/app_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/detail_pages/cubit/store_page_info_cubits.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;
  Color? color = AppColors.mainColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;

        var list = BlocProvider.of<StorePageInfoCubits>(context).state;
        for (int i = 0; i < list.length; i++) {
          if (list[i].name == detail.place.name) {
            selectedIndex = list[i].index!;
            color = list[i].color;
          }
        }
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black54.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: '\$ ${detail.place.price}',
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index >= detail.place.stars
                                      ? AppColors.textColor2
                                      : AppColors.starColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(${detail.place.stars}.0)',
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                var data = state.place;
                                var list = BlocProvider.of<StorePageInfoCubits>(
                                        context)
                                    .state;
                                for (int i = 0; i < list.length; i++) {
                                  if (list[i].name == data.name) {
                                    if (list[i].index == index) {
                                      //if the index is same, we are here
                                    } else {
                                      BlocProvider.of<StorePageInfoCubits>(
                                              context)
                                          .updatePageInfo(
                                              detail.place.name, index, color);
                                      selectedIndex = index;
                                    }
                                  }
                                }
                                //only if button was never clicked
                                if (selectedIndex == -1) {
                                  print('inside condition');
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .addPageInfo(
                                    detail.place.name,
                                    index,
                                    color,
                                  );
                                }
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          var list =
                              BlocProvider.of<StorePageInfoCubits>(context)
                                  .state;
                          if (list.isEmpty) {
                            setState(() {
                              color = Colors.red;
                            });
                            BlocProvider.of<StorePageInfoCubits>(context)
                                .updatePageWish(
                              detail.place.name,
                              selectedIndex,
                              color,
                            );
                          } else {
                            //only toggle the color
                            for (int i = 0; i < list.length; i++) {
                              if (list[i].name == detail.place.name) {
                                if (list[i].color == Colors.red) {
                                  setState(() {
                                    color = AppColors.mainColor;
                                  });

                                  Future.delayed(Duration.zero, () {
                                    BlocProvider.of<StorePageInfoCubits>(
                                            context)
                                        .updatePageWish(
                                      detail.place.name,
                                      selectedIndex,
                                      color,
                                    );
                                  });
                                  return;
                                } else {
                                  setState(() {
                                    color = Colors.red;
                                  });
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .updatePageWish(
                                    detail.place.name,
                                    selectedIndex,
                                    color,
                                  );
                                  return;
                                }
                              } else {
                                if (color == AppColors.mainColor) {
                                  setState(() {
                                    color = Colors.red;
                                  });
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .updatePageWish(detail.place.name,
                                          selectedIndex, color);
                                } else {
                                  setState(() {
                                    color = AppColors.mainColor;
                                  });
                                  BlocProvider.of<StorePageInfoCubits>(context)
                                      .updatePageWish(detail.place.name,
                                          selectedIndex, color);
                                }
                              }
                            }
                          }
                        },
                        child: AppButton(
                          color: color!,
                          backgroundColor: Colors.white,
                          borderColor: color!,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isRenponsive: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
