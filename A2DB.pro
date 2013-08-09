#-------------------------------------------------
#
# Project created by QtCreator 2013-08-06T09:09:25
#
#-------------------------------------------------


#QT       -= core
QT       -= core gui network


#greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = a2db
TEMPLATE = app
DEFINES += ADB_HOST
DEFINES += ANDROID_SMP
DEFINES += FAKE_LOG_DEVICE


linux:DEFINES += HAVE_PTHREADS
linux: DEFINES += HAVE_TERMIO_H

#CCFLAG += -O2 -Wall -Wno-unused-parameter

INCLUDEPATH += adb/
INCLUDEPATH += include/

#Both mingw and GCC needs this
DEFINES += _GNU_SOURCE

QMAKE_CFLAGS_DEBUG += -Wall -Wno-unused-parameter
QMAKE_CXXFLAGS_DEBUG += -Wall -Wno-unused-parameter
QMAKE_CFLAGS_RELEASE += -O2 -Wall -Wno-unused-parameter

win32 {
  SOURCES += adb/usb_windows.c
  SOURCES += adb/get_my_path_windows.c
  SOURCES += cutils/list.c
  SOURCES += adb/sysdeps_win32.c


  DEFINES +=USE_SYSDEPS_WIN32
  DEFINES += HAVE_WIN32_IPC
  INCLUDEPATH += windows/usb/api
  INCLUDEPATH += prebuilt/openssl/include
  DEFINES +=HAVE_WINSOCK
  DEFINES +=HAVE_WIN32_PROC

  DEFINES += HAVE_PTHREADS
  #DEFINES += HAVE_WIN32_THREADS
  #DEFINES += HAVE_MS_C_RUNTIME
  INCLUDEPATH +=include/ddk


  LIBS += --static "$$_PRO_FILE_PWD_/prebuilt/usb/AdbWinApi.a"
  LIBS += --static -L"$$_PRO_FILE_PWD_/prebuilt/openssl" -lssl -lcrypto

  LIBS +=  -lws2_32 -lgdi32 -lz \
    -Wl,-subsystem,console  \
    -lglu32
}


#-Wl,-Bdynamic -Wl,-Bstatic



linux {
  SOURCES += adb/usb_linux.c
  SOURCES += adb/get_my_path_linux.c
  SOURCES += adb/fdevent.c
  LIBS +=  --static -lrt -lpthread -lcrypto -lz -ldl
  DEFINES += HAVE_FORKEXEC
  DEFINES += WORKAROUND_BUG6558362  
  DEFINES += HAVE_SYS_UIO_H
  DEFINES += HAVE_STRNDUP
}

SOURCES += adb/console.c \
        adb/transport.c \
        adb/transport_local.c \
        adb/transport_usb.c \
        adb/commandline.c \
        adb/adb_client.c \
        adb/adb_auth_host.c \
        adb/services.c \
        adb/file_sync_client.c \
        adb/utils.c \
        adb/adb.c \
        adb/usb_vendors.c \
        adb/adb_sockets.c



#Sources for LibCutils
linux{
 SOURCES+= cutils/array.c \
    cutils/hashmap.c \
    cutils/atomic.c \
    cutils/native_handle.c \
    cutils/buffer.c \
    cutils/socket_local_client.c \
    cutils/socket_local_server.c \
    cutils/sockets.c \
    cutils/config_utils.c \
    cutils/cpu_info.c \
    cutils/list.c \
    cutils/open_memstream.c \
    cutils/strdup16to8.c \
    cutils/strdup8to16.c \
    cutils/record_stream.c \
    cutils/process_name.c \
    cutils/properties.c \
    cutils/qsort_r_compat.c \
    cutils/threads.c \
    cutils/sched_policy.c \
    cutils/iosched_policy.c \
    cutils/str_parms.c \
    cutils/ashmem-host.c \
    cutils/socket_inaddr_any_server.c \
    cutils/socket_loopback_server.c \
    cutils/socket_network_client.c \
    cutils/socket_loopback_client.c \
    cutils/load_file.c
}

SOURCES += \


#win32 {
#    SOURCES +=  \
#        cutils/abort_socket.c \
#        cutils/fs.c \
#        cutils/selector.c \
#        cutils/multiuser.c \
#        cutils/zygote.c
#}


#sources for ZipFile
SOURCES += zipfile/centraldir.c \
        zipfile/zipfile.c


#for LibLog
SOURCES += log/logd_write.c \
        log/fake_log_device.c

!win32 {
 SOURCES += log/logprint.c \
        log/event_tag_map.c
}


SOURCES += main.cpp

HEADERS  +=

FORMS    +=
