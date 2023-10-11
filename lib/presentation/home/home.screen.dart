import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering/domain/core/models/product.dart';
import 'package:food_ordering/infrastructure/theme/app_colors.dart';

import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasColor,

      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.canvasColor,
        ),
        backgroundColor: AppColors.canvasColor,
        automaticallyImplyLeading: false,
        title: Text('Order Now',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors.primaryColor)),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                color: AppColors.secondaryText,
                size: 24,
              ),
              onPressed: () async {
                controller.logoOut();
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our menu is below',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,
            ),
            const SizedBox(height: 10,),
            Expanded(
                child: FutureBuilder<List<Product>>(
                  future: controller.getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Get.toNamed(Routes.ORDER_DETAILS, arguments:
                                    {
                                      "image": snapshot.data![index].image,
                                      "name": snapshot.data![index].name,
                                      "price": snapshot.data![index].price,
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x411D2429),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                0, 1, 1, 1),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(6),
                                              child: Image.network(
                                                snapshot.data![index].image,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  8, 8, 4, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data![index].name,
                                                    style:
                                                    Theme
                                                        .of(context)
                                                        .textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    mainAxisSize: MainAxisSize
                                                        .max,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        child: Icon(
                                                          Icons
                                                              .currency_rupee,
                                                          color:
                                                          AppColors
                                                              .secondaryText,
                                                          size: 14,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            .price.toString(),
                                                        textAlign: TextAlign
                                                            .end,
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0, 4, 0, 0),
                                                child: Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: Color(0xFF57636C),
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      return const Center(
                        child: Text("something went wrong"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
