import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../common/widgets/loader/animation_loader.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/cloud_helper_functions.dart';
import '../../utils/helpers/helper_functions.dart';
import 'controller/admin_controller.dart';

class AllOrderScreen extends StatelessWidget {
  const AllOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar:  TAppBar(
        showBackArrow: true,
        title: Text(
          'الطلبات',
          style: Theme.of(context)
              .textTheme
              .headlineSmall,
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child:FutureBuilder(
            future: controller.fetchAllUsersOrders(),
            builder: (_, snapshot) {
              const emptyWidget = TAnimationLoaderWidget(
                  text: '',
                  showAction: false,
                  animation:
                  'assets/images/animations/order-complete-car-delivery-animation.json');

              final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , nothingFound: emptyWidget) ;
              if(response != null) return response ;
              final orders = snapshot.data! ;
              return ListView.separated(
                shrinkWrap: true,
                itemCount: orders.length,
                separatorBuilder: (_, __) => const SizedBox(
                  height: TSize.spaceBtwItems,
                ),
                itemBuilder: (_, index) {
                  final order = orders[index] ;
                  return TCircularContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSize.sm),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// row1
                        Row(
                          children: [
                            /// icon
                            const Icon(Iconsax.ship),
                            const SizedBox(
                              width: TSize.spaceBtwItems / 2,
                            ),

                            /// Status & date
                            Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.orderStatusText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(
                                          color: TColors.primary, fontWeightDelta: 1),
                                    ),
                                    Text(
                                      order.formattedOrderDate,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                  ],
                                )),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.arrow_right_34,
                                size: TSize.iconSm,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: TSize.spaceBtwItems,
                        ),

                        /// row2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  /// icon
                                  const Icon(Iconsax.tag),
                                  const SizedBox(
                                    width: TSize.spaceBtwItems / 2,
                                  ),

                                  /// Status & date
                                  Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order',
                                            style:
                                            Theme.of(context).textTheme.labelMedium,
                                          ),
                                          Text(
                                            order.id,
                                            style:
                                            Theme.of(context).textTheme.titleMedium,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  /// icon
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                    width: TSize.spaceBtwItems / 2,
                                  ),

                                  /// Status & date
                                  Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Shipping date',
                                            style:
                                            Theme.of(context).textTheme.labelMedium,
                                          ),
                                          Text(
                                            order.formattedDeliveryDate,
                                            style:
                                            Theme.of(context).textTheme.titleMedium,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

