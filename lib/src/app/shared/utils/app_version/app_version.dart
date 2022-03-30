class AppVersion {
  final String _version;

  const AppVersion(this._version);

  /// Example: v1.0.0(118)
  String get versionAndBuild {
    if (_version.isEmpty) return '';
    final splitted = _version.split('+');
    return 'v${splitted.first}(${splitted.last})';
  }
}
