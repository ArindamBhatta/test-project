import 'package:flutter/material.dart';
import 'all_ten_button_icons.dart';

class AllNavigationButton extends StatelessWidget {
  const AllNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[800],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllTenButtonIcons(
                  icon: Icons.dashboard,
                  text: 'Sectors',
                ),
                AllTenButtonIcons(
                  icon: Icons.language,
                  text: 'Eco system',
                ),
                AllTenButtonIcons(icon: Icons.group, text: 'Investors'),
                AllTenButtonIcons(
                  icon: Icons.rocket_launch_sharp,
                  text: 'Launchpads',
                ),
                AllTenButtonIcons(
                  icon: Icons.verified_user_sharp,
                  text: 'Team',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AllTenButtonIcons(
                  icon: Icons.folder_shared,
                  text: 'Glossary',
                ),
                AllTenButtonIcons(
                  icon: Icons.layers,
                  text: 'Reserves',
                ),
                AllTenButtonIcons(
                  icon: Icons.toggle_off_rounded,
                  text: 'M.cap of',
                ),
                AllTenButtonIcons(
                  icon: Icons.lan_rounded,
                  text: 'Converter',
                ),
                AllTenButtonIcons(
                  icon: Icons.luggage,
                  text: 'Drops',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
