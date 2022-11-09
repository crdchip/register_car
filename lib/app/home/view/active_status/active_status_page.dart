import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/active_status/active_status_controller.dart';
import 'package:register_driver_car/app/home/widgets/custom_list_title.dart';
import 'package:register_driver_car/app/home/widgets/custom_nav_list_title.dart';
import 'package:register_driver_car/config/widget/search_navbar.dart';

class ActiveStatusPage extends StatefulWidget {
  const ActiveStatusPage({Key? key}) : super(key: key);

  @override
  State<ActiveStatusPage> createState() => _ActiveStatusPageState();
}

class _ActiveStatusPageState extends State<ActiveStatusPage> {
  late ScrollController _scrollController;
  bool _showAppbar = false;
  bool isScrollingDown = false;

  bool showSearch = true;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(
      () {
        //Ẩn
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!isScrollingDown) {
            setState(() {
              print("Scrolling");
              isScrollingDown = true;
              _showAppbar = true;
            });
          }
        }
        // Hiện
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isScrollingDown) {
            setState(() {
              print("Scrolled");
              isScrollingDown = false;
              _showAppbar = false;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ActiveStatusController>(
      init: ActiveStatusController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: Colors.white.withOpacity(0.4),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: showSearch
              ? const Text("Tình trạng xe")
              : SearchNavbar(
                  searchController: _searchController,
                  hintText: "Nhập số xe",
                  hintColor: Colors.white,
                ),
          centerTitle: true,
          actions: [
            showSearch
                ? IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        showSearch = false;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        showSearch = true;
                        _searchController.text = "";
                      });
                    },
                  ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        body: body(size),
      ),
    );
  }

  Widget body(Size size) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: 15,
          itemBuilder: (context, index) {
            return index == 0
                ? const CustomNavListTitle(
                    height: 60,
                    nameDriver: "Tên tài xế",
                    customer: "Khánh Hàng",
                    status: "Trạng thái",
                  )
                : CustomListTitle(
                    Stt: '$index',
                    nameDriver: 'Hà Văn Cừ',
                    numberPhone: '0346578932',
                    customer: 'Hà Thị Hoa',
                    status: 'Đã vào',
                  );
          },
        ),
        Positioned(
            top: -6,
            child: CustomNavListTitle(
              height: _showAppbar ? 60 : 0,
              nameDriver: "Tên tài xế",
              customer: "Khánh Hàng",
              status: "Trạng thái",
            ))
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }
}