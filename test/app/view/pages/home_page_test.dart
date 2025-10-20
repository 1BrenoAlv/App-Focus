import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/shared/utils/routes.dart';
import 'package:fokus/app/view-model/time_viewModel.dart';
import 'package:fokus/app/view/pages/timer_page.dart';
import 'package:fokus/app/view/widgets/timer_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockTimerViewModel extends Mock implements TimerViewmodel {}

void main() {
  late MockTimerViewModel mockTimerViewModel;

  Widget createWidget() {
    return ChangeNotifierProvider<TimerViewmodel>.value(
      value: mockTimerViewModel,
      child: MaterialApp(
        routes: routes,
        //home: Scaffold(body: HomePage()),
      ),
    );
  }

  setUpAll(() {
    registerFallbackValue(ValueNotifier<bool>(false));
  });

  setUp(() {
    mockTimerViewModel = MockTimerViewModel();

    when(() => mockTimerViewModel.isPlaying).thenReturn(false);
    when(() => mockTimerViewModel.duration).thenReturn(Duration.zero);
  });

  group('HomePage -', () {
    group('modo foco -', () {
      testWidgets('Lista os modos e renderiza os botões da páginas do timer', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget());

        expect(find.text('Modo Foco'), findsOneWidget);
        expect(find.text('Pausa Curta'), findsOneWidget);
        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Modo Foco'));
        await tester.pumpAndSettle();

        expect(find.byType(TimerPage), findsOneWidget);
        expect(find.byType(TimerWidget), findsOneWidget);
      });
    });

    group('Pausa Longa -', () {
      testWidgets('Lista os modos e renderiza os botões da páginas do timer', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget());

        expect(find.text('Modo Foco'), findsOneWidget);
        expect(find.text('Pausa Curta'), findsOneWidget);
        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Pausa Longa'));
        await tester.pumpAndSettle();

        expect(find.byType(TimerPage), findsOneWidget);
        expect(find.byType(TimerWidget), findsOneWidget);
      });
    });

    group('Pausa Curta -', () {
      testWidgets('Lista os modos e renderiza os botões da páginas do timer', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget());

        expect(find.text('Modo Foco'), findsOneWidget);
        expect(find.text('Pausa Curta'), findsOneWidget);
        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Pausa Curta'));
        await tester.pumpAndSettle();

        expect(find.byType(TimerPage), findsOneWidget);
        expect(find.byType(TimerWidget), findsOneWidget);
      });
    });
  });
}
