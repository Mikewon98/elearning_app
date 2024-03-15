import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learningapp/common/routes/names.dart';
import 'package:learningapp/common/values/constant.dart';
import 'package:learningapp/pages/application/app_bloc/app_bloc.dart';
import 'package:learningapp/pages/global.dart';
import 'package:learningapp/pages/profile/settings/settings_bloc/settings_bloc.dart';
import 'package:learningapp/pages/profile/settings/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUseData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, removeUseData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
