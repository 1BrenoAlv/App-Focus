import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/view-model/time_viewModel.dart';

void main() {
  group('TimerViewModel', () {
    late TimerViewmodel vm;
    late ValueNotifier<bool> isPaused;
    setUp(() {
      isPaused = ValueNotifier<bool>(false);
      vm = TimerViewmodel();
    });
    test('Inicia parado com duração zero', () {
      expect(vm.isPlaying, isFalse);
      expect(vm.duration, Duration.zero);
    });

    group('startTimer', () {
      test('Liga o temporizador e zera a duração', () {
        vm.duration = Duration(minutes: 10);
        vm.startTime(5, isPaused);

        expect(vm.isPlaying, isTrue);
        expect(vm.duration, Duration.zero);
      });
      test('Incrementa a cada sengundo quando não está pausado', () async {
        vm.startTime(5, isPaused);
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration.inSeconds, 1);
      });

      test('Não incrementa quando não está pausado', () async {
        isPaused.value = true;
        vm.startTime(5, isPaused);
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration, Duration.zero);

        isPaused.value = false;
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration.inSeconds, 1);
      });
    });
    group('stopTime - ', () {
      test('Desliga o temporizador', () {
        vm.startTime(1, isPaused);
        expect(vm.isPlaying, isTrue);
        vm.stopTime();
        expect(vm.isPlaying, isFalse);
      });
    });
  });
}
