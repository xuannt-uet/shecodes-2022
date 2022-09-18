import 'package:shecodes2022/fragment/common_buttom.dart';
import 'package:shecodes2022/fragment/default_page.dart';
import 'package:shecodes2022/fragment/form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shecodes2022/page/register/register_cubit.dart';
import 'package:shecodes2022/utils/app_routing.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerCubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          EasyLoading.dismiss();
          Navigator.pushReplacementNamed(context, RouteDefine.home.name);
        }
        if (state is RegisterLoading) {
          EasyLoading.show();
        }
        if (state is RegisterFailed) {
          EasyLoading.dismiss();
          final snackBar = SnackBar(
            content: Text(state.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      bloc: _registerCubit,
      builder: (context, state) {
        return AppScaffold(
          title: 'Register',
          scrollable: true,
          body: FormBuilder(
            key: _registerCubit.fbKey,
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
                  title: 'Name',
                  isRequired: true,
                  name: 'name',
                  type: FieldType.textField,
                  hintText: 'Nguyen Van A',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(errorText: 'This field is mandatory'),
                    ],
                  ),
                ),
                FormElement(
                  title: 'Phone number',
                  isRequired: true,
                  name: 'phoneNumber',
                  type: FieldType.textField,
                  hintText: '0987657665',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(errorText: 'This field is mandatory'),
                    ],
                  ),
                ),
                FormElement(
                  title: 'Date of birth',
                  isRequired: true,
                  name: 'dateOfBirth',
                  type: FieldType.dateTime,
                  hintText: 'MM/dd/YYYY',
                  validator: FormBuilderValidators.compose(
                    [
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
                    if(_registerCubit.fbKey.currentState?.saveAndValidate() == true){
                      _registerCubit.register();
                    }
                  },
                  width: 80.w,
                  actionTitle: 'Register',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
