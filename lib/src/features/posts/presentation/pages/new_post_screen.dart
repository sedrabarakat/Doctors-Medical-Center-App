import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/clip_path_container.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: clipPathContainer(context: context, label: "New post"),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.screenPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSize.size20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: .2,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Images",
                      style: StyleManager.fontMedium14.copyWith(
                        color: ColorsHelper.black,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: ColorsHelper.lightestGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorsHelper.primary),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: ColorsHelper.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.size20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSize.size20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: .2,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Caption",
                      style: StyleManager.fontMedium14.copyWith(
                        color: ColorsHelper.black,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    TextFormField(
                      cursorColor: ColorsHelper.primary,
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        enabledBorder: _buildBorder(Colors.black),
                        focusedBorder: _buildBorder(ColorsHelper.primary),
                        hintText: "Ask what you want ...",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
