import 'package:flavourz/controllers/globalState.dart';
import 'package:flutter/material.dart';

Future sheet(context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // crossAxisAlignment: cros,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Bill Summary",
                      style: TextStyle(
                        color: Colors.black,
                        // fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cancel",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.green,
                          // fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Item Name",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: size.width * 0.24,
                      height: 20,
                      // color: Colors.red,
                      alignment: Alignment.topCenter,
                      child: const Text(
                        "Quantity",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: size.width * 0.26,
                      // color: Colors.red,
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                for(int i = 0 ;i< GlobalState.cartModel!.length ;i++)
                DataCell(
                  title: "${GlobalState.cartModel![i].name}",
                  subtitle: "${GlobalState.cartModel![i].productType}",
                  quantity: GlobalState.cartModel![i].quantity,
                  price: double.parse(GlobalState.cartModel![i].price!),
                ),
                const Text(
                  "Bill Details",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                 BillDetail(
                  title: "Item Sub Total",
                  color: Colors.grey,
                  price: double.parse(GlobalState.orderModel!.totalAmount!),
                ),
                // const SizedBox(height: 10,),
                // const BillDetail(
                //   title: "PST",
                //   color: Colors.grey,
                //   price: 144.69,
                // ),
                // // const SizedBox(height: 10,),
                // const BillDetail(
                //   title: "Delivery Charges",
                //   color: Colors.grey,
                //   price: 60,
                // ),
                // // const SizedBox(height: 10,),
                // const BillDetail(
                //   title: "Total Amount To Pay",
                //   price: 1100.72,
                // ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Yout Detail",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${GlobalState.orderModel!.name}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${GlobalState.orderModel!.phoneNumber}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${GlobalState.orderModel!.email}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Delivery Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  "${GlobalState.orderModel!.address}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    // fontSize: 14
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

// =========================
class DataCell extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final int? quantity;
  final double? price;

  const DataCell(
      {Key? key, this.title, this.subtitle, this.quantity, this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.4,
          alignment: Alignment.topLeft,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                subtitle.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.24,
          height: 20,
          // color: Colors.red,
          alignment: Alignment.topCenter,
          child: Text(
            quantity.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          width: size.width * 0.26,
          // color: Colors.amber,
          alignment: Alignment.topRight,
          child: Text(
            " PKR ${price.toString()}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class BillDetail extends StatelessWidget {
  final String? title;
  final double? price;
  final Color? color;

  const BillDetail({Key? key, this.title, this.price, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // minVerticalPadding: 0,
      dense: true,
      contentPadding: const EdgeInsets.all(0.0),
      visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
          horizontal: VisualDensity.minimumDensity),
      title: Text(
        title.toString(),
        style: TextStyle(
            color: color ?? Colors.black, fontWeight: FontWeight.normal),
      ),
      trailing: Text(
        price.toString(),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }
}
