import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService.fetchProducts(); // Panggil API untuk mendapatkan produk
  }

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
            // Item Produk dari API
            SizedBox(height: 8.0),
            FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final products = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: products.map((product) {
                        return _buildFlashSaleItem(
                          product.name,
                          '\$${product.price}', // Sesuaikan dengan model Anda
                          product.image, // Sesuaikan dengan model Anda
                        );
                      }).toList(),
                    ),
                  );
                }
              },
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
