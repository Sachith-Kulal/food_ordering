
import 'package:flutter/material.dart';
import 'package:food_ordering/infrastructure/theme/app_colors.dart';

import 'package:get/get.dart';

import 'controllers/order_details.controller.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProductInfo();
    return Scaffold(
        backgroundColor: AppColors.secondaryBackground,
        appBar: AppBar(
          backgroundColor: AppColors.canvasColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
            onPressed: () async {
              Get.back();
            },
          ),
          title: Text(
            'Order Details',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: Get.width - 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userName,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  Text(
                      controller.userEmail,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  const Divider(
                    height: 25,
                    thickness: 1,
                    // color: Color(0xFFFA4A0C),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              controller.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontSize: 18),
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Icon(
                                            Icons.currency_rupee,
                                            color: AppColors.secondaryText,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          controller.price.toString(),
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),

                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppColors.buttonColor),
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                controller.discernment(
                                                    price: 10);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 16,
                                              )),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3, vertical: 2),
                                            child: Obx(() {
                                              return Text(
                                                controller.count.value
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              );
                                            }),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                controller.increment(price: 10);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 16,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 25,
                    thickness: 1,
                    color: Color(0xFFFA4A0C),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 18, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: Icon(
                                Icons.currency_rupee,
                                color: AppColors.secondaryText,
                                size: 14,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                controller.totalAmount.value.toString(),
                                textAlign: TextAlign.end,
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(75, 0, 75, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.order();
                              },
                              child: const Text("Pay")),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
