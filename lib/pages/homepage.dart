import 'package:flutter/material.dart';
import 'package:raneso_app/constants/constants.dart';
import 'package:raneso_app/models/models.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<DrawerModel> _drawerItem;
  List<ListModel> _listItem = [];

  String selectedValue = '5 Minutes';
  bool isLoading = false;
  bool _toggle = false;

  @override
  void initState() {
    super.initState();
    _drawerItem = DrawerModel.generatedItem;
    _listItem = ListModel.generatedItem;
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "5 Minutes", child: Text("5 Minutes")),
      const DropdownMenuItem(value: "15 Minutes", child: Text("15 Minutes")),
      const DropdownMenuItem(value: "30 Minutes", child: Text("30 Minutes")),
      const DropdownMenuItem(value: "45 Minutes", child: Text("45 Minutes")),
      const DropdownMenuItem(value: "1 Hour", child: Text("1 Hour")),
    ];
    return menuItems;
  }

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _listItem = ListModel.generatedItem;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(item: _drawerItem),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          fetchData();
        },
        backgroundColor: AppThemeColor,
        child: const Icon(Icons.refresh_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.all(16.0),
              color: AppThemeColor,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(builder: (context) {
                          return InkWell(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2.5, color: Colors.white),
                                color: Colors.grey.shade200,
                                image: const DecorationImage(
                                  image: AssetImage('assets/avatar.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                        Row(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => showSearch(
                                context: context,
                                delegate: Search(),
                              ),
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: const Icon(
                                  Icons.search_rounded,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: const Badge(
                                label: Text('2'),
                                offset: Offset(10.0, -10.0),
                                child: Icon(
                                  Icons.notifications_rounded,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    const Text(
                      'Market Stocks',
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.036),
                          blurRadius: 8.0,
                          spreadRadius: 0.0)
                    ],
                  ),
                  child: DropdownButton(
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems,
                    padding: EdgeInsets.zero,
                    iconSize: 20.0,
                    isDense: true,
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    underline: Container(),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    hint: const Text('Time',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600)),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AI Trade',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4.0),
                    Switch(
                      activeColor: AppThemeColor,
                      activeTrackColor: AppThemeColor.withOpacity(0.22),
                      inactiveThumbColor: Colors.grey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 20.0,
                      value: _toggle,
                      onChanged: (value) {
                        setState(() {
                          _toggle = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            isLoading
                ? Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Load your stocks',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10.0),
                        SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator.adaptive()),
                      ],
                    ))
                : ListView.builder(
                    itemCount: _listItem.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      final item = _listItem[index];
                      return Container(
                        width: size.width,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.036),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0)
                            ]),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    item.subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14.0, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${item.price}',
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 4.0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: item.profits.contains('+')
                                          ? Colors.green.shade600
                                          : Colors.redAccent),
                                  child: Text(
                                    item.profits,
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
