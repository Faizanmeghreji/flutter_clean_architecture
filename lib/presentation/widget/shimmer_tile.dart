import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Color.fromRGBO(86, 82, 82, 1.0)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white24,
                    child: Container(
                      height: 12,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(':'),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white24,
                      child: Container(
                        height: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white24,
                    child: Container(
                      height: 12,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(':'),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white24,
                      child: Container(
                        height: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white24,
                    child: Container(
                      height: 12,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(':'),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white24,
                      child: Container(
                        height: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
