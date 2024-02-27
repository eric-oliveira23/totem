import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/core/util/device_verifier.dart';
import 'package:totem/app/presentation/home/home_provider.dart';
import 'package:totem/app/presentation/widgets/category_tile.dart';
import 'package:totem/app/presentation/widgets/item_tile.dart';
import 'package:totem/app/presentation/widgets/order_side_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Consumer<HomeProvider>(builder: (context, homeProvider, _) {
        return Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0.05,
                    0,
                    size.width * 0.05,
                    0,
                  ),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      scrollbars: false,
                    ),
                    child: SingleChildScrollView(
                      controller: homeProvider.itemsScrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 100),
                            child: SelectableText(
                              "Hey,",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceVerifier.responsiveFontSizeBig(
                                  context,
                                ),
                              ),
                            ),
                          ),
                          SelectableText(
                            "Whats up?",
                            style: TextStyle(
                              fontSize:
                                  DeviceVerifier.responsiveFontSizeBig(context),
                            ),
                          ),

                          // categories

                          GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: homeProvider.categories.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: size.width < 1081 ? 2 : 4,
                            ),
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                category: homeProvider.categories[index],
                              );
                            },
                          ),

                          // items

                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: homeProvider.doPlayOpacityAnim ? 1 : 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText(
                                  homeProvider.selectedCategory?.title ?? "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        DeviceVerifier.responsiveFontSizeBig(
                                      context,
                                    ),
                                  ),
                                ),
                                if (homeProvider.selectedCategory != null)
                                  GridView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: homeProvider
                                        .selectedCategory?.items?.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: size.width < 1081 ? 3 : 4,
                                    ),
                                    itemBuilder: (context, index) {
                                      return ItemTile(
                                        item: homeProvider
                                            .selectedCategory!.items![index],
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // side panel

              OrderSidePanel(size: size),
            ],
          ),
        );
      }),
    );
  }
}
