import 'package:breaking_char/business/cubit/characters_cubit.dart';
import 'package:breaking_char/constants/colors_code.dart';
import 'package:breaking_char/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../data/models/character_model.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharacterModel> allCharacters;

  // to search for characters using a character char..
  late List<CharacterModel> searchedForCharacters;
  bool _isSearched = false;
  final _searchTextController = TextEditingController();

  void addSearchForItemToSearchList(String searchCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchCharacter))
        .toList();

    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearched) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: ColorsCodes.GREY,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(
              Icons.search,
              color: ColorsCodes.GREY,
            )),
      ];
    }
  }

  void _startSearch() {
    // to make the search and buttonIcon to back in App bar
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsCodes.YELLOW,
        title: _isSearched ? _buildSearchField() : buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
          ){
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return buildBlocWidget();
            }  else {
              return _buildNoInternetWidget();
            }
          },

        child: showLoadingIndicator(),
      ),

    );
  }

  // build a widget
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: ColorsCodes.GREY,
      decoration: const InputDecoration(
        hintText: 'Find a character ...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: ColorsCodes.GREY,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: ColorsCodes.GREY,
        fontSize: 18,
      ),
      onChanged: (searchCharacter) {
        addSearchForItemToSearchList(searchCharacter);
      },
    );
  }

  Widget buildAppBarTitle() {
    return const Text(
      "Characters",
      style: TextStyle(
        color: ColorsCodes.GREY,
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsCodes.YELLOW,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: ColorsCodes.GREY,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }
  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }

  Widget _buildNoInternetWidget(){
    return Center(
      child: Container(
        color: ColorsCodes.WHITE,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Text(
              "Can't connect .. check internet...",
              style: TextStyle(
                fontSize: 22,
                color: ColorsCodes.GREY,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset("assets/images/no_internet.png"),
          ],
        ) ,
      ),
    );
  }
}


