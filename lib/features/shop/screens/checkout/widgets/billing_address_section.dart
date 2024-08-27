import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/personalization/controllers/address_controller.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: 'عنوان الشحن',
              buttonTitle: 'تغيير',
              onPressed: () => addressController.selectNewAddressPopup(context),
            ),
            addressController.selectedAddress.value.id.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressController.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwItems / 2,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(
                            width: TSize.spaceBtwItems,
                          ),
                          Text(
                            addressController.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwItems / 2,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_history,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(
                            width: TSize.spaceBtwItems,
                          ),
                          Row(
                            children: [
                              Text(
                                addressController.selectedAddress.value.country ,
                                style: Theme.of(context).textTheme.bodyMedium,
                                softWrap: true,
                              ),Text(
                                ' - ' ,
                                style: Theme.of(context).textTheme.bodyMedium,
                                softWrap: true,
                              ),
                              Text(
                                addressController.selectedAddress.value.city ,
                                style: Theme.of(context).textTheme.bodyMedium,
                                softWrap: true,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwItems / 2,
                      ),
                    ],
                  )
                : Text(
                    'اضف عنوان',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
          ],
        ));
  }
}
