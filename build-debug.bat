@echo off
echo Setting up the Visual Studio environment for x64...
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

echo Cleaning up the build directory...
if exist C:\Dev\qsqlcipher-qt5\build64-debug rmdir /s /q C:\Dev\qsqlcipher-qt5\build64-debug
mkdir C:\Dev\qsqlcipher-qt5\build64-debug

echo Building libtomcrypt for x64 in debug mode...
cd C:\Dev\qsqlcipher-qt5\3rdparty\libtomcrypt
nmake -f makefile.msvc clean
:: Use debug flags: /Od for no optimization, /Zi for debug info, /MDd for debug C runtime
nmake -f makefile.msvc CFLAGS="/DLT_MSVC /Od /Zi /W3 /Dx64 /MDd /D_DEBUG"

echo Configuring the project for debug mode...
cd C:\Dev\qsqlcipher-qt5\build64-debug
qmake ../qsqlcipher.pro CONFIG+=debug

echo Building the project in debug mode...
nmake debug

echo Debug build complete!
echo Debug version of qsqlcipher.dll can be found in: C:\Dev\qsqlcipher-qt5\build64-debug\qsqlcipher\debug\
pause 