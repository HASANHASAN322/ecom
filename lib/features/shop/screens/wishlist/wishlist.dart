import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/layout/grid_layout.dart';
import 'package:e_comm/common/widgets/loader/animation_loader.dart';
import 'package:e_comm/features/shop/controllers/product/favourites_controller.dart';
import 'package:e_comm/navigation_menu.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/cloud_helper_functions.dart';
import 'package:e_comm/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance ;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'المفضلة',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace / 1.5),
          child: Column(
            children: [
              Obx(() => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {

                    final emptyWidget = TAnimationLoaderWidget(
                      text: 'القائمة فارغة',
                      animation: 'assets/images/animations/141594-animation-of-docer.json' ,
                      showAction: true,
                      actionText: 'لنقم باضافة بعض المنتجات',
                      onActionPressed: ()=>  Get.off(()=> const NavigationMenu()),
                    ) ;

                    const loader = TVerticalProductShimmer(itemCount: 6,) ;
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , loader: loader , nothingFound: emptyWidget) ;
                    if(widget  != null ) return widget ;
                    final products = snapshot.data!;
                    return TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: products[index],));
                  }
              )),
            ],
          ),
        ),
      ),
    );
  }
}
//
