import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/app_colors.dart';
import 'information_screen_model.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {
  bool isChecked = false;
  final model = InformationScreenModel();
  @override
  Widget build(BuildContext context) {
    return InformationScreenModelProvider(model: model, child: const _InformationScreenBody(),);
  }
}
class _InformationScreenBody extends StatelessWidget {
  const _InformationScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void pressedButton() {
      InformationScreenModelProvider.read(context)?.model.createAccount(context);
     Navigator.push(context, MainNavigationPush().security);
    }
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.mainBlack,
        ),
        backgroundColor: AppColors.mainWhite,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          AppAssets.images.testMiniLogo,
          scale: 2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Text(
                "${AppLocalizations.of(context)?.personalInfo}",
                style: AppStyles.s21w500,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 46,
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: AppColors.regWhite,
                        child: Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.blue,
                          size: 34,
                        ),
                      )),
                  const SizedBox(
                    width: 24,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              errorText: InformationScreenModelProvider.watch(context)?.model.errorText,
                              hintText: "${AppLocalizations.of(context)?.name}",
                              fillColor: AppColors.regWhite,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(14.0),),
                              )
                          ),
                          onChanged: (value) => InformationScreenModelProvider.read(context)?.model.firstName = value,
                        ),
                        const SizedBox(height: 5,),
                        TextField(
                          decoration: InputDecoration(
                              errorText: InformationScreenModelProvider.watch(context)?.model.errorText,
                              hintText: "${AppLocalizations.of(context)?.surname}",
                              fillColor: AppColors.regWhite,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(14.0),),
                              )
                          ),
                          onChanged: (value) => InformationScreenModelProvider.read(context)?.model.secondName = value,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24,),
              TextField(
                decoration: InputDecoration(
                    errorText: InformationScreenModelProvider.watch(context)?.model.errorText,
                    hintText: "${AppLocalizations.of(context)?.login}",
                    fillColor: AppColors.regWhite,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0),),
                    )
                ),
                onChanged: (value) => InformationScreenModelProvider.read(context)?.model.nickname = value,
              ),
              const SizedBox(height: 24,),
              TextField(
                decoration: InputDecoration(
                    errorText: InformationScreenModelProvider.watch(context)?.model.errorText,
                    hintText: "${AppLocalizations.of(context)?.dateOfBirth}",
                    fillColor: AppColors.regWhite,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0),),
                    )
                ),
                onChanged: (value) => InformationScreenModelProvider.read(context)?.model.dateOfBirth = value,
              ),
              const SizedBox(height: 24,),
              TextField(
                decoration: InputDecoration(
                    errorText: InformationScreenModelProvider.watch(context)?.model.errorText,
                    hintText: "${AppLocalizations.of(context)?.gender}",
                    fillColor: AppColors.regWhite,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0),),
                    )
                ),
                onChanged: (value) => InformationScreenModelProvider.read(context)?.model.gender = value,
              ),
              const SizedBox(height: 24,),
              ElevatedButton(
                  onPressed: pressedButton,
                  child: Text("${AppLocalizations.of(context)?.continee}",
                      style: AppStyles.s16w400
                          .copyWith(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}

