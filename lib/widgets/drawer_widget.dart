import 'package:flutter/material.dart';
import 'package:raneso_app/constants/constants.dart';
import 'package:raneso_app/models/models.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.item});

  final List<DrawerModel> item;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.76,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            color: AppThemeColor,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white12,
                    ),
                  ),
                ),
                Positioned(
                  left: -20.0,
                  bottom: -20.0,
                  child: Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white12,
                    ),
                  ),
                ),
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.white30,
                          child: CircleAvatar(
                              radius: 36.0,
                              backgroundImage: AssetImage('assets/avatar.jpg')),
                        ),
                        SizedBox(height: 10.0),
                        Text('Ambadas Kulkarni',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        SizedBox(height: 4.0),
                        Text('+91 93378 56231',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white54)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _drawerItem(
                    icon: item[0].icon,
                    label: item[0].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  _drawerItem(
                    icon: item[1].icon,
                    label: item[1].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  _drawerItem(
                    icon: item[2].icon,
                    label: item[2].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  _drawerItem(
                    icon: item[3].icon,
                    label: item[3].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  _drawerItem(
                    icon: item[4].icon,
                    label: item[4].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  _drawerItem(
                    icon: item[5].icon,
                    label: item[5].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  const Divider(height: 32.0),
                  _drawerItem(
                    icon: item[6].icon,
                    label: item[6].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                  _drawerItem(
                    icon: item[7].icon,
                    label: item[7].title,
                    onTap: () => _onItemPressed(context, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onItemPressed(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
      default:
    }
  }

  Widget _drawerItem(
      {required VoidCallback onTap,
      required IconData icon,
      required String label}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 36.0,
              width: 36.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey.shade100,
              ),
              child: Icon(
                icon,
                color: Colors.black54,
                size: 24.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(label,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
