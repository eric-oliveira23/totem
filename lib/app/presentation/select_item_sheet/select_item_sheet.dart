import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/core/themes/app_colors.dart';
import 'package:totem/app/core/util/cents_parser.dart';
import 'package:totem/app/core/util/device_verifier.dart';
import 'package:totem/app/core/util/money_format.dart';
import 'package:totem/app/domain/model/item.dart';
import 'package:totem/app/presentation/common/element_shrinker.dart';
import 'package:totem/app/presentation/select_item_sheet/selected_item_sheet_provider.dart';

class SelectItemSheet extends StatelessWidget {
  final Item selectedItem;

  const SelectItemSheet({
    super.key,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var selectedItemBs =
        Provider.of<SelectedItemSheetProvider>(context, listen: false);

    return SizedBox(
      height: size.height * .85,
      width: size.width,
      child: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  20,
                ),
                bottomRight: Radius.circular(
                  20,
                ),
              ),
              color: Colors.grey.shade300,
            ),
            padding: const EdgeInsets.fromLTRB(
              20,
              16,
              20,
              16,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElementShrinker(
                animateOnHover: true,
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.network(selectedItem.image ?? "", height: size.height * 0.3),
            SelectableText(
              selectedItem.title ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: DeviceVerifier.responsiveFontSizeBig(context),
              ),
            ),
            SelectableText(
              moneyFormat(
                CentsParser.centsToDollars(selectedItem.price ?? 0),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.yellowFFCA,
                fontSize: DeviceVerifier.responsiveFontSizeBig(context),
              ),
            ),
            const Incrementer(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                      left: 20,
                      right: 20,
                    ),
                    backgroundColor: AppColors.whiteF8F8,
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  child: const Text("Customize"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => selectedItemBs.doneTapped(selectedItem),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowFFCA,
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                      left: 20,
                      right: 20,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  child: const Text("Done"),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class Incrementer extends StatelessWidget {
  const Incrementer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IncrementerButton(onTap: () => {}, text: "-"),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            "1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: DeviceVerifier.responsiveFontSize(context),
            ),
          ),
        ),
        IncrementerButton(
          onTap: () => {},
          text: "+",
          backgroundColor: AppColors.yellowFFCA,
        ),
      ],
    );
  }
}

class IncrementerButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;

  const IncrementerButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElementShrinker(
      onTap: () => onTap.call(),
      child: Container(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 5,
          bottom: 5,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .5),
          color: backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: DeviceVerifier.responsiveFontSize(context),
          ),
        ),
      ),
    );
  }
}
