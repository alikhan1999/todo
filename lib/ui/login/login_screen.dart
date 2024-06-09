import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/application/core/result.dart';
import 'package:todo/application/main_config/routes/route_import.dart';
import 'package:todo/application/network/error_handler/error_handler.dart';
import 'package:todo/constant/Images/const_image.dart';
import 'package:todo/constant/text_style/text_style.dart';
import 'package:todo/data/models/auth/login_model.dart';
import 'package:todo/domain/entities/auth_entity.dart';
import 'package:todo/provider/login_view_model.dart';
import 'package:todo/ui/base/base_widget.dart';
import 'package:todo/widgets/base_scaffold.dart';
import 'package:todo/widgets/big_btn.dart';

class LoginScreen extends BaseStateFullWidget {
  LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> implements Result<AuthModel> {
  TextEditingController studentIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String studentIdValue;
  late String passwordValue;

  @override
  void initState() {
    // final progress = ProgressHUD.of(context);
    // progress?.showWithText('Loading...');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWithBaseContainer(
      // bodyColor: Style.bgColor,

      padding: EdgeInsets.zero,
      scroll: false,
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return ListView(
            shrinkWrap: true,
            primary: true,
            physics: const BouncingScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.05,
              // ),
              Image.asset(AppConstImages.loginLogo,
                  width: MediaQuery.of(context).size.width * 0.9, height: MediaQuery.of(context).size.height * 0.45, fit: BoxFit.cover),
              // Spacer(),
              Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 30, right: 30),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(AppStrings.studentLogin, style: headingTextStyle),
                    Text("Student", style: headingTextStyle),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: studentIdController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      autofocus: true,
                      decoration: InputDecoration(
                        // labelText: AppStrings.studentIdLabel,
                        labelText: "student",
                        labelStyle: const TextStyle(color: Style.black),
                        prefixIcon: const Icon(Icons.person),
                        border: const OutlineInputBorder(),
                        enabledBorder: kOutlineInputBorder(color: Style.black),
                        focusedBorder: kOutlineInputBorder(color: Style.black),
                      ),
                      validator: (studentId) {
                        if (studentId == null || studentId.isEmpty) {
                          return 'Student Id field empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        // labelText: AppStrings.passwordLabel,
                        labelText: "password",
                        labelStyle: const TextStyle(color: Style.black),
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        enabledBorder: kOutlineInputBorder(color: Style.black),
                        focusedBorder: kOutlineInputBorder(color: Style.black),
                      ),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Password field empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    BigBtn(
                      radius: 12,
                      color: Style.blueColor,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          final progress = ProgressHUD.of(context);
                          progress?.showWithText('Loading...');
                          final isComplete = await context
                              .read<AuthViewModel>()
                              .userLogin(AuthEntity(email: studentIdController.text.trim(), password: passwordController.text.trim()), this);

                          isComplete ? progress?.dismiss() : progress?.dismiss();
                        }

                        // widget.navigator.pushNamed(RoutePath.tabScreen);
                      },
                      child: Text(
                        // AppStrings.loginButtonText.toUpperCase(),
                        "Login",
                        style: const TextStyle(fontSize: 16, color: Style.whiteColor),
                      ),
                    )
                    // SizedBox(
                    //   width: double.maxFinite,
                    //   height: 48,
                    //   child: ElevatedButton(
                    //     child: Text(AppStrings.loginButtonText.toUpperCase()),
                    //     onPressed: () {
                    //       print('Login Button Pressed');
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    studentIdController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  kOutlineInputBorder({Color? color}) =>
      OutlineInputBorder(borderSide: BorderSide(color: color ?? Style.black), borderRadius: BorderRadius.circular(widget.dimens.k15));

  @override
  onError(Failure error) {
    String _error = ErrorMessage.fromError(error).message.toString();
    widget.navigator.displayToast(_error);
  }

  @override
  onSuccess(AuthModel result) {
    widget.navigator.displayToast("Login SuccessFully");
    widget.navigator.pushNamed(RoutePath.changePasswordScreen);
  }
}
