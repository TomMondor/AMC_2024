# amc_2024

We win

## Getting Started 🚀

First you need to make sure your flutter is up to date with `flutter upgrade`

Then download all dependencies by running `flutter pub get`

You can then run the app with `flutter run`

## App Icon ©

We may need to change the app icon during the challenge. To help us deal with all the different formats for IOS and android, we added the [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package.

Here is the procedure to update the app Icon:

1) Generate the new icon on the [easyappicon](https://easyappicon.com/) website. You must select `ios + adaptive icon` when downloading the icon.

2) Change the images in the `assets/launcher` folder. For Android, use the images from the `mipmap-xxxhdpi` folder and for IOS use the `iTunesArtwork@2x.png` file. If you need to change the background color, generate a png of the same size as the foreground.

3) Run the command `flutter pub run flutter_launcher_icons`

## Translation

To add translation text, modify the files in the `lib/l10n` folder. When modifying those files, run the `flutter gen-l10n` command.
