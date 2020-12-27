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

const double _cellHeight = 150.0;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView (
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: SvgPicture.asset(
                          'assets/images/category.svg',
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      model.fetchingCategories
                          ? CustomLoadingIndicator(
                              height: _cellHeight,
                            )
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
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 6.0),
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
                                                    height: _cellHeight,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        '${Constants.GET_CATEGORY_IMAGE_URL}/${model.fetchedCategories[idx].image}',
                                                        fit: BoxFit.fill,
                                                        width: 180,
                                                        height: _cellHeight,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return CustomLoadingIndicator(
                                                              height:
                                                                  _cellHeight);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    model.fetchedCategories[idx]
                                                        .name,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Constants.black63,
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
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        child: SvgPicture.asset(
                          'assets/images/lastest.svg',
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      model.fetchingTopCourses
                          ? CustomLoadingIndicator(
                              height: _cellHeight,
                            )
                          : CarouselSlider.builder(
                              options: CarouselOptions(
                                  enlargeCenterPage: false,
                                  viewportFraction: 1,
                                  aspectRatio: 2.0),
                              itemCount:
                                  (model.fetchedTopCourses.length / 2).round(),
                              itemBuilder: (context, index) {
                                final int first = index * 2;
                                final int second = first + 1;
                                return Row(
                                  children: [first, second].map((idx) {
                                    return Expanded(
                                      child: (idx >
                                              model.fetchedTopCourses.length -
                                                  1)
                                          ? Container(
                                              width: 0,
                                              height: 0,
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6.0),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        '${Constants.GET_COURSE_IMAGE_URL}/${model.fetchedTopCourses[idx].image}',
                                                        fit: BoxFit.fill,
                                                        width: 180,
                                                        height: 150,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return CustomLoadingIndicator(
                                                              height: 150.0);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    model.fetchedTopCourses[idx]
                                                        .name,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Constants.black63,
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
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        child: SvgPicture.asset(
                          'assets/images/free.svg',
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      model.fetchingFreeCourses
                          ? CustomLoadingIndicator(
                              height: _cellHeight,
                            )
                          : CarouselSlider.builder(
                              options: CarouselOptions(
                                  enlargeCenterPage: false,
                                  viewportFraction: 1,
                                  aspectRatio: 2.0),
                              itemCount:
                                  (model.fetchedFreeCourses.length / 2).round(),
                              itemBuilder: (context, index) {
                                final int first = index * 2;
                                final int second = first + 1;
                                return Row(
                                  children: [first, second].map((idx) {
                                    return Expanded(
                                      child: (idx >
                                              model.fetchedFreeCourses.length -
                                                  1)
                                          ? Container(
                                              width: 0,
                                              height: 0,
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6.0),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        '${Constants.GET_COURSE_IMAGE_URL}/${model.fetchedFreeCourses[idx].image}',
                                                        fit: BoxFit.fill,
                                                        width: 180,
                                                        height: 150,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return CustomLoadingIndicator(
                                                              height: 150.0);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    model
                                                        .fetchedFreeCourses[idx]
                                                        .name,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Constants.black63,
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
          ),
        );
      },
    );
  }
}
