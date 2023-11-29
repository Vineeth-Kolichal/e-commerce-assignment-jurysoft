import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/controller/image_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailedView extends StatelessWidget {
  const ProductDetailedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> images = [
      "https://rukminim1.flixcart.com/image/850/1000/xif0q/mobile/1/d/y/-original-imaghxcpvtta2hzs.jpeg?q=90",
      "https://rukminim1.flixcart.com/image/850/1000/xif0q/mobile/1/d/y/-original-imaghxcpvtta2hzs.jpeg?q=90"
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Column(children: [
                    Consumer(
                      builder: (context, ref, _) {
                        int index = ref.watch(imageViewProvider);
                        return SizedBox(
                          // height: size.width,
                          width: size.width,
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )
                  ]),
                  Space.y(10),
                  SizedBox(
                    height: 50,
                    //width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Consumer(
                          builder: (context, ref, _) {
                            int selected = ref.watch(imageViewProvider);
                            return InkWell(
                              onTap: () {
                                ref.read(imageViewProvider.notifier).state =
                                    index;
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: (selected == index)
                                        ? Border.all(
                                            width: 2, color: Colors.blue)
                                        : Border.all(
                                            width: 1, color: Colors.grey)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Space.x(5);
                      },
                    ),
                  ),
                  Space.y(10),
                  Text(" productModel.productName"),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3.6,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Space.y(10),
                  Text("productModel.productDiscription" * 10),
                  Space.y(10),
                  Row(
                    children: [
                      // BoldTitleText(
                      //   '₹${productModel.offerPrice}',
                      //   fontSize: 30,
                      // ),
                      Space.x(5),
                      Text(
                        '₹5500000',
                        style: const TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: size.width * 0.12,
                width: size.width * 0.5,
                color: Colors.white,
                child: Center(child: Text('Add to cart')),
              ),
              Container(
                height: size.width * 0.12,
                width: size.width * 0.5,
                color: Colors.yellow,
                child: Center(
                  child: Text('Buy now'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}