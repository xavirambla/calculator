flutter devices &  echo "Test using Android-x86 "  & flutter test test/all_test.dart -d 'android-x86' & echo "Test using windows" & flutter test test/all_test.dart -d 'windows'  & echo "Test using windows-x64 " & flutter test test/all_test.dart -d 'windows-x64' & echo "Test using chrome " & flutter test test/all_test.dart -d 'chrome' & echo "Test using edge " & flutter test test/all_test.dart -d 'edge' & echo "Test using web-javascript " & flutter test test/all_test.dart -d 'web-javascript'

