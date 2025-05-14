import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController _tabController;
  TabController get tabController => _tabController;

  int _currentContent = 0;
  int get currentContent => _currentContent;

  void changeTab() {
    _tabController.animateTo((_tabController.index + 1) % 3);
  }

  void _tabListener() {
    _currentContent = _tabController.index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(vsync: this, length: 3);

    _tabController.animation!.addListener(_tabListener);
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}
