import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../constants.dart';

enum Reaction { none, dissapoint, kudos }

List<Reaction> ReactionValues = Reaction.values;

typedef OnButtonPressedCallback = void Function(Reaction newReaction);

class ReactionButton extends StatefulWidget {
  const ReactionButton({
    super.key,
    this.initialReaction,
    this.onReactionChanged,
  });

  final Reaction? initialReaction;
  final OnButtonPressedCallback? onReactionChanged;

  @override
  State<ReactionButton> createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton> {
  Reaction _reaction = Reaction.none;
  bool _reactionView = false;

  GlobalKey btnKey = GlobalKey();
  final List<ReactionElement> reactions = [
    ReactionElement(
      Reaction.kudos,
      const Icon(
        Icons.thumb_up_off_alt_rounded,
        color: BLUE,
      ),
    ),
    ReactionElement(
        Reaction.dissapoint,
        const Icon(
          Icons.thumb_down,
          color: RED,
        )),
  ];

  @override
  void initState() {
    super.initState();
    _reaction = widget.initialReaction ?? Reaction.none;
    setState(() {});
  }

  late OverlayEntry overlayEntry;

  void onCloseOverlay() {
    overlayEntry.remove();
  }

  void _showReactionPopUp(BuildContext context, Offset tapPosition) {
    final screenWidth = MediaQuery.of(context).size.width;
    double left = tapPosition.dx;
    if ((screenWidth - left) < 100) {
      left = left - 100;
    } else {
      left = left - 20;
    }
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: left,
        top: tapPosition.dy - 60,
        child: Material(
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: GREY.shade300,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reactions.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 15 + index * 15,
                    child: FadeInAnimation(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _reaction = reactions[index].reaction;
                            if (widget.onReactionChanged != null) {
                              widget.onReactionChanged!(_reaction);
                            }
                            _reactionView = false;
                          });
                          onCloseOverlay();
                        },
                        icon: reactions[index].icon,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _showReactionPopUp(context, details.globalPosition);
        setState(() {
          _reactionView = true;
        });
      },
      onTap: () {
        if (_reactionView) {
          onCloseOverlay();
          _reactionView = false;
        } else {
          if (_reaction == Reaction.none) {
            _reaction = Reaction.kudos;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          } else {
            _reaction = Reaction.none;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          }
        }
        setState(() {});
      },
      child: ReactionIcon(reaction: _reaction),
    );
  }
}

class ReactionIcon extends StatelessWidget {
  const ReactionIcon({super.key, required this.reaction});

  final Reaction reaction;

  @override
  Widget build(BuildContext context) {
    switch (reaction) {
      case Reaction.kudos:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: BLUE,
        );
      case Reaction.dissapoint:
        return const Icon(
          Icons.thumb_down,
          color: RED,
        );
      case Reaction.none:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: GREY,
        );
    }
  }
}

class ReactionElement {
  final Reaction reaction;
  final Icon icon;

  ReactionElement(this.reaction, this.icon);
}
