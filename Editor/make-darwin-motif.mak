#
#	Make file for Darwin BEmacs editor component
#

##################################################################################
#                                                                                #
#                                                                                #
#          Settings                                                              #
#                                                                                #
#                                                                                #
##################################################################################
MOTIF_TOP=$(BUILDER_TOP_DIR)/Imports/openmotif-2.2.3-universal

CC=/usr/bin/gcc -pipe
CXX=/usr/bin/g++ -pipe
cc_flags = -g -D_DEBUG -isysroot /Developer/SDKs/MacOSX10.5.sdk -I/Developer/SDKs/MacOSX10.5.sdk/Developer/Headers/FlatCarbon -IInclude/Unix -IInclude/Common -I$(MOTIF_TOP)/include -I/usr/X11R6/include -c
cpp = $(CXX) -arch i386 -ansi -pedantic -Wall -Wno-long-long -frtti -D__std_cpp__ -D__has_bool__ -DUSING_CARBON
cc = $(CC) -arch i386 -ansi -pedantic -Wall=pthread
cppfilt=c++filt
ldstatic = $(cpp) -g -static -L$(MOTIF_TOP)/lib -L/usr/X11R6/lib
lddynamic = $(cpp) -g -dynamic -Wl,-syslibroot,/Developer/SDKs/MacOSX10.5.sdk -L$(MOTIF_TOP)/lib -L/usr/X11R6/lib
edit_obj=darwin/obj/
edit_exe=darwin/exe/

ld_bintools=$(cpp)
bemacs_libs=-lX11 $(MOTIF_TOP)/lib/libXm.a -lXt -lXmu -lSM -lICE -lXext -lXp -lX11

os_specific_obj_files = \
 $(edit_obj)unix_rtl.o \
 $(edit_obj)unixcomm.o \
 $(edit_obj)ptyopen_bsd.o \
 $(edit_obj)emacs_motif.o \
 $(edit_obj)motif_keys.o \
 $(edit_obj)motifcmd.o \
 $(edit_obj)motiftk.o \
 $(edit_obj)motiftrm.o

os_specific_client_obj_files = \
 $(edit_obj)macgetargv.o

os_specific_client_ld_options = \
 -framework Carbon

#--------------------------------------------------------------------------------
#
#	Target used by developer
#
#--------------------------------------------------------------------------------
all: dynamic

#--------------------------------------------------------------------------------
#
# target used by ridgebuild
#
#--------------------------------------------------------------------------------
install: install_dynamic_images install_bitmaps install_xkeys

include make-common.mak
