import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/Data.dart';

class Details extends StatelessWidget {
  final int index;

  Details({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final detailprod = productList[index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  detailprod["images"],
                  height: 500,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.favorite_border, color: Colors.black),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.black),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_bag_outlined,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    )),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "${detailprod["rating"]}",
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
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detailprod["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 280,
                          ),
                          Text(
                            detailprod["description"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          const Row(
                            children: [
                              Text(
                                '₹2000',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '₹1500',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(width: 12),
                              Text(
                                '25% off',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            ],
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
                  Text(
                    "Inclusive all taxes",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Row(
                children: [
                  Text(
                    "Available Options",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 192,
                  height: 50,
                  color: Colors.lightGreen.shade600,
                  child: Center(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_bag_outlined,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                        Text(
                          "Add to Bag",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 192,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen.shade600)),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        IconButton(
                          icon:
                              Icon(Icons.favorite_outline, color: Colors.black),
                          onPressed: () {},
                        ),
                        Text(
                          "Wishlist",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected Size : XS",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Size Chart",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSizeButton('XS', true),
                      _buildSizeButton('S', false),
                      _buildSizeButton('M', false),
                      _buildSizeButton('L', false),
                      _buildSizeButton('XL', false),
                    ],
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    "Delivery and Services",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180, // Set width to 100
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.lightGreen.shade600)),
                        child: TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: "Enter Pincode",
                            hintStyle: TextStyle(
                              color: Colors
                                  .grey, // Set the hint text color to gray
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightGreen.shade600),
                        child: Center(
                          child: Text(
                            "Verify",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "Product Details",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details1"]),
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details2"]),
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details3"]),
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details4"]),
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details5"])
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details3"]),
                          SizedBox(height: 8,),
                          Text(detailprod["productDetails"]["details4"]),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: double.maxFinite,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightGreen.shade50
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        IconButton(
                          icon:
                          Icon(Icons.star, color: Colors.black),
                          onPressed: () {},
                        ),
                        Text(
                          "100 % Genuine Khadi Product",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size, bool isSelected) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.green : Colors.white,
          side: BorderSide(color: Colors.green),
          shape: CircleBorder()),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
