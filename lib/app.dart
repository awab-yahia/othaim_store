// import 'package:flutter/material.dart';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
// import 'package:get/get.dart';
// import 'package:othaim_store/features/home/controller/home_controller.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   HomeController homeController = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           AnimatedContainer(
//             duration: const Duration(seconds: 1),
//             child: PageView(
//               physics: const NeverScrollableScrollPhysics(),
//               controller: homeController.controller,
//               children: const <Widget>[
//                 HomeScreen(),
//                 HomeScreen(),
//                 HomeScreen(),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             left: 18,
//             right: 18,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 0, right: 0),
//               child: GetBuilder<HomeController>(
//                 init: homeController,
//                 builder: (context) {
//                   return SnakeNavigationBar.color(
//                     behaviour: SnakeBarBehaviour.pinned,
//                     snakeShape: SnakeShape.indicator,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     backgroundColor: Colors.black87,
//                     snakeViewColor: Colors.black87,
//                     height: 68,
//                     elevation: 4,
//                     selectedItemColor: SnakeShape.circle == SnakeShape.indicator
//                         ? Colors.black87
//                         : null,
//                     unselectedItemColor: Colors.white,
//                     selectedLabelStyle: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.italic,
//                       fontSize: 12,
//                     ),
//                     showUnselectedLabels: false,
//                     showSelectedLabels: true,
//                     currentIndex: homeController.index,
//                     onTap: (index) {
//                       homeController.controller.animateToPage(index,
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.linear);
//                       homeController.updateIndex(index);
//                     },
//                     items: const [
//                       BottomNavigationBarItem(
//                           icon: ImageIcon(
//                             AssetImage("assets/navbar_icons/home.png"),
//                             color: Colors.white,
//                             size: 26,
//                           ),
//                           activeIcon: Padding(
//                             padding: EdgeInsets.all(5.0),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.deepOrange,
//                               maxRadius: 4,
//                             ),
//                           ),
//                           label: 'Home'),
//                       BottomNavigationBarItem(
//                           icon: ImageIcon(
//                             AssetImage("assets/navbar_icons/categories.png"),
//                             color: Colors.white,
//                             size: 26,
//                           ),
//                           activeIcon: Padding(
//                             padding: EdgeInsets.all(5.0),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.deepOrange,
//                               maxRadius: 4,
//                             ),
//                           ),
//                           label: 'Category'),
//                       BottomNavigationBarItem(
//                           icon: ImageIcon(
//                             AssetImage("assets/navbar_icons/shopping-cart.png"),
//                             color: Colors.white,
//                             size: 26,
//                           ),
//                           activeIcon: Padding(
//                             padding: EdgeInsets.all(5.0),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.deepOrange,
//                               maxRadius: 4,
//                             ),
//                           ),
//                           label: 'Cart'),
//                       BottomNavigationBarItem(
//                           icon: ImageIcon(
//                             AssetImage("assets/navbar_icons/user.png"),
//                             color: Colors.white,
//                             size: 26,
//                           ),
//                           activeIcon: Padding(
//                             padding: EdgeInsets.all(5.0),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.deepOrange,
//                               maxRadius: 4,
//                             ),
//                           ),
//                           label: 'Other'),
//                       // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
