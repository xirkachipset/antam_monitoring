import 'dart:html';
// import  'dart:io';

import 'package:antam_monitoring/style/mainStyle.dart';
import 'package:antam_monitoring/style/textStyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonePanel extends StatefulWidget {
  PhonePanel(
      {super.key,
      required this.name,
      required this.role,
      required this.phone,
      required this.width});

  String name;
  String role;
  String phone;
  double width;

  @override
  State<PhonePanel> createState() => _PhonePanelState();
}

class _PhonePanelState extends State<PhonePanel> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: (() {
          // ignore: deprecated_member_use
          window.open("https://wa.me/${widget.phone}", 'Link');
        }),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: widget.width,
          decoration: BoxDecoration(
              color: isHover
                  ? MainStyle.primaryColor.withOpacity(0.9)
                  : MainStyle.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              const Icon(Icons.account_circle,
                  color: MainStyle.secondaryColor, size: 35),
              Column(
                children: [
                  Text(
                    widget.name,
                    style: MyTextStyle.defaultFontCustom(Colors.white, 16),
                  ),
                  Text(
                    widget.phone,
                    style: MyTextStyle.defaultFontCustom(Colors.white, 14),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  widget.role,
                  style: MyTextStyle.defaultFontCustom(Colors.white, 16),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ));
  }
}
