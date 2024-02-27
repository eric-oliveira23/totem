import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/core/util/device_verifier.dart';
import 'package:totem/app/domain/model/category.dart';
import 'package:totem/app/presentation/common/element_shrinker.dart';
import 'package:totem/app/presentation/home/home_provider.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageSize = (size.width + size.height) * 0.08;
    final homeProvider = Provider.of<HomeProvider>(context);

    return ElementShrinker(
      onTap: () => homeProvider.categoryClicked(category),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Color(0XFFF8F8F7),
          ),
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                category.image ?? "",
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
              Text(
                category.title ?? "",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: DeviceVerifier.responsiveFontSize(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
