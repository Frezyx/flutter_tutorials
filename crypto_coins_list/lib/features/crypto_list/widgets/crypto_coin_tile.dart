import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryotoCoinTile extends StatelessWidget {
  const CryotoCoinTile({
    Key? key,
    required this.coinName,
  }) : super(key: key);

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin_logo.svg',
        height: 30,
        width: 30,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '200000\$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
        );
      },
    );
  }
}
