import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/Details.dart';
import 'Data.dart';

class ProductListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: Colors.lightGreen.shade600,
        toolbarHeight: 40,
        title: Text(
          productListingScreen["pageTitle"],
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 10,
            childAspectRatio: 0.5, // Adjusted aspect ratio for better fit
          ),
          itemCount: productListingScreen["products"].length,
          itemBuilder: (context, index) {
            final product = productListingScreen["products"][index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(index: index),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image and Rating Stack
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          // Set desired radius
                          child: Image.network(
                            product["image"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300,
                          ),
                        ),
                        Positioned(
                          left: 8,
                          bottom: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  "${product["rating"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Product Details
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["title"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                product["description"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "₹${product["price"]}",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Favorite Button
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 28,
                            ),
                            onPressed: () {
                              // Handle favorite action
                            },
                          ),
                        ],
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
