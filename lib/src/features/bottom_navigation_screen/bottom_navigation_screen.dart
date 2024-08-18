import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/services/api_services_impl.dart';
import 'package:doctor_app/core/domain/urls/app_url.dart';
import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/helper/dio_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../profile_doctor/presentation/pages/profile_doctor.dart';
import '../home/presentation/screen/home.dart';
import '../online_consultation/presentation/screen/doctor_schedule.dart';
import '../patient_profile/presentation/pages/patients_list.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final PageController _pageController = PageController();
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  //todo put the actual screens
  final List<Widget> bottomBarPages = [
    const DoctorSchedule(),
    const PatientsList(),
    const Home(),
    const Test4(),
    const PostsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: ColorsHelper.white,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 0,
        notchColor: ColorsHelper.primary,
        removeMargins: true,
        showShadow: false,
        durationInMilliSeconds: 300,
        itemLabelStyle: StyleManager.fontMedium13.copyWith(
          color: const Color(0XFF8891A5),
        ),
        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.call),
            activeItem: Icon(
              Icons.call,
              color: ColorsHelper.white,
            ),
            itemLabel: "Call",
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.people_outline_sharp),
            activeItem: Icon(
              Icons.people,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Patients',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.home),
            activeItem: Icon(
              Icons.home,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person),
            activeItem: Icon(
              Icons.person,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Profile',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.library_books_rounded),
            activeItem: Icon(
              Icons.library_books_rounded,
              color: ColorsHelper.white,
            ),
            itemLabel: 'Posts',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            HomeCubit.get(context).getComingAppointment();
            HomeCubit.get(context).getComingAppointment();
            HomeCubit.get(context).getNextPatient();
          }
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      ),
    );
  }
}

// todo delete this
class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 1",
          ),
        ),
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 2",
          ),
        ),
      ),
    );
  }
}

class Test3 extends StatelessWidget {
  const Test3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 3",
          ),
        ),
      ),
    );
  }
}

class Test4 extends StatefulWidget {
  const Test4({super.key});

  @override
  State<Test4> createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  bool isLoading = false;
  List<PatientModel> patients = [];
  @override
  void initState() {
    getPatients();
    super.initState();
  }

  Future<void> getPatients() async {
    setState(() {
      isLoading = true;
    });
    ApiServices service = ApiServicesImp(DioHelper().dio);
    final response = await service.get(AppUrl.patientList);
    for (int i = 0; i < response['data'].length; i++) {
      final temp = PatientModel.fromJson(response['data'][i]);
      patients.add(temp);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsHelper.blue,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(
                AppSize.screenPadding,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.push(
                      AppRouter.kPatientProfileScreen,
                      extra: patients[index],
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsHelper.lighGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(patients[index].userData.firstName),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: patients.length,
              ),
            ),
    );
  }
}

class Test5 extends StatelessWidget {
  const Test5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Page 5",
          ),
        ),
      ),
    );
  }
}
