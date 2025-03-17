# Qt SQL driver plugin for SQLCipher ( for Qt 6 )
this is a fork for this repo: https://github.com/sjemens/qsqlcipher-qt5
This branch is for building with Qt version **6.8**.
To build for previous versions choose from the releases the one that
matches the system's Qt version.
See https://github.com/sijk/qt5-sqlcipher to build up to Qt 5.5.x

The sources for this plugin are based on the sqlite plugin from
[qt/qtbase](https://github.com/qt/qtbase/tree/6.4/src/plugins/sqldrivers/sqlite)

## Dependencies

This plugin is using the [SQLCipher](https://github.com/sqlcipher/sqlcipher) for
the encryption of database files. SQLCipher is included in the 3rdparty folder, but
there is also the option to use the system's library. The required libraries are
found by pkg-config. If pkg-config is not available you should edit the qsqlcipher.pro
and set the INCLUDEPATH and LIBS variables.

By default, the cryptography backend is provided by libtomcrypt, also included in the
3rdparty folder. There will also be an option to choose some other backend.


## Build instructions (without the tests)


```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake ../qsqlcipher.pro
make
make install  # most propably with sudo
```

## Build with system's sqlcipher

```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake ../qsqlcipher.pro CONFIG+=system-sqlcipher
make
make install  # most propably with sudo
```

## Building and running the tests

```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake CONFIG+="withTests" ../qsqlcipher.pro
make
# in linux
./tests/qsqlcipher_test
# in windows (MSYS2-mingw) both the debug and release
# versions should have been built by default
# so we will check both of them
./tests/debug/qsqlcihper_test
./tests/release/qsqlcihper_test
# Unless you also want to install the tests change to 
# the lib folder
cd qsqlcipher
sudo make install
```

**Tip:** A quick way to find if the tested plugin is the newly built
and not the one in 'QT_INSTALL_PLUGINS' is to define the QT_DEBUG_PLUGINS
and check the loaded library path.
```bash
QT_DEBUG_PLUGINS=1 ./tests/qsqlcipher_test
```

## Build instructions for Windows using batch file

For Windows users, there's a convenient batch file to build both debug and release versions:

```batch
# Make sure you have Visual Studio 2022 installed
# The batch file assumes Qt is installed and available in PATH
# Run the batch file from the project root directory
build.bat
```

The batch file will:
1. Set up the Visual Studio environment for x64
2. Clean and create a new build directory
3. Build libtomcrypt dependency
4. Configure the project using qmake
5. Build the project

The built files will be in the `build64` directory.

**Note:** Make sure you have the following prerequisites installed:
- Visual Studio 2022 (Community edition or higher)
- Qt 6.8
- Qt tools in your system PATH

**Important:** After building, you need to copy the built DLL files to your Qt plugins directory:
1. Copy `build64/qsqlcipher/debug/qsqlcipherd.dll` to `[Qt Installation Path]/plugins/sqldrivers/` for debug builds
2. Copy `build64/qsqlcipher/release/qsqlcipher.dll` to `[Qt Installation Path]/plugins/sqldrivers/` for release builds

For example, if Qt is installed in `C:\Qt\6.8.2\msvc2019_64`, you would copy the DLLs to:
`C:\Qt\6.8.2\msvc2019_64\plugins\sqldrivers\`

## TODO

Port the *.pro files to CMakeLists.txt files
## CREDITS:
https://github.com/sjemens/qsqlcipher-qt5
## Licenses

For this plugin see [LICENSE](https://github.com/sjemens/qsqlcipher-qt5/blob/6.4/LICENSE) (**LGPLV3**)

[libtomcrypt](https://github.com/libtom/libtomcrypt/blob/develop/LICENSE) (**Public domain**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
