import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/app_bar_with_back.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_loading_indicator.dart';

import './feature_view_model.dart';

class FeatureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeatureViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<FeatureViewModel>(),
      builder: (
        BuildContext context,
        FeatureViewModel model,
        Widget child,
      ) {
        var size = MediaQuery.of(context).size;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBarWithBack(),
          body: Container(
            width: double.infinity,
            height: size.height,
            decoration: BoxDecoration(
              gradient: Constants.gradientPink100,
            ),
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/images/category.svg',
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    model.fetchingCategories
                        ? CustomLoadingIndicator()
                        : CarouselSlider.builder(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                            ),
                            itemCount:
                                (model.fetchedCategories.length / 2).round(),
                            itemBuilder: (context, index) {
                              final int first = index * 2;
                              final int second = first + 1;
                              return Row(
                                children: [first, second].map((idx) {
                                  return Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: (idx >
                                              model.fetchedCategories.length -
                                                  1)
                                          ? Container(
                                              width: 0,
                                              height: 0,
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      model.idToImageUrl(model
                                                          .fetchedCategories[
                                                              idx]
                                                          .sId),
                                                      fit: BoxFit.cover,
                                                      width: 180,
                                                      height: 150,
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) return child;
                                                        return CustomLoadingIndicator(
                                                            height: 150.0);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  model.fetchedCategories[idx]
                                                      .name,
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Constants.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
