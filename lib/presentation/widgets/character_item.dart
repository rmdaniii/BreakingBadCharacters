import 'package:breaking_char/constants/colors_code.dart';
import 'package:breaking_char/constants/strings.dart';
import 'package:breaking_char/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: ColorsCodes.WHITE,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, CharRoute.charactersDetailsScreen, arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: ColorsCodes.WHITE,
                  fontWeight: FontWeight.bold,
                ),
                //When the character text is long the width replace it with tex....
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: ColorsCodes.GREY,
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: 'assets/images/loading_anim.gif',
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/img.jpg'),
          ),
        ),
      ),
    );
  }
}
