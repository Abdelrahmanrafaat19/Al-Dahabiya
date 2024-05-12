import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_cubit.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_state.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/price_product.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/product_data.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/rating_container.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/single_product_image.dart';

List<String> imageList = [
  "https://th.bing.com/th/id/OIP.qta7ZUomhRLuN2UBURRudgHaE8?w=297&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.WduW6fA3wKxWZkG52m3zUAHaHa?w=197&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.QvUVFSkgO0eehYr_kFADGAHaE8?w=284&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7",
];

class SingleProductBody extends StatefulWidget {
  const SingleProductBody({super.key});

  @override
  State<SingleProductBody> createState() => _SingleProductBodyState();
}

class _SingleProductBodyState extends State<SingleProductBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleProductCubit, SingleProductState>(
        builder: (context, state) {
      if (state is SingleProductSuccessState) {
        return ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  ProductData(
                    productQuatity:
                        state.singleProductModel.data!.productQuantity,
                    data: state.singleProductModel,
                    images: state.singleProductModel.data!.images!,
                    type: state.singleProductModel.data!.type,
                    desc: state.singleProductModel.data!.desc,
                  ),
                  ImageOfProduct(
                    image: state.singleProductModel.data!.productPhoto!,
                  ),
                  PriceOFSingleProducetContainer(
                    price: state.singleProductModel.data!.price,
                    discount: state.singleProductModel.data!.discountPrice,
                    hasDiscount: state.singleProductModel.data!.hasDiscount,
                  ),
                  RatingContatiner(
                    name: state.singleProductModel.data!.name,
                    rating: state.singleProductModel.data!.review,
                  )
                ],
              ),
            ),
          ],
        );
      } else if (state is SingleProductIsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SingleProductFailureState) {
        return Center(
          child: customText(
            text: state.message,
            color: Colors.black,
            fontSize: 20.w,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
