
import 'package:fittrix/viewModels/main_controller.dart';
import 'package:fittrix/views/home_page.dart';
import 'package:fittrix/views/login_page.dart';
import 'package:fittrix/views/record_page.dart';
import 'package:fittrix/views/write_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: GetBuilder<MainController>(
        id: controller.changePageUniqueId,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: controller.pageIndex,
              alignment: Alignment.center,
              children: [
                HomePage(),
                (controller.menuName != null) ? WritePage(menuName: controller.menuName!) : HomePage(),
                RecordPage(),
                LoginPage()
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDADCE4), width: 1)
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedLabelStyle: const TextStyle(fontSize: 12),
                selectedItemColor: Colors.black,
                unselectedLabelStyle: const TextStyle(fontSize: 12, color: Color(0xffCBD0DD)),
                elevation: 0,
                currentIndex: controller.pageIndex,
                onTap: controller.changeBottomNav,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home_outlined),
                    label: '홈',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.control_point),
                    activeIcon: Icon(Icons.control_point),
                    label: '운동 기록 하기',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.contact_page_outlined),
                      activeIcon: Icon(Icons.contact_page_outlined),
                      label: '운동 기록 보기'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person_outline),
                      label: '로그인'
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
