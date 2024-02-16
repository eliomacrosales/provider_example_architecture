import 'package:bac_architecture/features/home/presentation/providers/di/home_repository_provider.dart';
import 'package:bac_architecture/features/home/presentation/providers/home_notifier.dart';
import 'package:bac_architecture/features/home/presentation/providers/states/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final homeAsyncNotifierProvider = AsyncNotifierProvider<HomeAsyncNotifier, HomeState>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeAsyncNotifier(homeRepository: homeRepository);
} as HomeAsyncNotifier Function());
