import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class DetailsActiveStatusPage extends StatefulWidget {
  const DetailsActiveStatusPage({super.key});

  @override
  State<DetailsActiveStatusPage> createState() =>
      _DetailsActiveStatusPageState();
}

class _DetailsActiveStatusPageState extends State<DetailsActiveStatusPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white.withOpacity(0.2),
            size: 16,
          ),
        ),
        title: Text(
          "Thông tin chi tiết",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Timeline(
          children: <TimelineModel>[
            TimelineModel(
              Column(
                children: [
                  Container(
                    height: 100,
                    child: Center(
                      child: Text("Chưa vào"),
                    ),
                  ),
                ],
              ),
              icon: const Icon(Icons.receipt, color: Colors.white),
              iconBackground: Colors.blue,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("Đã vào cổng"),
                ),
              ),
              icon: Icon(Icons.android, color: Colors.white),
              iconBackground: Colors.cyan,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("Đang đợi lên hàng"),
                ),
              ),
              icon: Icon(Icons.ios_share),
              iconBackground: Colors.cyan,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("Đang lên hàng"),
                ),
              ),
              icon: Icon(Icons.ios_share),
              iconBackground: Colors.cyan,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("Đã xog"),
                ),
              ),
              icon: Icon(Icons.ios_share),
              iconBackground: Colors.cyan,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("Đã ra cổng"),
                ),
              ),
              icon: Icon(Icons.ios_share),
              iconBackground: Colors.cyan,
            ),
          ],
          position: TimelinePosition.Left,
          iconSize: 40,
          lineColor: Colors.blue,
        ),
      ),
    );
  }
}
