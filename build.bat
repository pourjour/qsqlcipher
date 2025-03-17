@echo off
echo Setting up the Visual Studio environment for x64...
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

echo Cleaning up the build directory...
if exist C:\Dev\qsqlcipher-qt5\build64 rmdir /s /q C:\Dev\qsqlcipher-qt5\build64
mkdir C:\Dev\qsqlcipher-qt5\build64

echo Building libtomcrypt for x64...
cd C:\Dev\qsqlcipher-qt5\3rdparty\libtomcrypt
nmake -f makefile.msvc clean
nmake -f makefile.msvc CFLAGS="/DLT_MSVC /Ox /W3 /Dx64"

echo Configuring the project...
cd C:\Dev\qsqlcipher-qt5\build64
qmake ../qsqlcipher.pro

echo Building the project...
nmake

echo Build complete!
pause 