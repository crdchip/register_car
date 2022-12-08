import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/custom_list_title.dart';

class SearchUser extends SearchDelegate {
  var controller = Get.put(SercurityController());
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : CustomColor.backgroundAppbar,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
        // textTheme: theme.textTheme.bodyLarge,
      ),
      hintColor: Colors.white,
      focusColor: Colors.white,
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(0.4),
            Colors.white.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.4, 0.7],
        ),
      ),
      child: FutureBuilder(
        future: controller.searchTracking(query),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data as List<Tracking>;
            return ListView.builder(
              // controller: _scrollBottomBarController,
              itemCount: items.length,
              itemBuilder: ((context, index) {
                return CustomListTitle(
                  Stt: "${index + 1}",
                  nameDriver:
                      "${items[index].formIns!.clientInformation!.name}",
                  numberPhone:
                      "${items[index].formIns!.clientInformation!.phone}",
                  customer:
                      "${items[index].formIns!.clientInformation!.companyname}",
                  status: "${items[index].statustracking![0].name}",
                  image: "${items[index].formIns!.clientInformation!.imgdata}",
                );
              }),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orangeAccent.withOpacity(0.4),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(0.4),
            Colors.white.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.4, 0.7],
        ),
      ),
      child: Center(
        child: Text('Search User'),
      ),
    );
  }
}
