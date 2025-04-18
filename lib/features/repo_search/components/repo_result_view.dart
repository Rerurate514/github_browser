import 'package:flutter/material.dart';
import 'package:github_browser/features/repo_search/components/repo_list_item.dart';
import 'package:github_browser/features/repo_search/entities/repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoryResultsView extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final List<Repository> searchResults;
  final String searchQuery;

  const RepositoryResultsView({
    super.key,
    required this.isLoading,
    this.errorMessage,
    required this.searchResults,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    
    if (searchResults.isEmpty) {
      return Center(
        child: Text(
          searchQuery.isEmpty 
          ? AppLocalizations.of(context)!.home_bar_title
          : AppLocalizations.of(context)!.home_search_empty,
          style: const TextStyle(fontSize: 16),
        ),
      );
    }
    
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final repo = searchResults[index];
        return RepositoryListItem(repository: repo);
      },
    );
  }
}
