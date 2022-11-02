import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/status/model/lane_model.dart';

class StatusDetailScreen extends StatefulWidget {
  const StatusDetailScreen({
    super.key,
    this.client_right,
    this.client_left,
  });

  final List<ClientLane>? client_right;
  final List<ClientLane>? client_left;

  @override
  State<StatusDetailScreen> createState() => _StatusDetailScreenState();
}

class _StatusDetailScreenState extends State<StatusDetailScreen> {
  final String routes = "/status_screen_detail";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "${widget.client_right!.length}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          client_left(),
          const SizedBox(
            width: 5,
          ),
          client_right(),
        ],
      ),
    );
  }

  Widget client_left() {
    return Expanded(
      flex: 20,
      child: ListView.builder(
        itemCount: widget.client_left!.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Center(child: Text("Door ${index + 1}")),
              showLane(
                "${widget.client_left![index].lane1!.name}",
                widget.client_left![index].lane1!.statusChildren == false
                    ? Colors.red
                    : Colors.green,
                () {
                  setState(() {
                    if (widget.client_left![index].lane1!.statusChildren ==
                        false) {
                      widget.client_left![index].lane1!.statusChildren = true;
                    } else if (widget
                            .client_left![index].lane1!.statusChildren ==
                        true) {
                      widget.client_left![index].lane1!.statusChildren = false;
                    }
                  });
                },
              ),
              showLane(
                "${widget.client_left![index].lane2!.name}",
                widget.client_left![index].lane2!.statusChildren == false
                    ? Colors.red
                    : Colors.green,
                () {
                  setState(() {
                    if (widget.client_left![index].lane2!.statusChildren ==
                        false) {
                      widget.client_left![index].lane2!.statusChildren = true;
                    } else if (widget
                            .client_left![index].lane2!.statusChildren ==
                        true) {
                      widget.client_left![index].lane2!.statusChildren = false;
                    }
                  });
                },
              ),
              showLane(
                "${widget.client_left![index].lane3!.name}",
                widget.client_left![index].lane3!.statusChildren == false
                    ? Colors.red
                    : Colors.green,
                () {
                  setState(() {
                    if (widget.client_left![index].lane3!.statusChildren ==
                        false) {
                      widget.client_left![index].lane3!.statusChildren = true;
                    } else if (widget
                            .client_left![index].lane3!.statusChildren ==
                        true) {
                      widget.client_left![index].lane3!.statusChildren = false;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }

  Widget client_right() {
    return Expanded(
      flex: 20,
      child: ListView.builder(
        itemCount: widget.client_right!.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Text("Door ${index + 1}"),
              showLane(
                "${widget.client_right![index].lane1!.name}",
                widget.client_right![index].lane1!.statusChildren == false
                    ? Colors.red
                    : Colors.green,
                () {
                  setState(() {
                    if (widget.client_right![index].lane1!.statusChildren ==
                        false) {
                      widget.client_right![index].lane1!.statusChildren = true;
                    } else if (widget
                            .client_right![index].lane1!.statusChildren ==
                        true) {
                      widget.client_right![index].lane1!.statusChildren = false;
                    }
                  });
                },
              ),
              showLane(
                "${widget.client_right![index].lane2!.name}",
                widget.client_right![index].lane2!.statusChildren == false
                    ? Colors.red
                    : Colors.green,
                () {
                  setState(() {
                    if (widget.client_right![index].lane2!.statusChildren ==
                        false) {
                      widget.client_right![index].lane2!.statusChildren = true;
                    } else if (widget
                            .client_right![index].lane2!.statusChildren ==
                        true) {
                      widget.client_right![index].lane2!.statusChildren = false;
                    }
                  });
                },
              ),
              showLane(
                "${widget.client_right![index].lane3!.name}",
                widget.client_right![index].lane3!.statusChildren == false
                    ? Colors.red
                    : Colors.green,
                () {
                  setState(() {
                    if (widget.client_right![index].lane3!.statusChildren ==
                        false) {
                      widget.client_right![index].lane3!.statusChildren = true;
                    } else if (widget
                            .client_right![index].lane3!.statusChildren ==
                        true) {
                      widget.client_right![index].lane3!.statusChildren = false;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }

  Widget showLane(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
