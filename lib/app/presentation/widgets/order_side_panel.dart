import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/core/util/device_verifier.dart';
import 'package:totem/app/presentation/home/home_provider.dart';

class OrderSidePanel extends StatelessWidget {
  const OrderSidePanel({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      width: homeProvider.showingOrdersPanel ? size.height * 0.2 : 0,
      color: const Color(0xFFFBFBF9),
      child: AnimatedOpacity(
        duration:
            Duration(milliseconds: homeProvider.showingOrdersPanel ? 500 : 300),
        opacity: homeProvider.showingOrdersPanel ? 1 : 0,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Text(
              "My\nOrder",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: DeviceVerifier.responsiveFontSize(context),
              ),
              maxLines: 2,
            ),
            SizedBox(height: size.width * 0.05),
            const Divider(
              endIndent: 20,
              indent: 20,
              height: 1,
              color: Color(0xFFF2F2F2),
            ),
            SizedBox(height: size.width * 0.05),
          ],
        ),
      ),
    );
  }
}
