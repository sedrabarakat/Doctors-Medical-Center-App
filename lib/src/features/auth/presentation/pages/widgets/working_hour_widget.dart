import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

class WorkingHourWidget extends StatefulWidget {
  const WorkingHourWidget({
    super.key,
    required this.day,
    required this.fromToControllers,
  });
  final String day;
  final List<FromToController> fromToControllers;
  @override
  State<WorkingHourWidget> createState() => _WorkingHourWidgetState();
}

class _WorkingHourWidgetState extends State<WorkingHourWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool isExpanded = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      upperBound: .5,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
            if (isExpanded) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          });
        },
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: DimensionsHelper.heightPercentage(context, 40),
          ),
          padding: const EdgeInsets.all(AppSize.size10),
          decoration: BoxDecoration(
            color: ColorsHelper.primary.withOpacity(.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    widget.day,
                    style: StyleManager.fontMedium16.copyWith(
                      color: ColorsHelper.black,
                    ),
                  ),
                  const Spacer(),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, state) {
                      return RotationTransition(
                        turns: _controller,
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: ColorsHelper.black,
                          size: 26,
                        ),
                      );
                    },
                  ),
                ],
              ),
              isExpanded
                  ? Flexible(
                      child: AnimationLimiter(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              verticalOffset: -250,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        onTap: () async {
                                          final x = await showTimePicker(
                                            context: context,
                                            initialTime: const TimeOfDay(
                                                hour: 13, minute: 30),
                                          );
                                          if (x != null) {
                                            widget
                                                .fromToControllers[index]
                                                .fromController
                                                .text = formatTimeOfDay(x);
                                          }
                                        },
                                        readOnly: true,
                                        labelText: 'From',
                                        controller: widget
                                            .fromToControllers[index]
                                            .fromController,
                                        height: 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        onTap: () async {
                                          final x = await showTimePicker(
                                            context: context,
                                            initialTime: const TimeOfDay(
                                                hour: 13, minute: 30),
                                          );
                                          if (x != null) {
                                            widget
                                                .fromToControllers[index]
                                                .toController
                                                .text = formatTimeOfDay(x);
                                          }
                                        },
                                        readOnly: true,
                                        labelText: 'To',
                                        controller: widget
                                            .fromToControllers[index]
                                            .toController,
                                        height: 40,
                                      ),
                                    ),
                                    IconButton(
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        index ==
                                                widget.fromToControllers
                                                        .length -
                                                    1
                                            ? BlocProvider.of<AuthCubit>(
                                                    context)
                                                .addFromToWidget(widget.day)
                                            : BlocProvider.of<AuthCubit>(
                                                    context)
                                                .deleteFromToWidget(
                                                    widget.day, index);
                                      },
                                      icon: Icon(
                                        index ==
                                                widget.fromToControllers
                                                        .length -
                                                    1
                                            ? Icons.add
                                            : Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: widget.fromToControllers.length,
                          shrinkWrap: true,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );
    return formattedTime;
  }
}
