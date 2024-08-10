import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/list_of_files.dart';

import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/no_files_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView>
    with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
  }

  Map<String, List<dynamic>> tabs = {};
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: tabs.isEmpty
          ? Center(
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      tabs['Tab ${tabs.length + 1}'] = [];

                      _controller = TabController(
                        length: tabs.length,
                        vsync: this,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.green,
                ),
              ),
            )
          : Column(
              children: [
                const SizedBox(
                  height: AppSize.size20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      tabs['Tab ${tabs.length + 1}'] = [];

                      _controller = TabController(
                          length: tabs.length,
                          vsync: this,
                          initialIndex: _controller!.index);
                    });
                  },
                  child: Text(
                    'Add Service',
                    style: StyleManager.fontMedium16.copyWith(
                      color: ColorsHelper.turquoise,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TabBar(
                  tabAlignment: tabs.length > 5 ? TabAlignment.start : null,
                  dragStartBehavior: DragStartBehavior.start,
                  isScrollable: tabs.length > 5 ? true : false,
                  controller: _controller,
                  unselectedLabelColor: ColorsHelper.lighGrey,
                  labelColor: Colors.black,
                  indicatorColor: ColorsHelper.turquoise,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: AppSize.size20,
                    vertical: AppSize.size10,
                  ),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: List.generate(
                    tabs.length,
                    (index) => Text(
                      tabs.keys.elementAt(index),
                    ),
                  ),
                  onTap: (index) => _controller!.animateTo(index),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: List.generate(tabs.length, (index) {
                      if (tabs.values.elementAt(index).isEmpty) {
                        return NoFilesWidget(
                          onAddFilePressed: () {
                            tabs.values.elementAt(index).add('hi');
                            setState(() {});
                          },
                        );
                      } else {
                        return ListOfFiles(
                          files: tabs.values.elementAt(index),
                          onUploadFilePressed: () {
                            tabs.values.elementAt(index).add('hi');
                            setState(() {});
                          },
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
    );
  }
}
