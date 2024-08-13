extension StringNullableExt on String? {
  String toStringNullParse() => this ?? 'N/A';
}
