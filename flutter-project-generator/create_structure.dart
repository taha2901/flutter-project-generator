import 'dart:io';

void main() async {
  print('🚀 بدء إنشاء هيكل المشروع...\n');

  // المسار الأساسي lib
  final libPath = '${Directory.current.path}/lib';

  // هيكل المجلدات والملفات
  final structure = {
    'core': {
      'networking': [
        'api_constants.dart',
        'api_error_handler.dart',
        'api_error_model.dart',
        'api_result.dart',
        'api_services.dart',
        'dio_factory.dart',
      ],
      'routing': [
        'routes.dart',
        'app_router.dart',
      ],
      'theming': [
        'colors.dart',
        'styles.dart',
        'font_weight_helper.dart',
      ],
      'widgets': [
        'app_text_form_field.dart',
        'app_text_button.dart',
        'custom_bottom_nav_bar.dart',
        'custom_loading.dart',
        'custom_dialog.dart',
      ],
      'helpers': [
        'shared_pref_helper.dart',
        'validators.dart',
        'date_helper.dart',
        'extensions.dart',
      ],
      'constants': [
        'app_constants.dart',
        'app_strings.dart',
        'assets_constants.dart',
      ],
      'di': [
        'injection.dart',
      ],
    },
    'features': {
      'auth': {
        'data': {
          'models': [
            'user_model.dart',
          ],
          'repo': [
            'auth_repo.dart',
          ],
        },
        'logic': [
          'auth_cubit.dart',
          'auth_states.dart',
        ],
        'ui': {
          'screens': [
            'login_screen.dart',
            'register_screen.dart',
          ],
          'widgets': [
            'login_form.dart',
            'register_form.dart',
          ],
        },
      },
      'home': {
        'data': {
          'models': [],
          'repo': [
            'home_repo.dart',
          ],
        },
        'logic': [
          'home_cubit.dart',
          'home_states.dart',
        ],
        'ui': {
          'screens': [
            'home_screen.dart',
          ],
          'widgets': [],
        },
      },
      'profile': {
        'data': {
          'models': [
            'profile_model.dart',
          ],
          'repo': [
            'profile_repo.dart',
          ],
        },
        'logic': [
          'profile_cubit.dart',
          'profile_states.dart',
        ],
        'ui': {
          'screens': [
            'profile_screen.dart',
          ],
          'widgets': [],
        },
      },
    },
  };

  // دالة لإنشاء المجلدات والملفات
  void createStructure(String basePath, Map<String, dynamic> structure) {
    structure.forEach((key, value) {
      final currentPath = '$basePath/$key';

      if (value is List) {
        // إنشاء المجلد
        final dir = Directory(currentPath);
        if (!dir.existsSync()) {
          dir.createSync(recursive: true);
          print('✅ تم إنشاء المجلد: $currentPath');
        }

        // إنشاء الملفات
        for (var file in value) {
          final filePath = '$currentPath/$file';
          final fileObj = File(filePath);
          if (!fileObj.existsSync()) {
            fileObj.createSync(recursive: true);
            print('  📄 تم إنشاء الملف: $file');
          }
        }
      } else if (value is Map) {
        // إنشاء المجلد
        final dir = Directory(currentPath);
        if (!dir.existsSync()) {
          dir.createSync(recursive: true);
          print('✅ تم إنشاء المجلد: $currentPath');
        }

        // استدعاء تكراري للمجلدات الفرعية
        createStructure(currentPath, value as Map<String, dynamic>);
      }
    });
  }

  // إنشاء الهيكل
  createStructure(libPath, structure);

  print('\n✨ تم إنشاء هيكل المشروع بنجاح!');
  print('📁 المجلدات: core, features');
  print('📄 جميع الملفات تم إنشاؤها');
  print('\n📊 إحصائيات:');
  print('   - Core modules: 7');
  print('   - Features: 3 (auth, home, profile)');
  print('   - Total files: 40+');
}
