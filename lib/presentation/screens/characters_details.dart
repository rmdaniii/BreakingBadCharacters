import 'package:breaking_char/constants/colors_code.dart';
import 'package:breaking_char/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final CharacterModel character;

  const CharactersDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCodes.GREY,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBaR(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildCharacterInfo('Name : ', character.name),
                      _buildDivider(280),
                      _buildCharacterInfo('Status : ', character.status),
                      _buildDivider(270),
                      _buildCharacterInfo('Species : ', character.species),
                      _buildDivider(260),
                      character.type.isEmpty
                          ? Container()
                          : _buildCharacterInfo('Type : ', character.type),
                      character.type.isEmpty ? Container() : _buildDivider(280),
                      _buildCharacterInfo('Gender : ', character.gender),
                      _buildDivider(270),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: ColorsCodes.WHITE,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: ColorsCodes.WHITE,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(double endIndent) {
    return Divider(
      color: ColorsCodes.YELLOW,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget _buildSliverAppBaR() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      centerTitle: true,
      backgroundColor: ColorsCodes.GREY,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: const TextStyle(
            color: ColorsCodes.WHITE,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
