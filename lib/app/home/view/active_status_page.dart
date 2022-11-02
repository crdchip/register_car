import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/active_status/active_status_controller.dart';

class ActiveStatusPage extends StatefulWidget {
  ActiveStatusPage({Key? key}) : super(key: key);

  @override
  State<ActiveStatusPage> createState() => _ActiveStatusPageState();
}

class _ActiveStatusPageState extends State<ActiveStatusPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActiveStatusController>(
      init: ActiveStatusController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Tình trạng bãi để xe"),
        ),
        body: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        TreeView(nodes: [
          TreeNode(
            content: Text("Kho 1"),
            children: [
              TreeNode(content: Text("Lane 1")),
              TreeNode(content: Text("Lane 2")),
            ],
          ),
          TreeNode(
            content: Text("Kho 2"),
            children: [
              TreeNode(content: Text("Lane 1")),
              TreeNode(content: Text("Lane 2")),
            ],
          ),
          TreeNode(
            content: Text("Kho 3"),
            children: [
              TreeNode(content: Text("Lane 1")),
              TreeNode(content: Text("Lane 2")),
            ],
          ),
          TreeNode(
            content: Text("Kho 4"),
            children: [
              TreeNode(content: Text("Lane 1")),
              TreeNode(content: Text("Lane 2")),
            ],
          ),
        ]),
      ],
    );
  }
}
