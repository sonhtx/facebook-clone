import 'package:anti_fb/widgets/card_item.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/ButtonWidget.dart';
import '../../widgets/circle_button.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.bg,
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Constants.bg,
                  title: const Text('Menu',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  centerTitle: false,
                  floating: true,
                  pinned: true,
                  actions: [
                    CircleButton(
                        icon: Icons.search, iconSize: 30.0, onPressed: () {}),
              ]),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                    CardItem(
                      width: screenWidth - 20.0,
                      height: 100.0,
                      label: 'Messi',
                      widget: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/messi-world-cup.png'),
                        radius: 35.0,
                      ),
                      onPressed: () {},
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
                          onPressed: () {},
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
                        backgroundColor: Constants.btnbg,
                        borderColor: Constants.bg,
                        radius: 8.0,
                        onPressed: () {}),
                    ButtonWidget(
                        width: screenWidth - 20.0,
                        fontSize: 13.0,
                        buttonText: "Exit",
                        paddingTop: 15.0,
                        textColor: Colors.black,
                        backgroundColor: Constants.btnbg,
                        borderColor: Constants.bg,
                        radius: 8.0,
                        onPressed: () {}),
                ],
              ),
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
              backgroundColor: Constants.bg,
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
