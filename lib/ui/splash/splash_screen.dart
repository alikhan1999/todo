import 'package:flutter/material.dart';
import 'package:todo/application/main_config/routes/route_path.dart';
import 'package:todo/constant/Images/const_image.dart';
import 'package:todo/data/local_data_source/preference/i_pref_helper.dart';
import 'package:todo/di/di.dart';
import 'package:todo/ui/base/base_widget.dart';
import 'package:todo/widgets/base_scaffold.dart';

class SplashScreen extends BaseStateFullWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  IPrefHelper pref = inject<IPrefHelper>();
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    //SharedPref.remove(AppConstants.token);

    controller = AnimationController(duration: const Duration(milliseconds: 4000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        widget.navigator.pushReplacementNamed(RoutePath.loginScreen);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    //this will start the animation
    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWithBaseContainer(
      scroll: false,
      padding: EdgeInsets.zero,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: Image.asset('assets/images/top_circle.png', width: MediaQuery.of(context).size.width * 0.8, height: 70),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/building_bg.jpg',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/bottom_circle.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.14,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.18,
                    ),
                    child: FadeTransition(
                      opacity: animation,
                      child: Image.asset(
                        AppConstImages.newLogo,
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
