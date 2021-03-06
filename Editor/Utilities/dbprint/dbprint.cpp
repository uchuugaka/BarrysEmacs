#include <emacsutl.h>
#include <stdio.h>
#include <stdlib.h>
#ifdef __unix__
#include <unistd.h>
#else
#include <io.h>
#endif
#include <emobject.h>
#include <emstring.h>
#include <emstrtab.h>
#include <ndbm.h>

int main(int argc,char **argv)
{
    database db;

    if (argc != 3)
    {
        printf ("Usage: %s database key\n", argv[0]);
        return 1;
    }

    if( !db.open_db( argv[1], 1 ) )
    {
        printf ("Data base not found\n");
        return 1;
    }

    EmacsString contents;
    if( db.get_db( argv[2], contents ) < 0)
    {
        printf ("Not found\n");
    }
    else
    {
        write( 1, contents.utf8_data(), contents.utf8_data_length() );
    }

    return 0;
}
