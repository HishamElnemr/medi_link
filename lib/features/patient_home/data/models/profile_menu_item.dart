class ProfileMenuItem {
  const ProfileMenuItem({
    required this.title,
    required this.iconPath,
    this.route,
    this.action,
  });

  final String title;
  final String iconPath;
  final String? route;
  final String? action;
}
