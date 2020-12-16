import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/app/generated/locator/locator.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/app_bar_with_back.dart';

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
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/category.svg',
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    model.isBusy
                        ? CircularProgressIndicator()
                        : CarouselSlider(
                            options: CarouselOptions(),
                            items: model.data
                                .map((e) => Container(
                                    width: 180,
                                    height: 150,
                                    child: Text(
                                      e.name,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Constants.black54),
                                    )))
                                .toList()),
                    SizedBox(height: 24),
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
