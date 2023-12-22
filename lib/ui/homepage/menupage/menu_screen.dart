import 'dart:io';

import 'package:anti_fb/repository/auth/logout_repo.dart';
import 'package:anti_fb/ui/login/login_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

import '../../profile/profile_screen.dart';
import 'settingpage/setting_screen.dart';
import 'package:anti_fb/widgets/card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anti_fb/constants.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:anti_fb/widgets/circle_button.dart';
import 'package:anti_fb/storage.dart';

class MenuPage extends StatefulWidget {
  final ScrollController scrollController;

  const MenuPage({super.key, required this.scrollController});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String? name = "";
  String? imageUrl = "";

  @override
  void initState() {
    super.initState();
    getUserName().then((value) => setState(() => name = value));
    getAvatarUrl().then((value) => setState(() => imageUrl = value));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: BG,
      body: SafeArea(
          child: CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverAppBar(
              backgroundColor: BG,
              title: const Text('Menu',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
              centerTitle: false,
              floating: true,
              pinned: true,
              actions: [
                CircleButton(
                    icon: Icons.search, iconSize: 30.0, onPressed: () {}),
              ]),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CardItem(
                  width: screenWidth - 20.0,
                  height: 100.0,
                  label: name ?? "",
                  widget: (imageUrl != "" && imageUrl != null)
                      ? CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(imageUrl!),
                          radius: 35.0,
                        )
                      : const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/messi-world-cup.png'),
                          radius: 35.0,
                        ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ExpandTab(
                  image: const Icon(
                    Icons.help_outline,
                    size: 30.0,
                  ),
                  title: 'Help & Support',
                  card: CardItem(
                    width: screenWidth - 20.0,
                    height: 65 - .0,
                    label: "Terms & Policies",
                    widget: const Icon(
                      Icons.policy_outlined,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                ExpandTab(
                    title: "Setting and privacy",
                    card: CardItem(
                      width: screenWidth - 20.0,
                      height: 65.0,
                      label: "Settings",
                      widget: const Icon(
                        Icons.person,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(CupertinoPageRoute(
                                builder: (context) => SettingScreen(
                                      name: name!,
                                    )));
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //       builder: (context) => SettingScreen(name: name!,)),
                        // );
                      },
                    ),
                    image: const Icon(
                      Icons.settings,
                      size: 30.0,
                    )),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    width: screenWidth - 20.0,
                    fontSize: 13.0,
                    buttonText: "Logout",
                    paddingTop: 15.0,
                    textColor: Colors.black,
                    backgroundColor: BTNBG,
                    borderColor: BG,
                    radius: 8.0,
                    onPressed: () async {
                      LogoutRepository logoutRepo = LogoutRepository();
                      final logoutStatus = await logoutRepo.logout();
                      if (context.mounted) {
                        if (logoutStatus) {
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginScreen()),
                            ModalRoute.withName('/'),
                          );
                        }
                      }
                    }),
                ButtonWidget(
                    width: screenWidth - 20.0,
                    fontSize: 13.0,
                    buttonText: "Exit",
                    paddingTop: 15.0,
                    textColor: Colors.black,
                    backgroundColor: BTNBG,
                    borderColor: BG,
                    radius: 8.0,
                    onPressed: () {
                      exit(0);
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class ExpandTab extends StatefulWidget {
  final Widget image;
  final String title;
  final CardItem card;

  const ExpandTab(
      {super.key,
      required this.title,
      required this.card,
      required this.image});

  @override
  State<ExpandTab> createState() => _ExpandTabState();
}

class _ExpandTabState extends State<ExpandTab> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            active = !active;
          });
        },
        children: [
          ExpansionPanel(
              backgroundColor: BG,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Row(children: [
                    widget.image,
                    const SizedBox(width: 15.0),
                    Text(widget.title)
                  ]),
                );
              },
              body: widget.card,
              isExpanded: active,
              canTapOnHeader: true)
        ],
      ),
    );
  }
}
