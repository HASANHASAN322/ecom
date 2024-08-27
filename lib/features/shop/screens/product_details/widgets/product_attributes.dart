
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/controllers/product/variation_controller.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/chips/chips.dart';
import '../../../models/product_model.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: product.productAttributes!
            .map((attribute) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: attribute.name ?? '',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            Obx(() => Wrap(
              spacing: 8,
              children: attribute.values!.map((attributeValue) {
                final isSelected = controller
                    .selectedAttributes[attribute.name] ==
                    attributeValue;
                final available = controller
                    .getAttributesAvailabilityInVariation(
                    product.productVariations!,
                    attribute.name!)
                    .contains(attributeValue);
                return TChoiceChip(
                  text: attributeValue,
                  selected: isSelected,
                  onSelected: available
                      ? (selected) {
                    if (selected && available) {
                      controller.onAttributeSelected(
                          product,
                          attribute.name ?? '',
                          attributeValue);
                    }
                  }
                      : null,
                );
              }).toList(),
            ))
          ],
        ))
            .toList()));
  }
}
