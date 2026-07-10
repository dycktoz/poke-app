import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/providers/repository/poke_repository_provider.dart';

class PokeState {
  final List<Pokemon> pokemons;
  final int currentPage;
  final String searchQuery;
  final bool sortByNumber;
  final bool isLoading;
  final bool isLastPage;

  PokeState({
    required this.pokemons,
    required this.currentPage,
    required this.searchQuery,
    required this.sortByNumber,
    required this.isLoading,
    required this.isLastPage,
  });

  factory PokeState.initial() => PokeState(
        pokemons: [],
        currentPage: 1,
        searchQuery: '',
        sortByNumber: true,
        isLoading: false,
        isLastPage: false,
      );

  PokeState copyWith({
    List<Pokemon>? pokemons,
    int? currentPage,
    String? searchQuery,
    bool? sortByNumber,
    bool? isLoading,
    bool? isLastPage,
  }) {
    return PokeState(
      pokemons: pokemons ?? this.pokemons,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
      sortByNumber: sortByNumber ?? this.sortByNumber,
      isLoading: isLoading ?? this.isLoading,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}

class PokeNotifier extends StateNotifier<PokeState> {
  final Future<List<Pokemon>> Function({int page, String search, bool sortByNumber}) fetchPokeList;

  PokeNotifier({required this.fetchPokeList}) : super(PokeState.initial());

  Future<void> loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;

    state = state.copyWith(isLoading: true);

    try {
      final newPokemons = await fetchPokeList(
        page: state.currentPage,
        search: state.searchQuery,
        sortByNumber: state.sortByNumber,
      );

      if (newPokemons.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          isLastPage: true,
        );
      } else {
        state = state.copyWith(
          pokemons: [...state.pokemons, ...newPokemons],
          currentPage: state.currentPage + 1,
          isLoading: false,
          isLastPage: newPokemons.length < 20,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print('Error loading next page: $e');
    }
  }

  void updateSearch(String query) {
    if (state.searchQuery == query) return;
    
    state = PokeState.initial().copyWith(
      searchQuery: query,
      sortByNumber: state.sortByNumber,
    );
    loadNextPage();
  }

  void updateSorting(bool sortByNumber) {
    if (state.sortByNumber == sortByNumber) return;

    state = PokeState.initial().copyWith(
      sortByNumber: sortByNumber,
      searchQuery: state.searchQuery,
    );
    loadNextPage();
  }
}

final pokeListProvider = StateNotifierProvider<PokeNotifier, PokeState>((ref) {
  final pokeRepository = ref.watch(pokeRepositoryProvider);
  return PokeNotifier(fetchPokeList: pokeRepository.getPokeList);
});
