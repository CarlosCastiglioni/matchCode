import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_code/widgets/match_actions.dart';

import '../controllers/bloc/match_timer_bloc.dart';
import '../controllers/ticker.dart';
import '../repository/languages_repository.dart';
import '../widgets/custom_app_bar.dart';

class PendingPage extends StatelessWidget {
  PendingPage({Key? key}) : super(key: key);
  final languages = LanguagesRepository.table;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchTimerBloc(ticker: const Ticker()),
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar(
              title1: "Solicitações Pendentes",
              subtitle: "Veja abaixo suas solicitações pendentes"),
          preferredSize: const Size.fromHeight(130),
        ),
        body: MatchActions(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
