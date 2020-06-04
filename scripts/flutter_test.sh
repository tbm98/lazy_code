set -e # abort CI if an error happens
cd $1
flutter packages get
flutter format --set-exit-if-changed --line-length 80 lib test
#flutter analyze --no-current-package lib test/
flutter test --no-pub
# resets to the original state
cd -