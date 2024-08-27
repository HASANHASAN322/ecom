import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/authentication/controllers/login/login_controller.dart';
import 'package:e_comm/features/personalization/screens/address/address.dart';
import 'package:e_comm/features/personalization/screens/settings/admin_pass.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_tiles/setting_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../admin_panel/all_orders.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/orders/orders.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(LoginController()) ;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// header
              TPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      TAppBar(
                        title: Text(
                          'معلومات الحساب',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white),
                        ),
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwSections,
                      ),

                      /// user profile card
                      TUserProfileTitle(
                          onPressed: () => Get.to(() => const ProfileScreen())),
                      const SizedBox(
                        height: TSize.spaceBtwSections,
                      ),
                    ],
                  )),

              /// body
              Padding(
                padding: const EdgeInsets.all(TSize.defaultSpace),
                child: Column(
                  children: [
                    /// Account Settings
                    const TSectionHeading(
                      title: 'الاعدادات',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    /// address
                    TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'العناوين',
                      subtitle: 'قم باضافة العناوين الخاصة بك',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    /// cart
                    TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'سلة المشتريات',
                      subtitle: 'اضافة وحذف و تاكيد المشتربات',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),
                    /// orders
                    TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'الطلبات',
                      subtitle: 'كل الطلبات التي قمت بشرائها',
                      onTap: () => Get.to(()=> const OrderScreen()),
                    ),

                    /// app setting
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    InkWell(
                      onTap:()=> Get.to(()=> const AdminPass()),
                      child:  const TSettingMenuTile(
                          icon: Iconsax.document_upload,
                          title: 'رفع منتج',
                          subtitle: 'رفع منتج جديد الى قاعدة البيانات'),
                    ),
                    TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'جميع الطلبات',
                      subtitle: ' كل الطلبات التي تم شرائها من الموقع',
                      onTap: () => Get.to(()=> const AllOrderScreen()),
                    ),

                    /// logout btn
                    const SizedBox(
                      height: TSize.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => controller.logout(context),
                        child: const Text('تسجيل الخروج'),
                      ),
                    ),
                    const SizedBox(
                      height: TSize.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
