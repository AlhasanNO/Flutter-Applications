import 'package:favorite_places/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _futurePlaces;
  @override
  void initState() {
    super.initState();
    _futurePlaces = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProvider);
    void addPlace() {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const AddPlaceScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: addPlace)],
      ),
      body: FutureBuilder(
        future: _futurePlaces,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : PlacesList(places: userPlaces),
      ),
    );
  }
}
