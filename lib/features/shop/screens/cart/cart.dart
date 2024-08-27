import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/loader/animation_loader.dart';
import 'package:e_comm/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_comm/navigation_menu.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'سلة المشتريات',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: 'سلة مشترياتك فارغة',
          animation: 'assets/images/animations/53207-empty-file.json',
          showAction: true,
          actionText: 'لنقم بالشراء اولا',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSize.defaultSpace),
              child: TCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar:controller.cartItems.isEmpty? const SizedBox() : Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(() => Text('التأكيد \$${controller.totalCartPrice.value}'))),
      ),
    );
  }
}
