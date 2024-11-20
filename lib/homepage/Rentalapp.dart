import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class RentalApp extends StatelessWidget {
  const RentalApp({super.key});
    @override
     Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeading(context),

              // Popular Locations Section
              _buildSectionTitle("Popular Locations"),
              _buildLocationCarousel(),

              // Recommended Properties Section
              _buildSectionTitle("Recommended"),
              _buildRecommendedCarousel(),

              // Hosting Fee Section
              _buildHostingFeeSection(),

              // Most Viewed Section
              _buildSectionTitle("Most Viewed"),
              _buildMostViewedProperty('https://thumbs.dreamstime.com/b/house-exterior-8717154.jpg', '\$720', "Carinthia Lake See breakfast", "Private room/4beds",'5'),
              _buildMostViewedProperty('https://thumbs.dreamstime.com/b/brick-home-small-front-balcony-12797979.jpg', '\$920', "Carinthia Lake See breakfast", "Private room/4beds",'4.8'),
              _buildMostViewedProperty('https://thumbs.dreamstime.com/b/new-home-sale-2364016.jpg', '\$320', "Carinthia Lake See breakfast", "Private room/4beds",'5'),
            ],
          ),
        ),
      ),
    );
  }

  // Header Section (Title + Search Bar)
  Widget _buildHeading(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(16.0),
     color: const Color.fromARGB(255, 235, 229, 245),
      height: screenHeight * 0.25,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             SizedBox(height: screenHeight*0.04,),
              Text(
               "Explore the world ! By",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
                 ),
              Text(
              "Travelling",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
                 ),
             SizedBox(height: 15.0),
                Row(  
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 Flexible(
                child: Container(
                 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: "Where did you go?",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(Icons.short_text_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
      ),
    );
  }

  // Popular Locations Carousel
  Widget _buildLocationCarousel() {
    final List<Map<String, String>> locationImages = [
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfWcUoIY2YXxSDUN4eQonQeh2zdioR2YYpag&s',
        'text': "India",
      },
      {
        'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/The_Great_Wall_of_China_-_Badaling.jpg/800px-The_Great_Wall_of_China_-_Badaling.jpg',
        'text': "US",
      },
      {
        'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/The_Great_Wall_of_China_-_Badaling.jpg/800px-The_Great_Wall_of_China_-_Badaling.jpg',
        'text': "moscow",
      }
    
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.25,
        initialPage: 2,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
      items: locationImages.map((location) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  location['image']!,
                  // height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
               bottom:20,
              right: 20,
                child: Text(
                  location['text']!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Recommended Carousel
  Widget _buildRecommendedCarousel() {
    final List<Map<String, dynamic>> homeImages = [
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xRABvwE4RNirv3TLP8f5rINf592QixG-5Q&s',
        'rate': 90,
        'text': 'Carinthia',
        'avail': 'Private room/1 bed',
      
      },
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZiny-FfKHLTxKc4XJ8UiYP8_VKWIIyu4dw&s',
        'rate': 450,
        'text': 'Carinthia ',
        'avail': 'Single room/1 bed',
        
      },
      {
        'image': 'https://thumbs.dreamstime.com/b/new-home-sale-2364016.jpg',
        'rate': 890,
        'text': 'Carinthia ',
        'avail': 'Private room/4 bed',
       
      },
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
      viewportFraction: 0.4,
        initialPage: 1,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
     
      ),
      items: homeImages.map((home) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  children: [
                    Image.network(
                      home['image']!,
                 
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 10,
                    
                      top: 10,
                      child: Center(
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite_rounded, color: Colors.grey, size: 17.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$ ${home['rate']}',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "/Night",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
                  ),
                   Icon(Icons.bolt, color: Colors.yellow, size: 12.0),
                   Spacer(),
                    Icon(Icons.star, color: Colors.red, size: 10.0),
                  Text(
                    "5",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            
              Row(
                children: [
                  Text(
                    home['text']!,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text("Breakfast",style: TextStyle(fontWeight: FontWeight.w900))
                ],
              ),
              Text(home['avail']!),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Hosting Fee Section
  Widget _buildHostingFeeSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Stack(
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1069585056/photo/stylish-young-woman-drinking-coffee-at-the-cafe-looking-away.jpg?s=612x612&w=0&k=20&c=IW5mOkpx55CpqFO4SK3XWCrfYNAYkwqjTmS0B4KTELc=',
           
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
           
              top: 20.0,
              left: 5.0,
              child: Column(
                children: [
                  Text("Hosting Fee For", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  Text("as low as 1 %", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                            ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                onPressed: (){}, child: Text("Become a Host",style: TextStyle(color: Colors.white),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Most Viewed Property Section
  Widget _buildMostViewedProperty(String image, String rate, String text, String avail,String rating) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Stack(
              children: [
                Image.network(
                image,
               width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 30.0,
              right: 30.0,
                child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite,color: Colors.grey,)))
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Row(
                    children: [
                      Text(
                        rate,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      
                      ),
                      Row(
                        children: [
                          Text("/Night",),
                          Icon(Icons.bolt,color: Colors.yellow,size: 12.0,)
                        ],
                      )
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.red,size: 10.0,),
                      Text(
                        
                        rating,
                      )
                    ],
                  )
                ],
              ),
              Text(
                text,
                style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w900),
              ),
              Text(
                avail,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            
             
            ],
            
          ),
        ],
      ),
    );
  }
}

