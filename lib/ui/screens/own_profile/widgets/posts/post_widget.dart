import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/post_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../constants/app_styles.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({Key? key}) : super(key: key);

  @override
  State<SinglePostWidget> createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget> {
  final model = SinglePostWidgetModel();
  @override
  Widget build(BuildContext context) {
    return SinglePostWidgetModelProvider(
        model: model, child: const _SinglePostWidgetBody());
  }
}

class _SinglePostWidgetBody extends StatelessWidget {
  const _SinglePostWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int length =
        SinglePostWidgetModelProvider.watch(context)?.model.tasks?.length ?? 0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return PostListRowWidget(index: index,);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 9,
                );
              },
              itemCount: length),
        ),
      ),
    );
  }
}

class PostListRowWidget extends StatelessWidget {
  const PostListRowWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final post = SinglePostWidgetModelProvider.read(context)!.model.tasks?[index];
    print('${post?.date}');
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainWhite,
        border: Border.all(color: Colors.black.withOpacity(0.01)),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@${post!.author}',
                      style: AppStyles.s18w700.copyWith(
                          color: AppColors.mainBlack,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      post.date,
                      style: AppStyles.s16w400.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () => SinglePostWidgetModelProvider.read(context)?.model.deleteTask(post.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.blueNeutral,
                      border: Border.all(color: Colors.black.withOpacity(0.01)),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SvgPicture.asset(AppAssets.svg.quit,color: AppColors.iconButtonsNeutral,),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(post.content)),
            Row(
              children: [
                InkWell(
                  onTap: () => SinglePostWidgetModelProvider.read(context)?.model.likePost(post.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.blueNeutral,
                      border: Border.all(color: Colors.black.withOpacity(0.01)),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset(AppAssets.svg.likesNews,color: AppColors.iconButtonsNeutral)),
                        Text('${post.likes}',style: const TextStyle(color: AppColors.iconButtonsNeutral),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.blueNeutral,
                      border: Border.all(color: Colors.black.withOpacity(0.01)),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SvgPicture.asset(AppAssets.svg.commentNews,color: AppColors.iconButtonsNeutral,),
                  ),
                ),
                const SizedBox(width: 10,),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.blueNeutral,
                      border: Border.all(color: Colors.black.withOpacity(0.01)),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset(AppAssets.svg.shareNews,color: AppColors.iconButtonsNeutral,)),
                        Text('${post.shares}', style: const TextStyle(color: AppColors.iconButtonsNeutral)),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}