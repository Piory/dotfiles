local flutter_tools = require('flutter-tools')
flutter_tools.setup({})
flutter_tools.setup_project({
  {
    name = 'Localhost',
    target = 'lib/main.dart',
    cwd = 'apps/r4b_app',
    dart_define_from_file = 'dart_defines/local.json',
  },
  {
    name = 'Development',
    target = 'lib/main.dart',
    cwd = 'apps/r4b_app',
    dart_define_from_file = 'dart_defines/dev-development.json',
  },
  {
    name = 'Production',
    target = 'lib/main.dart',
    cwd = 'apps/r4b_app',
    dart_define_from_file = 'dart_defines/prd-production.json',
  },
})
