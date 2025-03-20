QT += core gui widgets

CONFIG += c++17 utf8_source

DESTDIR = $$PWD/bin

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui

INCLUDEPATH += $$PWD/uchardet/include
contains(QT_ARCH, i386) {
LIBS += -L$$PWD/uchardet/win32 -luchardet
} else {
LIBS += -L$$PWD/uchardet/win64 -luchardet
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
