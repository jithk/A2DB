

extern "C"
{
#include "sysdeps.h"
}
#include "adb.h"
#include "adb_auth.h"
#include "stdio.h"


#define  TRACE_TAG  TRACE_ADB

#ifndef __WIN32
extern "C" void show_cursor(int show);

void signal_handler(int sig)
{
    /* enable the cursor back before quitting */
    show_cursor(1);
    printf("\n");
    exit(sig);
}

#endif




int main(int argc, char *argv[])
{

#ifndef __WIN32
    signal(SIGINT,&signal_handler);
    signal(SIGABRT, &signal_handler);
    signal(SIGTERM, &signal_handler);
#endif

    adb_sysdeps_init();
    adb_trace_init();

//    D("Handling commandline()\n");
    return adb_commandline(argc - 1, argv + 1);
}



