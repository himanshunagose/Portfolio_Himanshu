import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          const Divider(height: 42),
          Text(
            '© $year Himanshu · Crafted with Flutter Web',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 0.8,
                  color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 18,
            children: const [
              _FooterLink(label: 'GitHub', url: 'https://github.com/himanshunagose'),
              _FooterLink(label: 'LinkedIn', url: 'https://www.linkedin.com/in/himanshu-nagose-474378240/'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      child: Text(label),
    );
  }
}

