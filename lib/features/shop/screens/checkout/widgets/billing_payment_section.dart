import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return  Column(
      children:[
        TSectionHeading(title:  'وسيلة الدفع' , buttonTitle: '', onPressed: (){},) ,
        const SizedBox(height: TSize.spaceBtwItems/2,) ,
        Row(
          children: [
            TCircularContainer(
              width: 60,
              height: 35,
              backgroundColor: dark? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSize.sm),
              child: const Image(image: AssetImage(TImages.paypal) , fit: BoxFit.contain,),
            ) ,
            const SizedBox(height: TSize.spaceBtwItems/2,) ,
            Text('Paypal' , style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
