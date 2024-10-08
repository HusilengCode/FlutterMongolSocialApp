import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leadingIcon;
  final Function? onPressedLeading;
  final List<Widget>? actions;
  final Widget? profilePicture;
  final Function? onPressedProfilePicture;

  CustomAppBar({this.title, this.leadingIcon, this.onPressedLeading, this.actions, this.profilePicture, this.onPressedProfilePicture});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      title: title,
      // ignore: unnecessary_null_comparison
      leading: (leadingIcon != null)
          ? IconButton(
              icon: leadingIcon!,
              onPressed: (){onPressedLeading!();},
            )
          : null,
      actions: (profilePicture != null) ? [_buildProfilePicture(profilePicture!)] : actions,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  _buildProfilePicture(Widget profilePicture) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: (){onPressedProfilePicture!();},
        borderRadius: BorderRadius.circular(60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: profilePicture,
        ),
      ),
    );
  }
}
