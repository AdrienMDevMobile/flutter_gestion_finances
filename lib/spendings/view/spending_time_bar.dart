import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../spendings.dart';

class SpendingTimeBar extends StatelessWidget {
  const SpendingTimeBar({super.key});

//TODO wrapper cela dans un BlocConstructor et faire que l'information affiché dans les textbox soit géré par le Cubit.
//TODO voir comment cela se gère avec le textEditController
  @override
  Widget build(BuildContext context) {
    return BlocListener<SpendingsBloc, SpendingsState>(
      listener: (context, state) {
        // TODO: implement listener : animation pour la barre de progression
      },
      child: Container(
        height: 50,
        color: const Color.fromARGB(255, 88, 12, 6),
        child: Row(
          children: [
            _BackwardTimeArrow(),
            const SizedBox(width: 8),
            _SpendingsTotalAmountProgressBar(),
            const SizedBox(height: 8),
            _ForwardTimeArrow(),
          ],
        ),
      ),
    );
    //);
  }
}

class _BackwardTimeArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: OutlinedButton(
          onPressed: () => context
              .read<SpendingsBloc>()
              .add(const TimeViewedChanged(difference: -1)),
          clipBehavior: Clip.antiAlias,
          child: const Icon(Icons.arrow_back_sharp),
        ));
  }
}

class _ForwardTimeArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: OutlinedButton(
          onPressed: () => context
              .read<SpendingsBloc>()
              .add(const TimeViewedChanged(difference: 1)),
          clipBehavior: Clip.antiAlias,
          child: const Icon(Icons.arrow_forward_sharp),
        ));
  }
}

class _SpendingsTotalAmountProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final centerText = context.select(
      (SpendingsBloc bloc) =>
          "${DateFormat.MMMM().format(DateTime(bloc.state.yearViewed, bloc.state.monthViewed))} ${bloc.state.yearViewed} : ${bloc.state.totalSpent}",
    );

    double progressBarFilledPercentage = context.select(
      (SpendingsBloc bloc) => bloc.state.totalSpent / 100,
    );
    if (progressBarFilledPercentage > 1) {
      progressBarFilledPercentage = 1;
    } else if (progressBarFilledPercentage < 0) {
      progressBarFilledPercentage = 0;
    }

    return Flexible(
      flex: 10,
      fit: FlexFit.tight,
      //Notre bar de progrès
      child: Container(
        clipBehavior: Clip.hardEdge,
        //Marge : uniquement horizontale
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        //Effet arrondi
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 40.0,
        //A l'intérieur nous mettons un progress bar qui sera fill par la quantité voulue
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: LinearProgressIndicator(
                //Mettre la valeur du total des dépenses en pourcentage. Le bloc doit présenter le floater. et l'arreter à 100 si > 100
                value: progressBarFilledPercentage,
                color: Colors.blue.withAlpha(100),
                backgroundColor: Colors.blue.withAlpha(50),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
              child: Text(centerText),
            )
          ],
        ),
      ),
    );
  }
}
