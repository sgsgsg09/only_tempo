import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:only_tempo/lib/features/viewmodel/tempo_provider.dart';

class MetronomeUI extends ConsumerStatefulWidget {
  final int id; // ID를 생성자로 전달받아 관리

  const MetronomeUI({super.key, required this.id});

  @override
  _MetronomeUIState createState() => _MetronomeUIState();
}

class _MetronomeUIState extends ConsumerState<MetronomeUI> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayLarge = theme.textTheme.displayLarge!;
    final bodyLarge = theme.textTheme.bodyLarge!;
    final primaryColor = theme.primaryColor;
    final secondaryHeader = theme.secondaryHeaderColor;

    final tempoModel = ref.watch(tempoModelProvider);

    // 현재 ID에 해당하는 GroupElement 가져오기
    final currentElement =
        tempoModel.elements.firstWhere((element) => element.id == widget.id);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;
          final double height = constraints.maxHeight;

          return Column(
            children: [
              // Rhythm Display Section
              Column(
                children: [
                  Text("5/4", style: bodyLarge),
                  SizedBox(height: height * 0.02),
                  // Rhythm Indicators (Optional)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      tempoModel.elements.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Icon(
                          Icons.circle,
                          size: width * 0.03,
                          color: tempoModel.elements[index].id == widget.id
                              ? secondaryHeader
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // BPM Display Section
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove,
                            size: width * 0.08, color: Colors.grey),
                        onPressed: () {
                          ref
                              .read(tempoModelProvider.notifier)
                              .decreaseBpm(widget.id);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text(
                          currentElement.bpm.toString(),
                          style: displayLarge,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add,
                            size: width * 0.08, color: Colors.grey),
                        onPressed: () {
                          ref
                              .read(tempoModelProvider.notifier)
                              .increaseBpm(widget.id);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "BPM",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
