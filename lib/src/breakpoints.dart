/// Default breakpoints (customizable by user)
class AdaptiveBreakpoints {
  static const double mobile = 600; // phones
  static const double tablet = 1024; // tablets
  // anything >= tablet = desktop
}

enum AdaptiveLayoutType { mobile, tablet, desktop }
