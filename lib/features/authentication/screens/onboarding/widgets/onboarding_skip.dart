import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSize.defaultSpace / 2,
        child: TextButton(
          child: const Text('تخطي'  , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14 ),),
          onPressed: () => OnBoardingController.instance.skipPage(),
        ));
  }
}
