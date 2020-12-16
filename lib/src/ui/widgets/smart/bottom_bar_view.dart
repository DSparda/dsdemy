import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:udemy1/src/ui/views/feature/feature_view.dart';
import 'package:udemy1/src/ui/views/user/user_view.dart';
import 'package:udemy1/src/ui/widgets/smart/bottom_bar_view_model.dart';

class BottomBarView extends StatelessWidget {
  const BottomBarView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.reactive(
      viewModelBuilder: () => BottomBarViewModel(),
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Featured',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return FeatureView();
      case 4:
        return UserView();
      default:
        return FeatureView();
    }
  }
}
