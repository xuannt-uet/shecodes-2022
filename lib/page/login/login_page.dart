import 'package:flutter/gestures.dart';
import 'package:shecodes2022/config/app_color.dart';
import 'package:shecodes2022/fragment/common_buttom.dart';
import 'package:shecodes2022/fragment/default_page.dart';
import 'package:shecodes2022/fragment/form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shecodes2022/utils/app_routing.dart';
import 'package:sizer/sizer.dart';

import 'login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginCubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is LoginSuccess) {
          EasyLoading.dismiss();
          Navigator.pushReplacementNamed(context, RouteDefine.home.name);
        }
        if (state is LoginLoading) {
          EasyLoading.show();
        }
        if (state is LoginFailed) {
          EasyLoading.dismiss();
          final snackBar = SnackBar(
            content: Text(state.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      bloc: _loginCubit,
      builder: (context, state) {
        return AppScaffold(
          title: 'Login',
          isBack: false,
          scrollable: true,
          body: FormBuilder(
            key: _loginCubit.fbKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormElement(
                  title: 'Email',
                  isRequired: true,
                  name: 'email',
                  type: FieldType.textField,
                  hintText: 'exemple@mail.com',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.email(errorText: 'Invalid email'),
                      FormBuilderValidators.required(errorText: 'This field is mandatory'),
                    ],
                  ),
                ),
                FormElement(
                  title: 'Password',
                  isRequired: true,
                  name: 'password',
                  type: FieldType.password,
                  hintText: 'XXXXXXXX',
                  validator: FormBuilderValidators.required(errorText: 'This field is mandatory'),
                ),
                SizedBox(height: 8.h),
                CommonButton(
                  onTap: () {
                    if (_loginCubit.fbKey.currentState?.saveAndValidate() == true) {
                      _loginCubit.login();
                    }
                  },
                  width: 80.w,
                  actionTitle: 'Login',
                ),
                SizedBox(height: 2.h),
                RichText(
                  text: TextSpan(
                    text: 'Or create new account ',
                    style: TextStyle(fontSize: 14.sp, color: AppColor.hintTextColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'here',
                        style: const TextStyle(
                          color: AppColor.themeColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushNamed(context, RouteDefine.register.name);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
