//
//    win_rtl_pybemacs.cpp
//
//    All the windows support functions for emacs live in here
//
#include <emacs.h>

#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
static EmacsInitialisation emacs_initialisation( __DATE__ " " __TIME__, THIS_FILE );

#include <stdlib.h>
#include <stdio.h>
#include <windows.h>


int win_emacs_quit;
int is_windows_nt;

unsigned long main_thread_id;

void EmacsInitialisation::os_specific_init()
{
}

void _dbg_msg( const EmacsString &msg )
{
    int call_depth = _dbg_fn_trace::callDepth();
    EmacsString msg2;

    if( call_depth < 40 )
    {
        while( call_depth > 0 )
        {
            msg2.append( "| " );
            call_depth--;
        }
    }
    else
    {
        msg2.append( FormatString( "[%d] | " ) << call_depth );
    }

    msg2.append( msg );
    msg2.append("\n");
    // and log to debug terminal
    DebugPrintf( msg2 );
}

void DebugPrintf( const EmacsString &text )
{
    EmacsString buf( text );

    if( buf[-1] != '\n' )
        buf.append( "\n" );

    //OutputDebugString( buf );
}

#ifdef _DEBUG
void _emacs_assert( const char *exp, const char *file, unsigned line )
{
    _assert( exp, file, line );

}
#endif
void emacs_sleep( int milli_seconds )
{
    //Sleep( milli_seconds );
}

void wait_abit( void )
{
}

unsigned char *get_tmp_path(void)
{
    static unsigned char tmp_path[MAXPATHLEN];

#if defined(WIN32)
    DWORD len;

    len = GetTempPath( sizeof( tmp_path ), s_str(tmp_path));
#elif defined( vms )
    _str_cpy( tmp_buf, "sys$scratch:");
#else
#error "Need a temp path"
#endif
    return tmp_path;
}

EmacsString get_config_env( const EmacsString &name )
{
    char *env = getenv( name.sdata() );
    if( env == NULL )
        env = "";
    return env;
}

int put_config_env( const EmacsString &name, const EmacsString &value )
{
    //putenv( name.sdata(), value.sdata() );
    return 0;
}

EmacsString get_device_name_translation( const EmacsString &name )
{
    char *env = getenv( name.sdata() );
	if( env == NULL )
        env = "";
    return env;
}

int get_file_parsing_override( const char *disk, int def_override )
{
    return def_override;
}

void debug_invoke(void)
{
    return;
}

void debug_exception(void)
{
    return;
}


void fatal_error( int code )
{
    printf("\nFatal Error %d\n", code );
    exit(1);
}

#if DBG_SER
void debug_SER(void)
{ return; }
#endif

#if defined(WIN32)
#if !defined(MAX_USERNAME_LENGTH)
# define MAX_USERNAME_LENGTH 32
#endif


EmacsString users_login_name()
{
    char user_name_buf[MAX_USERNAME_LENGTH];
    DWORD buf_size = sizeof( user_name_buf );

    if( !GetUserName( user_name_buf, &buf_size ) )
        return EmacsString::null;
    else
        return EmacsString( user_name_buf );
}

#elif defined(_MSDOS)
char *user_login_name( char * i )
{
    return NULL;
}
#else
#error "Need cuserid logic..."
#endif

EmacsString get_user_full_name()
{
#if defined(WIN32)
    char users_full_name[MAX_USERNAME_LENGTH];
    DWORD size = sizeof( users_full_name );
    users_full_name[0] = '\0';
    GetUserName( users_full_name, &size );
    return EmacsString( users_full_name );
#endif
}

EmacsString get_system_name()
{
#if defined(WIN32)
    char system_name[MAX_COMPUTERNAME_LENGTH+1];
    DWORD size = MAX_COMPUTERNAME_LENGTH;
    system_name[0] = '\0';
    GetComputerName( system_name, &size );
    return EmacsString( system_name );
#endif
}


int interlock_dec( volatile int *counter )
{
    return InterlockedDecrement( (long *)counter );
}

int interlock_inc( volatile int *counter )
{
    return InterlockedIncrement( (long *)counter );
}

void conditional_wake(void)
{
    return;
}

int elapse_time()
{
    return GetTickCount();
}

EmacsDateTime EmacsDateTime::now(void)
{
    EmacsDateTime now;

    SYSTEMTIME sys_time;
    FILETIME file_time;

    GetSystemTime( &sys_time );
    SystemTimeToFileTime( &sys_time, &file_time );

    // a file time is in 100nS units
    now.time_value = double( file_time.dwHighDateTime );
    now.time_value *= 65536;
    now.time_value *= 65536;
    now.time_value += double( file_time.dwLowDateTime );
    now.time_value /= 10000000.0;
    return now;
}

EmacsString EmacsDateTime::asString(void) const
{
    double time( time_value );

    time *= 10000000.0;
    double low_16 = fmod( time, double(65536) );
    time = time / 65536;
    double high_16 = fmod( time, double(65536) );
    time = time / 65536;

    FILETIME file_time;
    file_time.dwLowDateTime = int(high_16) << 16;
    file_time.dwLowDateTime |= int(low_16);
    file_time.dwHighDateTime = int(time);

    FILETIME local_file_time;
    FileTimeToLocalFileTime( &file_time, &local_file_time );

    SYSTEMTIME sys_time;
    FileTimeToSystemTime( &local_file_time, &sys_time );

    return FormatString("%4d-%2d-%2d %2d:%2d:%2d.%3.3d")
        << sys_time.wYear << sys_time.wMonth << sys_time.wDay
        << sys_time.wHour << sys_time.wMinute << sys_time.wSecond << sys_time.wMilliseconds;
}


static void (*timeout_handle)(void);

void time_schedule_timeout( void (*time_handle_timeout)(void), const EmacsDateTime &time )
{
    timeout_handle = time_handle_timeout;

    EmacsDateTime now( EmacsDateTime::now() );
    double d_delta = time.asDouble() - now.asDouble();
    // convert from Seconds units to mS units
    d_delta *= 1000.0;
    int i_delta = int(d_delta);
    // just in case it took a while to ask
    if( i_delta < 1 )
        // force to a positive delta
        i_delta = 100;

    // QQQ how to implement

    //    start the timer
    //UINT status = theApp.m_pMainWnd->SetTimer( 'A', i_delta, NULL );
    //if( status == 0 )
    //{
    //    TRACE("Failed to allocate timer\n");
    //    return;
    //}
}

void time_cancel_timeout(void)
{
    // QQQ how to implement
    //theApp.m_pMainWnd->KillTimer( 'A' );
}

EmacsString os_error_code( unsigned int code )
{
    char msg[1024];

    int size = FormatMessage
        (
        FORMAT_MESSAGE_FROM_SYSTEM,
        NULL,
        code,
        MAKELANGID( LANG_NEUTRAL, SUBLANG_DEFAULT ),
        (LPTSTR) &msg,
        sizeof( msg ) - 1,
        NULL
        );
    if( size == 0 )
        return EmacsString( FormatString( "Win32 error code: 0x%x" ) << code );

    // lose a trailing \r\n
    if( size > 0 && msg[size-1] == '\n' )
        size--;
    if( size > 0 && msg[size-1] == '\r' )
        size--;

    msg[size] = 0;

    return EmacsString( FormatString( "%s (0x%x)" ) << EmacsString(msg) << code );
}