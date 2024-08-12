import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/session_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientSessionsScreen extends StatefulWidget {
  const PatientSessionsScreen({super.key});

  @override
  State<PatientSessionsScreen> createState() => _PatientSessionsScreenState();
}

class _PatientSessionsScreenState extends State<PatientSessionsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient Sessions",
          style: StyleManager.fontMedium18.copyWith(
            color: ColorsHelper.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsHelper.black,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsHelper.primary,
          ),
          dividerColor: ColorsHelper.lighGrey,
          labelColor: ColorsHelper.white,
          unselectedLabelColor: ColorsHelper.black,
          indicatorPadding: const EdgeInsets.only(bottom: 10),
          tabs: const [
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.size20,
                right: AppSize.size20,
                top: AppSize.size10,
                bottom: AppSize.size20,
              ),
              child: Text(
                "Archive",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.size20,
                right: AppSize.size20,
                top: AppSize.size10,
                bottom: AppSize.size20,
              ),
              child: Text(
                'Opened',
              ),
            ),
          ],
          onTap: (index) => _tabController.animateTo(index),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(AppSize.screenPadding),
            itemBuilder: (context, index) => SessionCard(
              onTap: () {
                context.push(AppRouter.kSessionInformation);
              },
              isOpen: false,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSize.size10,
            ),
            itemCount: 10,
          ),
          ListView.separated(
            padding: const EdgeInsets.all(AppSize.screenPadding),
            itemBuilder: (context, index) => SessionCard(
              onTap: () {
                context.push(AppRouter.kSessionInformation);
              },
              isOpen: true,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSize.size10,
            ),
            itemCount: 1,
          ),
        ],
      ),
    );
  }
}
