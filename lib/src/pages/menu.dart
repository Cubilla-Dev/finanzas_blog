import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Gustavo Cubilla'),
            accountEmail: const Text('cubilladev@gmail.com'),
            currentAccountPicture: CircleAvatar(
                // child: ClipOval(child: Image.asset('img/name.png'),),
                ),
            // decoration: BoxDecoration(
            //     color: Colors.pinkAccent,
            //     image: DecorationImage(
            //         //fit es para que tome todo el fondo  o si no una parte nomas
            //         image: AssetImage('RUTA_DE_IMG_FONDO'),
            //         fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Sube una foto'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Sube una foto'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Sube una foto'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Sube una foto'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Sube una foto'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
