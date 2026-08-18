MARYOS Squirrel.Windows update feed

This folder must contain the exact files produced by Electron Forge on Windows:

  RELEASES
  MARYOS-<version>-full.nupkg
  FEED_INFO.json (MARYOS helper metadata)

Do not invent RELEASES manually. Run BUILD_WINDOWS.bat or PREPARE_NATIVE_UPDATE_FEED.bat on Windows after a successful Forge make.
