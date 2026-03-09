// class PortfolioProject {
//   const PortfolioProject({
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.link,
//     required this.tags,
//     required this.badges,
//   });
//
//   final String title;
//   final String description;
//   final String image;
//   final String link;
//   final List<String> tags;
//   final List<String> badges;
// }
//
//

class PortfolioProject {
  final String title;
  final String description;
  final String image;
  final String? playStoreLink;  // For Android
  final String? appStoreLink;    // For iOS
  final String? githubLink;      // For GitHub
  final List<String> tags;
  final List<String> badges;

  const PortfolioProject({
    required this.title,
    required this.description,
    required this.image,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
    required this.tags,
    required this.badges,
  });
}