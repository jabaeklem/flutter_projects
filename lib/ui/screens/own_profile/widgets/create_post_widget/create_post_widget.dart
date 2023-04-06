import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/own_profile/widgets/create_post_widget/create_post_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/app_colors.dart';

class CreatePostWidgetProfile extends StatefulWidget {
  const CreatePostWidgetProfile({Key? key}) : super(key: key);

  @override
  State<CreatePostWidgetProfile> createState() =>
      _CreatePostWidgetProfileState();
}

class _CreatePostWidgetProfileState extends State<CreatePostWidgetProfile> {
  final model = CreatePostWidgetModel();
  @override
  Widget build(BuildContext context) {
    return CreatePostWidgetModelProvider(
      model: model,
      child: const _CreatePostWidgetBody(),
    );
  }
}

class _CreatePostWidgetBody extends StatelessWidget {
  const _CreatePostWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlack,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.svg.quit),
        ),
        title: Text(
          '${AppLocalizations.of(context)?.newPost}',
          style: AppStyles.s21w500,
        ),
        actions: [
          IconButton(
            onPressed: () => CreatePostWidgetModelProvider.watch(context)
                ?.model
                .createPost(context),
            icon: Icon(Icons.check),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: TextField(
        onChanged: (value) =>
            CreatePostWidgetModelProvider.watch(context)?.model.content = value,
        autofocus: true,
        minLines: null,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          hintText: '${AppLocalizations.of(context)?.whatsNew}',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
