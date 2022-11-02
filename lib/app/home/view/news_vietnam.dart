import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/dashboard/model/news_vietname_model.dart';
import 'package:register_driver_car/app/dashboard/model/newsfeed_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewVietScreen extends StatefulWidget {
  const WebViewVietScreen({super.key, this.result});
  final Result? result;

  @override
  State<WebViewVietScreen> createState() => _WebViewVietScreenState();
}

class _WebViewVietScreenState extends State<WebViewVietScreen> {
  WebViewController? controller;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.result!.title}"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: WebView(
        initialUrl: '${widget.result!.link}',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewController) {
          controller = webviewController;
        },
      ),
    );
  }
}
