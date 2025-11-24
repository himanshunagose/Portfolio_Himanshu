class PortfolioProject {
  const PortfolioProject({
    required this.title,
    required this.description,
    required this.image,
    required this.link,
    required this.tags,
    required this.badges,
  });

  final String title;
  final String description;
  final String image;
  final String link;
  final List<String> tags;
  final List<String> badges;
}

