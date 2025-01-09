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
              _buildHeading(context),
              _buildLocationCarousel(),
              _buildRecommendedCarousel(),
              _buildHostingFeeSection(),
              _buildMostViewedProperties(), // single widget used to display  each property dynamically .
            ],
          ),
        ),
      ),
    );
  }

  // Header Section (Title + Search Bar)
  Widget _buildHeading(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: const Color.fromARGB(255, 235, 229, 245),
        height: screenHeight * 0.25,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.04),
            Text(
            "Explore the world! By\n Travelling",//using \n next line property
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
            ),
            
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                   
                    decoration: BoxDecoration(
                      color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(16.0))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        
                        contentPadding: EdgeInsets.all(16.0),
                        hintText: "Where did you go?",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              SizedBox(width: 8.0,),
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
      ),
    );
  }

  
  Widget _buildLocationCarousel() {
    final List<Map<String, String>> locationImages = [
       {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzYe53ZlLAei5IzHSLATHYSy7HKn1KbwYeBw&s',
        'text': "Moscow",
      },
       {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFyO3a2am4pxrQolpp04m-rdkJVuEiFNVzBA&s',
        'text': "India",
      },
        {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzYe53ZlLAei5IzHSLATHYSy7HKn1KbwYeBw&s',
        'text': "Moscow",
      },
        {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZWvE1yI-9vv_mYo_9r0xEkOGX4wo1_mDP0SVLCDdK2Gkzwjb5yU7vYPUrM5k3YbQzuTM&usqp=CAU',
        'text': "USA",
      },
     
      
      
    
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Popular Location", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0)),
        ),
        CarouselSlider(
          
          options: CarouselOptions(
            
            height: 170.0,
            aspectRatio: 2.0,
           pageSnapping: true,
        
        padEnds: false,
            viewportFraction: 0.30,
            initialPage: 1,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
          ),
          items: locationImages.map((location) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      width: double.infinity,
                      location['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                 top: 100,
                 left: 30,
                  child: Text(
                    location['text']!,
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

 
  Widget _buildRecommendedCarousel() {
    final List<Map<String, dynamic>> homeImages = [
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0xRABvwE4RNirv3TLP8f5rINf592QixG-5Q&s',
        'rate': 450,
        'text': 'Carinthia Lake see'' ',
        'avail': 'Private room/4 bed',
      },
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZiny-FfKHLTxKc4XJ8UiYP8_VKWIIyu4dw&s',
        'rate': 120,
        'text': 'Carinthia Lake see'' ',
        'avail': 'private room/1 bed',
      },
      {
        'image': 'https://thumbs.dreamstime.com/b/new-home-sale-2364016.jpg',
        'rate': 400,
        'text': 'Carinthia Lake see'' ',
        'avail': 'Private room/4 bed',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Recommended", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0)),
        ),
        CarouselSlider(
          options: CarouselOptions(
         height: 285,
            padEnds: false,
            viewportFraction: 0.60,
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
                    borderRadius: BorderRadius.circular(16.0),
                    child: Stack(
                      children: [
                        Image.network(
                          home['image']!,
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
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0),
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
                      Text("Breakfast", style: TextStyle(fontWeight: FontWeight.w900)),
                    ],
                  ),
                  Text(home['avail']!),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }


  Widget _buildHostingFeeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: [
                Image.network(
               
                  width: double.infinity,
                  'https://media.istockphoto.com/id/1069585056/photo/stylish-young-woman-drinking-coffee-at-the-cafe-looking-away.jpg?s=612x612&w=0&k=20&c=IW5mOkpx55CpqFO4SK3XWCrfYNAYkwqjTmS0B4KTELc=',
                  fit: BoxFit.cover,
                
                ),
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: Column(
                    children: [
                      Text("Hosting Fee For", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                      Text("as low as 1 %", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        onPressed: () {},
                        child: Text("Become a Host", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Most Viewed", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0)),
        ),
      ],
    );
  }

  // Most Viewed Property Section - Using a single list of data
  Widget _buildMostViewedProperties() {
    final List<Map<String, String>> mostViewedProperties = [
      {
        'image': 'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg',
        'rate': '\$90',
        'text': "Carinthia Lake See Breakfast lorem",
        'avail': "Private room/4beds",
        'rating': '5',
      },
      {
        'image': 'https://thumbs.dreamstime.com/b/brick-home-small-front-balcony-12797979.jpg',
        'rate': '\$300',
        'text': "Carinthia Lake See Breakfast lorem",
        'avail': "Private room/4beds",
        'rating': '5',
      },
      {
        'image': 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?cs=srgb&dl=pexels-binyaminmellish-1396122.jpg&fm=jpg',
        'rate': '\$240',
        'text': "Carinthia Lake See Breakfast lorem",
        'avail': "Private room/4beds",
        'rating': '4',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: mostViewedProperties.length,
          itemBuilder: (context, index) {
            final property = mostViewedProperties[index];
            return _buildMostViewedProperty(
              property['image']!,
              property['rate']!,
              property['text']!,
              property['avail']!,
              property['rating']!,
            );
          },
        ),
      ],
    );
  }

  // Single Widget for Most Viewed Property
  Widget _buildMostViewedProperty(
      String image, String rate, String text, String avail, String rating) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              children: [
                Image.network(
                  image,
               height: 200,
               width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 30.0,
                  right: 30.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(rate, style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0)),
                      Row(
                        children: [
                          Text("/Night",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 10.0),),
                          Icon(Icons.bolt, color: const Color.fromARGB(255, 241, 141, 78), size: 12.0),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.red, size: 10.0),
                      Text(rating, style: TextStyle(fontSize: 10.0)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.0,),
              Text(text, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900)),
              Text(avail, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}



