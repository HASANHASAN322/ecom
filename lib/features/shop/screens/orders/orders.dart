import 'package:e_comm/features/shop/screens/orders/widgets/orders_list.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),
        child: TOrdersListItems(),
      ),
    );
  }
}

