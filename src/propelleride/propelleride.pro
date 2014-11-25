include( ../../propelleride.pri )

TEMPLATE = app
TARGET = propelleride
target.path = $${PREFIX}/bin
INSTALLS += target

LIBS += -L$${OUT_PWD}/../qext/ -lqext
LIBS += -L$${OUT_PWD}/../spinzip/ -lspinzip

SOURCES += main.cpp\
    mainwindow.cpp \
    $$files(mainwindow/*.cpp) \
    StatusDialog.cpp \
    highlighter.cpp \
    treemodel.cpp \
    treeitem.cpp \
    EzBuilder.cpp \
    SpinBuilder.cpp \
    PortListener.cpp \
    Preferences.cpp \
    PortConnectionMonitor.cpp \
    editor.cpp \
    highlightSpin.cpp \
    SpinParser.cpp \
    terminal.cpp \
    console.cpp \
    termprefs.cpp

HEADERS  += mainwindow.h \
    StatusDialog.h \
    highlighter.h \
    treemodel.h \
    treeitem.h \
    EzBuilder.h \
    SpinBuilder.h \
    PortListener.h \
    Preferences.h \
    PortConnectionMonitor.h \
    editor.h \
    highlightSpin.h \
    SpinParser.h \
    colors.h \
    Sleeper.h \
    terminal.h \
    console.h \
    termprefs.h \

OTHER_FILES +=

FORMS += \
    TermPrefs.ui

RESOURCES += \
    icons/icons.qrc \
    fonts/fonts.qrc

unix {
    LIBS            += -lz
}
macx {
    LIBS            += -framework IOKit -framework CoreFoundation
}
win32 {
    LIBS            += -lsetupapi
    LIBS            += -L$$PWD -lz
}

# ENABLE_AUTO_ENTER turns on AUTO-INDENT
DEFINES += ENABLE_AUTO_ENTER
# SPIN_AUTOCOMPLETE turns on spinny-sense
DEFINES += SPIN_AUTOCOMPLETE
