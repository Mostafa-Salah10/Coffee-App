import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:coffee_app/features/auth/presentation/widgets/cusotm_text_form_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSigninForm extends StatelessWidget {
  const CustomSigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>();
    final authWatch = context.watch<AuthCubit>();
    return Form(
      key: auth.signInKey,
      child: Column(
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.phone,
            label: AppStrings.phoneNum,
            onChanged: (phone) {},
            prefixIcon: _getIcon(icon: Icons.phone_android),
          ),
          CustomTextFormField(
            label: AppStrings.pass,
            onChanged: (pass) {},
            prefixIcon: _getIcon(icon: Icons.password),
            isSecure: auth.isSecure,
            onTapSuffixIcon: () => auth.togglePassIcon(),
            suffixIcon:
                authWatch.isSecure
                    ? _getIcon(icon: Icons.visibility)
                    : _getIcon(icon: Icons.visibility_off),
          ),
        ],
      ),
    );
  }

  Icon _getIcon({required IconData icon}) {
    return Icon(icon, color: AppColors.ligthGray, size: 20);
  }
}
