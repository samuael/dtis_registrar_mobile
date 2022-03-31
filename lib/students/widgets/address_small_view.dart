import '../../../libs.dart' show Address;
import "package:flutter/material.dart";
import 'dart:core';

class AddressSmallView extends StatelessWidget {
  final Address address;
  const AddressSmallView(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                flex: 3,
                child: Text(
                  "Region:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  "${address.region}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                flex: 3,
                child: Text(
                  "Zone:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  "${address.zone}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                flex: 3,
                child: Text(
                  "Woreda:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  "${address.woreda}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                flex: 3,
                child: Text(
                  "City:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  "${address.city}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Kebele:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    "${address.kebele}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blueGrey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Center(
                        child: Text(
                          "${address.uniqueAddress == null ? '' : address.uniqueAddress}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
