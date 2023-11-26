import 'package:flutter/material.dart';

class DrawerModel {
  final String title;
  final IconData icon;

  const DrawerModel({required this.title, required this.icon});

  static List<DrawerModel> generatedItem = [
    const DrawerModel(title: 'Home', icon: Icons.home_rounded),
    const DrawerModel(title: 'Messages', icon: Icons.message_rounded),
    const DrawerModel(title: 'Reports', icon: Icons.insert_chart_rounded),
    const DrawerModel(title: 'Lists', icon: Icons.list_alt_rounded),
    const DrawerModel(title: 'Bookmarks', icon: Icons.bookmark_rounded),
    const DrawerModel(title: 'Logout', icon: Icons.logout_rounded),
    const DrawerModel(title: 'Tell a Friend', icon: Icons.share),
    const DrawerModel(title: 'Help and Feedback', icon: Icons.help_rounded),
  ];
}

class ListModel {
  final String title;
  final String subtitle;
  final String price;
  final String profits;

  const ListModel(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.profits});

  static List<ListModel> generatedItem = [
    const ListModel(
        title: 'Dow Jones',
        subtitle: 'Dow Jones Industrial Average',
        price: '35,390.15',
        profits: '+117.12'),
    const ListModel(
        title: '^NSEI',
        subtitle: 'NIFTY 50',
        price: '19,794.70',
        profits: '-7.30'),
    const ListModel(
        title: 'APPL',
        subtitle: 'Apple Inc.',
        price: '189.97',
        profits: '-1.34'),
    const ListModel(
        title: 'BA',
        subtitle: 'The Boeing Company',
        price: '220.00',
        profits: '+0.09'),
    const ListModel(
        title: 'BRK-B',
        subtitle: 'Berkshire Hathaway Inc.',
        price: '362.68',
        profits: '+0.88'),
    const ListModel(
        title: 'DIS',
        subtitle: 'The Walt Disney Company',
        price: '96.06',
        profits: '+0.99'),
    const ListModel(
        title: 'GE',
        subtitle: 'General Electric Company',
        price: '119.97',
        profits: '+0.37'),
    const ListModel(
        title: 'IBM',
        subtitle: 'International Business Machines',
        price: '134.25',
        profits: '-2.18'),
    const ListModel(
        title: 'MSFT',
        subtitle: 'Microsoft Corporation',
        price: '298.98',
        profits: '+1.45'),
    const ListModel(
        title: 'TSLA',
        subtitle: 'Tesla, Inc.',
        price: '890.00',
        profits: '-5.67'),
    const ListModel(
        title: 'NFLX',
        subtitle: 'Netflix, Inc.',
        price: '410.55',
        profits: '+3.22'),
    const ListModel(
        title: 'GOOGL',
        subtitle: 'Alphabet Inc.',
        price: '2,840.00',
        profits: '+23.45'),
    const ListModel(
        title: 'AMZN',
        subtitle: 'Amazon.com Inc.',
        price: '3,350.50',
        profits: '-12.78'),
    const ListModel(
        title: 'INTC',
        subtitle: 'Intel Corporation',
        price: '55.80',
        profits: '+0.89'),
    const ListModel(
        title: 'FB',
        subtitle: 'Meta Platforms, Inc.',
        price: '345.60',
        profits: '+2.11'),
    const ListModel(
        title: 'NVDA',
        subtitle: 'NVIDIA Corporation',
        price: '300.75',
        profits: '-4.56'),
    const ListModel(
        title: 'V', subtitle: 'Visa Inc.', price: '240.20', profits: '+1.98'),
    const ListModel(
        title: 'PYPL',
        subtitle: 'PayPal Holdings, Inc.',
        price: '180.45',
        profits: '-0.76'),
    const ListModel(
        title: 'WMT',
        subtitle: 'Walmart Inc.',
        price: '140.30',
        profits: '+0.45'),
    const ListModel(
        title: 'GS',
        subtitle: 'The Goldman Sachs Group, Inc.',
        price: '375.90',
        profits: '+4.32'),
    const ListModel(
        title: 'JPM',
        subtitle: 'JPMorgan Chase & Co.',
        price: '130.75',
        profits: '-1.20'),
    const ListModel(
        title: 'CSCO',
        subtitle: 'Cisco Systems, Inc.',
        price: '54.10',
        profits: '+1.67'),
    const ListModel(
        title: 'KO',
        subtitle: 'The Coca-Cola Company',
        price: '56.25',
        profits: '+0.98'),
    const ListModel(
        title: 'PEP',
        subtitle: 'PepsiCo, Inc.',
        price: '155.80',
        profits: '-2.10'),
    const ListModel(
        title: 'VZ',
        subtitle: 'Verizon Communications Inc.',
        price: '55.90',
        profits: '+0.32'),
    const ListModel(
        title: 'IBM',
        subtitle: 'International Business Machines',
        price: '134.25',
        profits: '-2.18'),
  ];
}
