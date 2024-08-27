import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/shimmer/shimmer.dart';
import '../images/t_circular_image.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading:      SizedBox(
        child: Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image =
          networkImage.isNotEmpty ? networkImage : TImages.user;
          return controller.imageUploading.value
              ? const TShimmerEffect(
            width: 80,
            height: 80,
            radius: 80,
          )
              : TCircularImage(
            padding: 2,
            image: image,
            width: 60,
            height: 60,
            isNetworkImage: networkImage.isNotEmpty,
          );
        }),
      ),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 80);
        } else {
          return Text(
            controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          );
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 80);
        } else {
          return Text(
            controller.user.value.email,
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)
          );
        }
      }),


      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
