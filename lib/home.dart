import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Tambahkan aksi untuk tombol pengaturan di sini
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {
                      // Tambahkan aksi untuk tombol "See All" di sini
                    },
                    child: Text('See All'),
                  ),
                ],
              ),
            ),
            // Window
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildWindowItem('New Collection'),
                  _buildWindowItem('Diskon'),
                  _buildWindowItem('Promo'),
                ],
              ),
            ),
            // Category
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category'),
                  TextButton(
                    onPressed: () {
                      // Tambahkan aksi untuk tombol "See All" kategori di sini
                    },
                    child: Text('See All'),
                  ),
                ],
              ),
            ),
            // Kategori
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryItem('Category 1'),
                  _buildCategoryItem('Category 2'),
                  _buildCategoryItem('Category 3'),
                  _buildCategoryItem('Category 4'),
                ],
              ),
            ),
            // Flash Sale
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Flash Sale'),
                  Row(
                    children: [
                      Text('Time Left: '),
                      Text('00:30:00'), // Waktu flash sale
                    ],
                  ),
                ],
              ),
            ),
            // Item Produk Flash Sale
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFlashSaleItem('Product 1', '\$10.00', 'product1.jpg'),
                  _buildFlashSaleItem('Product 2', '\$20.00', 'product2.jpg'),
                  _buildFlashSaleItem('Product 3', '\$30.00', 'product3.jpg'),
                  _buildFlashSaleItem('Product 4', '\$40.00', 'product4.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Tambahkan aksi untuk tombol "Home" di sini
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Tambahkan aksi untuk tombol "Keranjang" di sini
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Tambahkan aksi untuk tombol "Love" di sini
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Tambahkan aksi untuk tombol "Pesan" di sini
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Tambahkan aksi untuk tombol "Person" di sini
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWindowItem(String title) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey,
      child: Center(
        child: Text(title),
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi untuk kategori di sini
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blueGrey,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }

  Widget _buildFlashSaleItem(String name, String price, String image) {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}