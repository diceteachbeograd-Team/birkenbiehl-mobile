class AssistiveProfile {
  const AssistiveProfile({
    required this.hearingAssist,
    required this.visionAssist,
  });

  final bool hearingAssist;
  final bool visionAssist;

  AssistiveProfile copyWith({bool? hearingAssist, bool? visionAssist}) {
    return AssistiveProfile(
      hearingAssist: hearingAssist ?? this.hearingAssist,
      visionAssist: visionAssist ?? this.visionAssist,
    );
  }
}
