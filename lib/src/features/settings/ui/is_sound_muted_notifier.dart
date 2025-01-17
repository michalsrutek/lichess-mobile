import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../settings/data/settings_repository.dart';

class IsSoundMutedNotifier extends StateNotifier<bool> {
  IsSoundMutedNotifier(this.settings, bool initialValue) : super(initialValue);

  final SettingsRepository settings;

  void toggleSound() async {
    final ok = await settings.toggleSound();
    if (ok) {
      state = settings.isSoundMuted();
    }
  }
}

final isSoundMutedProvider =
    StateNotifierProvider.autoDispose<IsSoundMutedNotifier, bool>((ref) {
  final settingsRepository = ref.watch(settingsRepositoryProvider);
  return IsSoundMutedNotifier(
      settingsRepository, settingsRepository.isSoundMuted());
});
