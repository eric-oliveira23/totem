import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/core/util/device_verifier.dart';
import 'package:totem/app/domain/model/item.dart';
import 'package:totem/app/presentation/common/element_shrinker.dart';
import 'package:totem/app/presentation/home/home_provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageSize = (size.width + size.height) * 0.05;
    final homeProvider = Provider.of<HomeProvider>(context);

    return ElementShrinker(
      onTap: () => {
        homeProvider.showingOrdersPanel = !homeProvider.showingOrdersPanel,
      },
      child: AnimatedContainer(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          // color: Color(0XFFF8F8F7),
        ),
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              item.image ?? "",
              fit: BoxFit.cover,
              width: imageSize,
              height: imageSize,
            ),
            Text(
              item.title ?? "",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: DeviceVerifier.responsiveFontSize(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
