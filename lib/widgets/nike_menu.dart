import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NikeMenu extends AnimatedWidget {
  const NikeMenu(
    Animation animation,
  ) : super(listenable: animation);
  Animation get _animationElemMenu => listenable as Animation;

  Widget elemMenu(String textElem) {
    return Row(children: [
      Text(
        textElem,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: 30)
    ]);
  }

  Widget iconMenu(IconData iconName) {
    return Row(children: [
      Icon(
        iconName,
        color: Color(0xFFff8a67),
        size: 25.0,
      ),
      SizedBox(width: 30)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<String> listElem = ["HOME", "SHOP", "JOIN US", "SIGN IN", "HELP"];
    List<IconData> listIcon = [Icons.store, Icons.people_alt];

    return Positioned(
        top: 30,
        right: 30,
        child: MediaQuery.of(context).size.width > 1000
            ? Row(
                children: [
                  for (int i = 0; i < listElem.length; i++)
                    Transform.translate(
                      offset: Offset(
                          0.0, -50 * (i + 1) * (1 - _animationElemMenu.value)),
                      child: elemMenu(listElem[i]),
                    ),
                  for (int i = 0; i < listIcon.length; i++)
                    Transform.translate(
                      offset: Offset(
                          0.0, -80 * (i + 1) * (1 - _animationElemMenu.value)),
                      child: iconMenu(listIcon[i]),
                    ),
                ],
              )
            : Transform.translate(
                offset: Offset(0.0, -80 * (1 - _animationElemMenu.value)),
                child: iconMenu(Icons.menu,),
              ));
  }
}
