class Experience {
  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.highlights,
  });

  final String company;
  final String role;
  final String period;
  final String description;
  final List<String> highlights;
}

