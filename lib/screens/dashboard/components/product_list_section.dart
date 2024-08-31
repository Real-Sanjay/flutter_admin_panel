// import 'package:admin/utility/extensions.dart';
//
// import '../../../core/data/data_provider.dart';
// import '../../../models/product.dart';
// import 'add_product_form.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../utility/constants.dart';
//
// class ProductListSection extends StatelessWidget {
//   const ProductListSection({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(defaultPadding),
//       decoration: BoxDecoration(
//         color: secondaryColor,
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "All Products",
//             style: Theme.of(context).textTheme.titleMedium,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: Consumer<DataProvider>(
//               builder: (context, dataProvider, child) {
//                 return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: DataTable(
//                       columnSpacing: defaultPadding,
//                       columns: [
//                         DataColumn(
//                           label: Text("Product Name"),
//                         ),
//                         DataColumn(
//                           label: Text("Category"),
//                         ),
//                         DataColumn(
//                           label: Text("Sub Category"),
//                         ),
//                         DataColumn(
//                           label: Text("Price"),
//                         ),
//                         DataColumn(
//                           label: Text("Edit"),
//                         ),
//                         DataColumn(
//                           label: Text("Delete"),
//                         ),
//                       ],
//                       rows: List.generate(
//                         dataProvider.products.length,
//                             (index) => productDataRow(
//                           dataProvider.products[index],
//                           edit: () {
//                             showAddProductForm(context, dataProvider.products[index]);
//                           },
//                           delete: () {
//                             context.dashBoardProvider.deleteProduct(dataProvider.products[index]);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
// DataRow productDataRow(Product productInfo, {Function? edit, Function? delete}) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             Image.network(
//               productInfo.images?.first.url ?? '',
//               height: 30,
//               width: 30,
//               errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//                 return Icon(Icons.error);
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(productInfo.name ?? ''),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(productInfo.proCategoryId?.name ?? '')),
//       DataCell(Text(productInfo.proSubCategoryId?.name ?? '')),
//       DataCell(Text('${productInfo.price}')),
//       DataCell(
//         IconButton(
//           onPressed: () {
//             if (edit != null) edit();
//           },
//           icon: Icon(
//             Icons.edit,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       DataCell(
//         IconButton(
//           onPressed: () {
//             if (delete != null) delete();
//           },
//           icon: Icon(
//             Icons.delete,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     ],
//   );
// }


import 'package:admin/utility/extensions.dart';
import 'package:get/get.dart';

import '../../../core/data/data_provider.dart';
import '../../../models/product.dart';
import 'add_product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utility/constants.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Products",
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: Consumer<DataProvider>(
              builder: (context, dataProvider, child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 400),
                      child: DataTable(
                        columnSpacing: defaultPadding,
                        // minWidth: 600,
                        columns: [
                          DataColumn(
                            label: Text("Product Name"),
                          ),

                          DataColumn(
                            label:
                            Text("Category"),
                          ),

                          DataColumn(
                            label: Text("Sub Category"),
                          ),
                          DataColumn(
                            label: Text("Price"),
                          ),
                          DataColumn(
                            label: Text("Edit"),
                          ),
                          DataColumn(
                            label: Text("Delete"),
                          ),
                        ],
                        rows: List.generate(
                          dataProvider.products.length,
                              (index) => productDataRow(dataProvider.products[index],edit: () {
                            showAddProductForm(context, dataProvider.products[index]);
                          },
                            delete: () {
                              context.dashBoardProvider.deleteProduct(dataProvider.products[index]);
                            },),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
DataRow productDataRow(Product productInfo, {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SizedBox(width: 0),
            Image.network(
              productInfo.images?.first.url ?? '',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Icon(Icons.error);
              },
            ),
            SizedBox(width: 5), // Adds spacing between image and text
            Expanded(
              child: Text(
                productInfo.name ?? '',
                overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
              ),
            ),
          ],
        ),
      ),
      DataCell(Text(productInfo.proCategoryId?.name ?? '')),
      DataCell(Text(productInfo.proSubCategoryId?.name ?? '')),
      DataCell(Text('${productInfo.price}')),
      DataCell(IconButton(
        onPressed: () {
          if (edit != null) edit();
        },
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      )),
      DataCell(IconButton(
        onPressed: () {
          if (delete != null) delete();
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      )),
    ],
  );
}

// DataRow productDataRow(Product productInfo,{Function? edit, Function? delete}) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             Image.network(
//               productInfo.images?.first.url ?? '',
//               height: 30,
//               width: 30,
//               errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//                 return Icon(Icons.error);
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(productInfo.name ?? ''),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(productInfo.proCategoryId?.name ?? '')),
//       DataCell(Text(productInfo.proSubCategoryId?.name ?? '')),
//       DataCell(Text('${productInfo.price}'),),
//       DataCell(IconButton(
//           onPressed: () {
//             if (edit != null) edit();
//           },
//           icon: Icon(
//             Icons.edit,
//             color: Colors.white,
//           ))),
//       DataCell(IconButton(
//           onPressed: () {
//             if (delete != null) delete();
//           },
//           icon: Icon(
//             Icons.delete,
//             color: Colors.red,
//           ))),
//     ],
//   );
// }
