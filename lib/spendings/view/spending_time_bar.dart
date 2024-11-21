import 'package:flutter/material.dart';

class SpendingTimeBar extends StatelessWidget {
  const SpendingTimeBar({super.key});

//TODO wrapper cela dans un BlocConstructor et faire que l'information affiché dans les textbox soit géré par le Cubit.
//TODO voir comment cela se gère avec le textEditController
  @override
  Widget build(BuildContext context) {
    return /*BlocListener<SpendingsBloc, SpendingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: */
        Container(
      height: 50,
      color: const Color.fromARGB(255, 88, 12, 6),
      child: Row(
        children: [
          _BackwardTimeArrow(),
          //TODO variables de traduction
          const SizedBox(width: 8),
          _SpendingsTotalAmountProgressBar(),
          const SizedBox(height: 8),
          _ForwardTimeArrow(),
        ],
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
          onPressed: () => print("micheldr backward"),
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
          onPressed: () => print("micheldr forward"),
          child: const Icon(Icons.arrow_forward_sharp),
        ));
  }
}

class _SpendingsTotalAmountProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 10,
      fit: FlexFit.tight,
      //Notre bar de progrès
      child: Container(
        clipBehavior: Clip.hardEdge,
        //Marge : uniquement horizontale
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        //Effet arrondi
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 40.0,
        //A l'intérieur nous mettons un progress bar qui sera fill par la quantité voulue
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned.fill(
              child: LinearProgressIndicator(
                //Mettre la valeur du total des dépenses en pourcentage. Le bloc doit présenter le floater. et l'arreter à 100 si > 100
                value: 0.7,
                color: Colors.blue.withAlpha(100),
                backgroundColor: Colors.blue.withAlpha(50),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              //TODO mettre : nom du mois, espace, le total des dépenses
              child: Text('Hello world'),
            )
          ],
        ),
      ),
    );
  }
}
