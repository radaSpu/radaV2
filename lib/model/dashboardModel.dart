class RadaContent {
  String platform;
  String subject;
  String imageURL;
  RadaContent({required this.platform, required this.subject, required this.imageURL});
}

List<RadaContent> radacontent = [
  RadaContent(
      platform: 'Information',
      subject: 'Knowledge is power',
      imageURL: 'assets/Information_Icon.png'),
  RadaContent(
      platform: 'Student Counselling',
      subject: 'Free Professional Counselling',
      imageURL: 'assets/Student_Counselling_Icon.png'),
  RadaContent(
      platform: 'Student Forums',
      subject: 'Share with the group',
      imageURL: 'assets/Student_Forum_Icon.png'),
  RadaContent(
      platform: 'Quick Notifications',
      subject: 'Instant notifications',
      imageURL: 'assets/Quick_Notification_Icon.png'),
  RadaContent(
      platform: 'Help',
      subject: 'Location and contacts',
      imageURL: 'assets/HELP_Icon.png'),
  RadaContent(
      platform: 'Student Mentorship',
      subject: 'Mentorship programs',
      imageURL: 'assets/Virtual_Mentorship_Icon.png'),
];
