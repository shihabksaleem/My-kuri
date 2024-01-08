import 'package:flutter/material.dart';
import 'package:mykuri/core/app_utils.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reusable_loading_widget.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/login_screen/view/login_screen.dart';
import 'package:mykuri/presentation/reset_password_screen/controller/reset_password_screen_controller.dart';

import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.accessToken});
  final String? accessToken;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();
  final GlobalKey<FormState> confirmPassformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final resetPasswordScreenState = Provider.of<ResetPasswordScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.mykuriWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorConstant.mykuriTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Recover password',
                  style: TextStyle(fontSize: 35, color: ColorConstant.mykuriPrimaryBlue, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Please enter your new password to continue"),
              SizedBox(height: 70),
              RefactoredTextField(
                formKey: passwordFormKey,
                name: "New Password",
                controller: newPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a new password';
                  }
                  // Add more validation if needed
                  return null;
                },
              ),
              RefactoredTextField(
                formKey: confirmPassformKey,
                name: "Repeat password",
                controller: repeatPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please repeat the password';
                  }
                  if (value != newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            resetPasswordScreenState.isLoading
                ? ReusableLoadingWidget()
                : GestureDetector(
                    onTap: () {
                      if (passwordFormKey.currentState!.validate() && confirmPassformKey.currentState!.validate()) {
                        // Perform the password change logic here

                        if (widget.accessToken != null) {
                          Provider.of<ResetPasswordScreenController>(context, listen: false)
                              .onResetPassword(
                                  token: widget.accessToken!,
                                  cPass: repeatPasswordController.text.trim(),
                                  pass: newPasswordController.text.trim())
                              .then((value) {
                            if (value) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                  (route) => false);
                            }
                          });
                        } else {
                          AppUtils.oneTimeSnackBar("This action can't be performed at this moment", context: context);
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration:
                          BoxDecoration(color: ColorConstant.mykuriPrimaryBlue, borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Change password".toUpperCase(),
                          style: TextStyle(color: ColorConstant.mykuriWhite, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
