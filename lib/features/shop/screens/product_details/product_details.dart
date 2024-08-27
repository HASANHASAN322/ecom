import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product Image Slider
            TProductImageSlider(product: product,),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSize.defaultSpace,
                left: TSize.defaultSpace,
                bottom: TSize.defaultSpace,
              ),
              child: Column(
                children: [

                  /// price -- title -- stock & brand
                  TProductMetaData(product: product,),


                  /// description
                  const TSectionHeading(title: 'الوصف'),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// reviews
                  const Divider(),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
