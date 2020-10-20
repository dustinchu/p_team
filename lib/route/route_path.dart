class RoutePath {
  final int id;
  final bool isUnknown;
  final String pageID;

  RoutePath.home()
      : id = null,
        isUnknown = false,
        pageID = "";

  RoutePath.details(this.id)
      : isUnknown = false,
        pageID = "";

  RoutePath.unknown()
      : id = null,
        isUnknown = true,
        pageID = "";

  RoutePath.page(this.pageID)
      : id = null,
        isUnknown = false;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;

  bool get isPageId => pageID != "";
}
