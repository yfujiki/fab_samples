enum ButtonType { small, standard, large, extended }

extension Title on ButtonType {
  String get title {
    switch (this) {
      case ButtonType.large:
        return "Large";
      case ButtonType.standard:
        return "Standard";
      case ButtonType.small:
        return "Small";
      case ButtonType.extended:
        return "Extended";
    }
  }
}
