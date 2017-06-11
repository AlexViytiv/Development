PROGRAM_NAME="m"
PROGRAM_VERSION="1.0"
CONFG_AC=\
"AC_INIT([$PROGRAM_NAME], $PROGRAM_VERSION)\n
AM_INIT_AUTOMAKE\n
AC_PROG_CC\n
AC_CONFIG_FILES(makefile)\n
AC_OUTPUT\n"

MAKEFILE_AM=\
"bin_PROGRAMS=m\n
m_SOURCES=m.c src/m1/m1.c src/m2/m2.c src/m1/include/m1.h src/m2/include/m2.h src/include/m.h\n"

echo " --------------- Autoconfiguration started ---------------"
# Generation of configure file
echo -en $CONFG_AC>configure.ac
# Creation of aclocal.m4 file and autom4te.cache directory(working)
aclocal
# Creation of configure script
autoconf
# Generation of automake configure file - makefile.am
echo -en $MAKEFILE_AM>makefile.am 
# Creation of makefile.in and links : decomp, install, missing
# without standart documentation files
automake --add-missing --foreign 
# Creation of result makefile
./configure
# Running make and build a project
make
# Creation of program 
#make install
echo " --------------- Autoconfiguration finished ---------------"
# Cleaning directory
rm -rf autom4te.cache compile aclocal.m4 config.log config.status configure \
	configure.ac depcomp install-sh makefile makefile.am makefile.in missing


