import 'package:path_provider/path_provider.dart';

enum Directory {
  FONT,
}

extension DirectoryDir on Directory {
  Future<String> get path async {
    switch (this) {
      case Directory.FONT:
        final directory = await getApplicationDocumentsDirectory();
        return directory.path + '/fonts';
      default:
        final directory = await getApplicationDocumentsDirectory();
        return directory.path;
    }
  }
}
