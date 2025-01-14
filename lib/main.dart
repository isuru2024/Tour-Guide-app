import 'package:flutter/material.dart';
import 'package:newflutter/screens/FAQ_Screen.dart';
import 'package:newflutter/screens/policy_screen.dart';
import 'package:newflutter/screens/rating_screen.dart';
import 'package:newflutter/screens/FavoritesScreen.dart';
import 'package:newflutter/services/sqflite_service.dart';
import 'screens/image_list_screen.dart';
import 'models/image_data.dart';
import 'screens/PackageScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/favorite_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SqfliteService.initDatabase();

  // Insert sample image data using the static method
  await SqfliteService.insertImage(ImageData(
      name: 'Kandy',
      path: 'image/kandy.jpg',
      details:
          'Kandy is a major city in the Central Province of Sri Lanka, located approximately 115 km northeast of Colombo. It is renowned for being the cultural capital of the country and is home to the sacred Temple of the Tooth Relic, a UNESCO World Heritage Site. Nestled amidst lush hills and tea plantations, Kandy is also famous for its scenic beauty, rich history, and annual Esala Perahera festival.',
      whattodo:
          'Temple of the Tooth Relic (Sri Dalada Maligawa): This sacred Buddhist temple houses a relic of the tooth of the Buddha. Visitors can admire the stunning architecture, intricate carvings, and learn about its historical and religious significance.\n\n Peradeniya Royal Botanical Gardens: Located a short drive from Kandy, this sprawling garden is famous for its diverse plant species, beautiful orchid collection, and giant Javan fig tree. A perfect spot for nature lovers and photography enthusiasts.\n\n Kandy Lake: Take a relaxing stroll around Kandy Lake, located in the heart of the city. The serene surroundings offer beautiful views, and you can even go on a boat ride.\n\n Bahirawakanda Vihara Buddha Statue: Visit this towering white Buddha statue located on a hilltop near Kandy. The panoramic views of the city from here are breathtaking, especially at sunset.\n\n Udawattakele Forest Reserve: A haven for nature enthusiasts, this historic forest reserve is great for hiking and birdwatching. It was once a royal forest and offers tranquility amidst the bustling city.\n\n Kandy City Center (KCC): This modern shopping complex offers a mix of local and international brands, a food court, and entertainment facilities. Perfect for shopping or enjoying a meal.\n\n Cultural Dance Show: Witness traditional Sri Lankan dance and music performances that depict the country’s rich heritage. Shows are held at various venues in Kandy during the evening.\n\n Visit the Tea Plantations: Explore the tea plantations around Kandy and visit a tea factory to learn about the process of making Ceylon tea. Don’t miss the chance to taste freshly brewed tea.\n\n Commonwealth War Cemetery: A quiet and well-maintained cemetery dedicated to soldiers who died during World War II. It’s a place of historical significance and a tribute to those who sacrificed their lives.\n\n Explore the Kandy Market Hall: Immerse yourself in local culture by visiting this bustling market. You can find fresh produce, spices, souvenirs, and handicrafts.',
      mapImagePath: 'image/kandy_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Colombo',
      path: 'image/colombo.jpeg',
      details:
          'Colombo, the vibrant capital city of Sri Lanka, is a bustling metropolis that seamlessly blends modernity with rich cultural heritage. Located on the island western coast, it serves as the country’s commercial hub and gateway for international trade and tourism. The city is known for its diverse attractions, including colonial-era buildings, iconic landmarks like the Lotus Tower, the bustling Pettah Market, and the serene Galle Face Green overlooking the Indian Ocean. Colombo offers a mix of luxury hotels, fine dining, art galleries, and cultural sites such as the Gangaramaya Temple and the National Museum. Its lively streets, modern shopping malls, and historic charm make it a dynamic destination for both locals and visitors.',
      whattodo:
          'Gangaramaya Temple: One of Colombo most iconic Buddhist temples, known for its eclectic architecture, serene ambiance, and impressive collection of artifacts.\n\n Galle Face Green: A large urban park along the coast, perfect for evening strolls, kite flying, or enjoying street food while watching the sunset over the Indian Ocean.\n\n Colombo National Museum: Sri Lanka’s largest museum, housing an extensive collection of artifacts, including ancient manuscripts, royal regalia, and traditional artwork, offering insights into the country’s history and culture.\n\n Pettah Market: A bustling open market ideal for experiencing the local vibe. You can find everything from textiles and electronics to spices and fresh produce.\n\n Lotus Tower: The tallest structure in South Asia, offering breathtaking panoramic views of the city and the surrounding areas. It’s also a hub for dining and entertainment.\n\n Independence Square: A landmark commemorating Sri Lanka’s independence from British rule, surrounded by a peaceful park and featuring a striking colonial-style monument.\n\n Viharamahadevi Park: Colombo’s largest public park, perfect for picnics and leisure, with walking paths, a playground, and beautiful flowering trees.\n\n Beira Lake: Located in the heart of the city, this lake is a tranquil spot for boat rides and a visit to the Seema Malaka Temple, which seems to float on the water.\n\n Colombo Dutch Hospital: A beautifully restored colonial building now hosting upscale restaurants, boutiques, and cafes, making it a great spot for dining and shopping.\n\n Mount Lavinia Beach: Located just south of Colombo, this popular beach is ideal for relaxing, enjoying fresh seafood, or experiencing the vibrant nightlife at beachfront bars.\n\n Street Food and Night Markets: Explore the street food stalls at Galle Face Green or visit night markets like the Colombo Good Market for unique local dishes and handmade crafts.\n\n   Shopping at One Galle Face Mall: A luxury shopping destination offering international brands, fine dining, and entertainment options, all under one roof. ',
      mapImagePath: 'image/colombo_map.jpg'));
  await SqfliteService.insertImage(ImageData(
      name: 'Nuwara Eliya',
      path: 'image/nuwara_eliya.jpg',
      details:
          'Nuwara Eliya, often called Little England, is a picturesque hill station in Sri Lankan Central Province, known for its cool climate, misty mountains, and colonial-era charm. Located at an altitude of 1,868 meters, it was a favored retreat for British colonists, who introduced tea plantations and built quaint bungalows reminiscent of English countryside homes. Surrounded by lush greenery, waterfalls, and rolling tea estates, Nuwara Eliya offers a tranquil escape with stunning landscapes and a laid-back atmosphere.',
      whattodo:
          'Gregory Lake: A serene lake in the heart of the city, perfect for boating, paddleboarding, and picnicking amidst beautiful surroundings.\n\n Horton Plains National Park: A UNESCO World Heritage Site famous for its stunning landscapes, wildlife, and the dramatic World’s End cliff, offering breathtaking views.\n\n Victoria Park: A well-maintained garden ideal for a leisurely stroll, featuring vibrant flowers, walking paths, and a small aviary.\n\n Lover’s Leap Waterfall: A picturesque waterfall located near a tea estate, accessible via a scenic hike with panoramic views of the surrounding hills.\n\n Pedro Tea Estate: Visit this tea plantation to learn about the tea-making process and enjoy a refreshing cup of authentic Ceylon tea while soaking in the views of the lush estates.\n\n Seetha Amman Temple: A colorful Hindu temple with mythological significance, believed to be linked to the Ramayana epic.\n\n  Hakgala Botanical Garden: A beautifully landscaped garden showcasing diverse plant species, including exotic orchids and roses, set against the backdrop of misty mountains.\n\n Golf Club: One of the oldest golf clubs in Asia, this colonial-era establishment offers a unique experience for golf enthusiasts and a glimpse into Nuwara Eliya’s colonial heritage.\n\n  Ambewela Farms: Known as the "Little New Zealand," this dairy farm offers guided tours, fresh milk products, and breathtaking views of green pastures.\n\n Moon Plains: A scenic plateau offering 360-degree views of the surrounding mountains and valleys, ideal for nature lovers and photographers.\n\n Strawberry Farms: Visit one of the local strawberry farms to enjoy freshly picked strawberries and strawberry-based treats.\n\n St. Clair and Devon Waterfalls: Located near Nuwara Eliya, these twin waterfalls are must-see attractions for their beauty and picturesque settings.\n\n Adams Peak (via Nallathanniya): Although a bit farther, this sacred mountain offers an unforgettable hiking experience, particularly for those looking to catch a sunrise from its summit.',
      mapImagePath: 'image/nuwara_eliya_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Sigiriya',
      path: 'image/sigiriya.jpg',
      details:
          'Sigiriya, often referred to as the Lion Rock, is one of Sri Lankan most iconic landmarks and a UNESCO World Heritage Site. Located in the Matale District, this ancient rock fortress stands 200 meters tall and is famed for its breathtaking views, remarkable engineering, and stunning frescoes. Built in the 5th century by King Kashyapa as a royal palace and stronghold, Sigiriya combines natural beauty, history, and ingenuity. Surrounded by landscaped gardens, water features, and ancient ruins, it is considered a masterpiece of urban planning and one of the most impressive archaeological sites in South Asia.',
      whattodo:
          'Lion’s Staircase: This iconic feature leads to the summit of the rock. It is named after the colossal lion paws carved into the rock, remnants of a grand sculpture that once dominated the entrance.\n\n Sigiriya Frescoes: Admire the world-famous frescoes painted on a sheltered rock face. These ancient artworks depict celestial maidens and are celebrated for their vibrant colors and delicate detail.\n\n Mirror Wall: A polished rock surface that once reflected the king’s image. Today, it contains ancient graffiti written by visitors over the centuries, showcasing their admiration for Sigiriya.\n\n Summit of Sigiriya Rock: Explore the ruins of King Kashyapa’s royal palace at the summit, including the throne and swimming pool, while enjoying panoramic views of the surrounding jungle and landscapes.\n\n Water Gardens: These beautifully designed gardens at the base of the rock feature intricate pools, fountains, and canals, demonstrating the advanced hydraulic engineering of the time.\n\n Boulder Gardens: Wander through these ancient gardens filled with massive boulders that once served as meditation spots and the base for monastic shelters.\n\n Cobra Hood Cave: A natural rock formation resembling a cobra’s hood, this cave has ancient inscriptions and served as a shelter for Buddhist monks.\n\n Pidurangala Rock: Located nearby, Pidurangala offers a less crowded hiking experience and stunning views of Sigiriya Rock, particularly at sunrise or sunset.\n\n Sigiriya Museum: Learn about the history, architecture, and archaeological discoveries of Sigiriya through artifacts, models, and informative displays.\n\n Wildlife and Birdwatching: The area around Sigiriya is rich in biodiversity, making it an excellent spot for nature enthusiasts to observe birds, monkeys, and other wildlife.\n\n Explore Village Life: Take part in a traditional village tour, including bullock cart rides, canoeing, and authentic Sri Lankan meals, to experience local culture and traditions.',
      mapImagePath: 'image/sigiriya_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Galle',
      path: 'image/galle.jpg',
      details:
          'Galle, a coastal city in southern Sri Lanka, is a vibrant blend of colonial history, stunning beaches, and a thriving cultural scene. The city centerpiece is the Galle Fort, a UNESCO World Heritage Site built by the Portuguese in the 16th century and later expanded by the Dutch. With its cobblestone streets, colonial architecture, and charming boutiques, Galle offers a unique mix of old-world charm and modern attractions. Surrounded by turquoise waters and lush greenery, it is a haven for history buffs, beach lovers, and food enthusiasts.',
      whattodo:
          'Galle Fort: The iconic landmark of the city, this well-preserved fort is a cultural and historical treasure. Explore its ancient ramparts, lighthouse, clock tower, and charming streets lined with colonial-era buildings, shops, and cafes.\n\n Galle Lighthouse: Located within the fort, this picturesque lighthouse offers stunning views of the Indian Ocean and is a popular spot for photography.\n\n National Maritime Museum: Situated inside the fort, this museum showcases artifacts and exhibits related to Sri Lanka’s maritime history, including shipwrecks and traditional fishing techniques.\n\n Dutch Reformed Church: A historic church built in 1755, known for its simple yet elegant architecture and serene atmosphere.\n\n Unawatuna Beach: Just a short drive from Galle, this crescent-shaped beach is perfect for swimming, snorkeling, and relaxing under the sun. It also offers vibrant nightlife and dining options.\n\n Jungle Beach: A hidden gem near Unawatuna, this secluded beach is surrounded by lush greenery and ideal for snorkeling and quiet relaxation.\n\n Koggala Lake: Take a boat ride on this scenic lake dotted with small islands, including one with a Buddhist temple and another with cinnamon plantations.\n\n Sea Turtle Hatchery: Visit one of the turtle hatcheries near Galle to learn about turtle conservation efforts and see baby turtles being cared for before their release into the ocean.\n\n Flag Rock: A popular spot on the Galle Fort’s ramparts, offering breathtaking views of the sunset and the ocean. It was once used as a signaling point for ships.\n\n  Explore Local Boutiques: Stroll through the streets of Galle Fort to shop for unique souvenirs, handmade crafts, jewelry, and local art.\n\n Stilt Fishing: Witness the traditional stilt fishermen along the coast near Galle, a practice unique to Sri Lanka and an iconic cultural experience.\n\n Surfing at Weligama or Ahangama: Both beaches near Galle are popular for surfing, offering waves suitable for beginners and experienced surfers alike.\n\n Cooking Classes: Join a Sri Lankan cooking class to learn how to prepare authentic dishes using local spices and ingredients.\n\n Dining in Galle Fort: Enjoy a variety of cuisines, from traditional Sri Lankan fare to international dishes, in the charming cafes and restaurants within the fort.',
      mapImagePath: 'image/galle_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Arugam Bay',
      path: 'image/aru.jpg',
      details:
          'Arugam Bay, located on the southeastern coast of Sri Lanka, is a tropical paradise renowned for its laid-back atmosphere, world-class surf breaks, and pristine beaches. This small coastal town attracts surfers, backpackers, and nature lovers alike with its golden sands, turquoise waters, and vibrant local culture. Beyond surfing, Arugam Bay offers opportunities for wildlife safaris, lagoon tours, and exploring ancient ruins, making it a versatile destination for relaxation and adventure.',
      whattodo:
          'Main Surf Point: One of the world’s top surfing spots, offering consistent waves that attract surfers of all levels, from beginners to professionals.\n\n Whiskey Point: A beginner-friendly surf break located a short drive from Arugam Bay, known for its chilled-out vibe and scenic surroundings.\n\n Elephant Rock: A quieter beach with stunning rock formations, perfect for sunrise views, beginner surfing, and occasional elephant sightings.\n\n Crocodile Rock: A beautiful hiking spot with panoramic views of the coastline and a chance to spot wildlife like crocodiles and elephants in the nearby lagoon.\n\n Pottuvil Lagoon: Take a boat tour through this tranquil lagoon to see mangroves, exotic birds, and wild animals, including crocodiles and elephants.\n\n Kumana National Park: Just a short drive away, this park is a haven for birdwatchers and wildlife enthusiasts, offering safaris to spot elephants, leopards, and rare bird species.\n\n Panama Village: A charming traditional village near Arugam Bay, where you can experience authentic local culture and enjoy scenic walks through paddy fields and forests.\n\n Muhudu Maha Viharaya: A historic Buddhist temple located on the beach, offering cultural insight and a peaceful atmosphere for meditation.\n\n Magul Maha Viharaya: An ancient archaeological site steeped in history, featuring stone ruins and intricate carvings.\n\n Baby Point: A lesser-known surf spot with smaller waves, ideal for beginners looking for a quieter environment to practice.\n\n Lagoon Safaris: Explore the region lagoons on a safari tour to observe wildlife, lush mangroves, and breathtaking sunsets. \n\n Beachside Cafes: Relax at the many beachfront cafes and restaurants offering fresh seafood, local delicacies, and international cuisine.\n\n Yoga and Wellness Retreats: Join a yoga class or wellness retreat to rejuvenate your mind and body in this serene coastal setting.\n\n Nightlife: Enjoy Arugam Bay’s vibrant nightlife with beach parties, live music, and relaxed gatherings at local bars and cafes.\n\n Fishing Villages: Visit nearby fishing villages to learn about traditional fishing practices and interact with the friendly locals.\n\n Surf Schools: Take lessons from local surf schools to learn or improve your surfing skills in one of the best surf destinations in the world.\n\n Sunrise and Sunset Views: Don’t miss the breathtaking sunrises over the bay and sunsets at nearby points like Elephant Rock.',
      mapImagePath: 'image/aru_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Anuradhapura',
      path: 'image/anuradhapura.jpg',
      details:
          'Anuradhapura, a UNESCO World Heritage Site and one of Sri Lankan ancient capitals, is renowned for its rich history, sacred Buddhist sites, and advanced ancient engineering. Located in the North Central Province, about 200 km from Colombo, it served as the heart of Sri Lanka’s civilization for over 1,300 years, from the 4th century BCE to the 11th century CE. The city is home to well-preserved ruins, stupas, monasteries, and sophisticated irrigation systems that showcase the architectural brilliance and spiritual significance of the Anuradhapura Kingdom. Surrounded by lush greenery, it remains a major pilgrimage site and a must-visit destination for history and culture enthusiasts.',
      whattodo:
          'Sacred Sri Maha Bodhi Tree: This ancient fig tree is a cutting from the original Bodhi tree under which Buddha attained enlightenment. It is one of the most sacred Buddhist sites in Sri Lanka and a place of worship for pilgrims.\n\n Ruwanwelisaya Stupa: A magnificent white stupa built by King Dutugemunu, this iconic structure is a symbol of Sri Lankan heritage and Buddhist devotion. The stupa is surrounded by intricately carved elephant statues.\n\n Jetavanaramaya Stupa: Once the tallest stupa in the ancient world, this massive brick structure stands as a testament to the architectural prowess of ancient Sri Lanka.\n\n Abhayagiri Monastery: Explore the ruins of this ancient monastic complex, which was once a center of Buddhist learning and culture. Highlights include the Abhayagiri Dagoba and various stone carvings.\n\n Thuparamaya Stupa: This is the oldest stupa in Sri Lanka, believed to enshrine a relic of Buddha. It is a must-visit site for its historical and religious importance.\n\n Isurumuniya Temple: Known for its beautiful rock carvings, including the famous "Lovers" sculpture, this temple is a peaceful spot with a fascinating history.\n\n Kuttam Pokuna (Twin Ponds): These ancient bathing ponds are a fine example of hydraulic engineering in ancient Sri Lanka. The symmetrical design and intricate stonework make them a must-see.\n\n Mihintale: Considered the cradle of Buddhism in Sri Lanka, this mountain hosts several ancient religious sites, including stupas, caves, and a large Buddha statue.\n\n Samadhi Buddha Statue: This serene and meditative stone statue of Buddha is an iconic representation of ancient Sri Lankan artistry and spirituality.\n\n Anuradhapura Archaeological Museum: Visit this museum to learn about the history and culture of Anuradhapura. It houses artifacts, statues, and relics from the ancient kingdom.\n\n Explore the Royal Palace Complex: Walk through the remnants of the royal palace and its surrounding structures, offering insight into the grandeur of the ancient kingdom.\n\n Elephant Pond (Eth Pokuna): A massive ancient reservoir used for water storage, showcasing the sophisticated water management systems of the Anuradhapura era.',
      mapImagePath: 'image/anuradhapura_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Mirissa',
      path: 'image/mirissa.jpg',
      details:
          'Mirissa, located on Sri Lankan southern coast, is a small but popular beach town known for its natural beauty, laid-back atmosphere, and vibrant marine life. With its golden sandy beaches, crystal-clear waters, and lush surroundings, Mirissa has become a haven for travelers seeking both relaxation and adventure. Famous for its whale watching tours, the town is also a gateway to explore nearby beaches, wildlife reserves, and cultural attractions, offering the perfect blend of tropical paradise and outdoor exploration',
      whattodo:
          'Whale Watching: Mirissa is one of the best places in the world to go whale watching, particularly for blue whales and sperm whales. Tours operate from November to April, offering unforgettable close-up encounters with these magnificent creatures.\n\n Mirissa Beach: A beautiful crescent-shaped beach with calm waters, perfect for swimming, sunbathing, and relaxing by the sea. The beach also offers great opportunities for water sports, such as snorkeling and surfing.\n\n Secret Beach: A secluded, tranquil beach located a short walk from Mirissa Beach, ideal for those seeking privacy and a peaceful escape.\n\n Parrot Rock: A small rock formation located at the far end of Mirissa Beach, accessible by a short walk and offering stunning panoramic views of the coastline. It’s a great spot for photos and sunset views.\n\n Coconut Tree Hill: A scenic spot with rows of tall coconut trees overlooking the Indian Ocean. It’s a popular location for photography, especially during sunset.\n\n Galle Fort: A short drive from Mirissa, this UNESCO World Heritage Site is home to colonial-era architecture, cobbled streets, and historical landmarks. It’s perfect for a day trip to explore museums, art galleries, and charming cafes.\n\n Turtle Conservation Project: Visit the nearby turtle hatcheries in the region to learn about the conservation efforts for endangered sea turtles and see baby turtles being released into the ocean.\n\n Dondra Head Lighthouse: Situated at the southernmost point of Sri Lanka, this lighthouse offers breathtaking views of the ocean and surrounding areas. It’s a great spot for a scenic drive and photographs.\n\n Weligama Beach: Located just a few kilometers from Mirissa, Weligama is known for its large sandy beach and perfect beginner-friendly surf spots. It’s also a great place to relax or take a boat tour to see stilt fishermen in action.\n\n Weherahena Temple: A Buddhist temple located just outside Mirissa, known for its large statue of Buddha and peaceful surroundings, offering a glimpse into the spiritual heritage of the area.\n\n  Snorkeling and Diving: Explore the underwater beauty of the region through snorkeling and diving trips that offer a chance to see colorful coral reefs, tropical fish, and even shipwrecks.\n\n Mirissa Harbor: Visit the small harbor for a glimpse of the local fishing industry, or take a boat ride for a peaceful journey along the coast.\n\n Fishing and Boat Tours: Take a traditional fishing boat ride or go on a sunset cruise for a relaxing way to enjoy the stunning views of Mirissa’s coastline.\n\n Mirissa Nightlife: Enjoy the relaxed, beachside nightlife with beach bars, live music, and seafood restaurants. It’s a perfect way to unwind after a day of activities.\n\n Ayurvedic Spa Treatments: Mirissa offers several wellness retreats and spas that specialize in Ayurvedic treatments, perfect for relaxation and rejuvenation.',
      mapImagePath: 'image/mirissa_map.jpg'));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => FavoriteProvider()..fetchFavorites()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ImageListScreen(),
    const PackageScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white), // Set the icon color to white
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/Banner.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_sharp),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xe12c0084),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FAQScreen()), // Navigate to FAQ page
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.black,
              ),
              title: const Text(
                'Privacy',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const PolicyScreen()), // Navigate to Policy screen
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              title: const Text(
                'Rate Us',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FeedbackListScreen()), // Navigate to Rating screen
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
