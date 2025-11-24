import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  bool sending = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => sending = true);
    try {
      final response = await http.post(
        Uri.parse('https://example.com/api/contact'),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'message': messageController.text,
        },
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent! I will get back shortly.')),
        );
        formKey.currentState?.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('API placeholder responded with an error.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network unavailable. Try again later.')),
      );
    } finally {
      if (mounted) {
        setState(() => sending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Let’s build together',
            subtitle: 'Contact',
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final fullWidth = constraints.maxWidth;
              final halfWidth = fullWidth > 720 ? (fullWidth - 24) / 2 : fullWidth;
              return Form(
                key: formKey,
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    SizedBox(
                      width: halfWidth,
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Name is required' : null,
                      ),
                    ),
                    SizedBox(
                      width: halfWidth,
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Email is required';
                          final emailRegex = RegExp(r'^.+@.+\..+$');
                          if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: fullWidth,
                      child: TextFormField(
                        controller: messageController,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          labelText: 'Tell me about your project',
                        ),
                        validator: (value) =>
                            value == null || value.length < 12 ? 'Add more details' : null,
                      ),
                    ),
                    SizedBox(
                      width: fullWidth,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton.icon(
                          onPressed: sending ? null : _submit,
                          icon: sending
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.send),
                          label: Text(sending ? 'Sending...' : 'Send Message'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              IconButton(
                icon: const Icon(Icons.alternate_email),
                onPressed: () => launchUrl(Uri.parse('mailto:hello@himanshu.dev')),
                tooltip: 'hello@himanshu.dev',
              ),
              IconButton(
                icon: const Icon(Icons.linked_camera_outlined),
                onPressed: () => launchUrl(Uri.parse('https://www.instagram.com/himanshu.dev')),
                tooltip: '@himanshu.dev',
              ),
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () => launchUrl(Uri.parse('https://github.com/himanshux')),
                tooltip: 'github.com/himanshux',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

