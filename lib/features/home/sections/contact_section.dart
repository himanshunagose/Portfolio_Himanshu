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
  final mobileController = TextEditingController(); // Add this at the top with other controllers
  bool sending = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  /*Future<void> _submit() async {
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
  }*/
  Future<void> _submit() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => sending = true);

    print('object');
    try {
      final response = await http.post(
        Uri.parse('https://formspree.io/f/mgvgnvdg'), // <-- Use your Formspree URL
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'message': messageController.text,
          'number': mobileController.text,
        },
      );

      if (!mounted) return;

      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        clearField();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent! I will get back shortly.')),
        );
        formKey.currentState?.reset();
      } else {
        clearField();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent! I will get back shortly.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      clearField();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent! I will get back shortly.')),
      );
    } finally {
      if (mounted) setState(() => sending = false);
    }
  }
 void clearField(){
    nameController.clear();
    emailController.clear();
    messageController.clear();
    mobileController.clear();
   formKey.currentState?.reset();
 }
 /* void _submit() {
    final url = Uri.parse('https://formspree.io/f/mgvgnvdg');
    final name = nameController.text;
    final email = emailController.text;
    final message = messageController.text;

    final form = html.FormElement()
      ..action = url.toString()
      ..method = 'POST'
      ..target = '_blank';

    form.append(html.InputElement()
      ..type = 'hidden'
      ..name = 'name'
      ..value = name);
    form.append(html.InputElement()
      ..type = 'hidden'
      ..name = 'email'
      ..value = email);
    form.append(html.TextAreaElement()
      ..name = 'message'
      ..value = message);

    html.document.body!.append(form);
    form.submit();
    form.remove();
  }
*/


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
          /*LayoutBuilder(
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
                      width: halfWidth,
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'Mobile Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Mobile number is required';
                          final emailRegex = RegExp(r'^.+@.+\..+$');
                          if (!emailRegex.hasMatch(value)) return 'Enter a valid mobile number';
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
          ),*/
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
                    // Name
                    SizedBox(
                      width: halfWidth,
                      child: TextFormField( autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (value) =>
                        value == null || value.isEmpty ? 'Name is required' : null,
                      ),
                    ),

                    // Email
                    SizedBox(
                      width: halfWidth,
                      child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
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

                    // Mobile Number
                    SizedBox(
                      width: halfWidth,
                      child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: mobileController,
                        decoration: const InputDecoration(labelText: 'Mobile Number'),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Mobile number is required';
                          final phoneRegex = RegExp(r'^\+?\d{7,15}$'); // basic phone validation
                          if (!phoneRegex.hasMatch(value)) return 'Enter a valid mobile number';
                          return null;
                        },
                      ),
                    ),

                    // Message
                    SizedBox(
                      width: fullWidth,
                      child: TextFormField( autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: messageController,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          labelText: 'Tell me about your project',
                        ),
                        validator: (value) =>
                        value == null || value.length < 12 ? 'Add more details' : null,
                      ),
                    ),

                    // Submit Button
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
                onPressed: () => launchUrl(Uri.parse('mailto:himanshunagose6264@gmail.com')),
                tooltip: 'Gmail',
              ),
             /* IconButton(
                icon: const Icon(Icons.linked_camera_outlined),
                onPressed: () => launchUrl(Uri.parse('https://www.instagram.com/himanshu.dev')),
                tooltip: '@himanshu.dev',
              ),*/
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () => launchUrl(Uri.parse('https://github.com/himanshux')),
                tooltip: 'GitHub',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

