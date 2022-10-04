import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/colors/colors_manager.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/domain/entities/quote.dart';

class QuoteContainer extends StatelessWidget {
  final Quote quote;
  const QuoteContainer({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(quote.quote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    height: 1.5,
                  )),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(quote.author,
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_circle_up_outlined,
                  size: 20, color: ColorsManager.white)
            ],
          ),
        ],
      ),
    );
  }
}
