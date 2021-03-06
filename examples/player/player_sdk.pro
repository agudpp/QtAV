########## template for QtAV app project BEGIN ################
greaterThan(QT_MAJOR_VERSION, 4) {
  QT += avwidgets
} else {
  CONFIG += avwidgets
}
#rpath for osx qt4
mac {
  RPATHDIR *= @loader_path/../Frameworks @executable_path/../Frameworks
  QMAKE_LFLAGS_SONAME = -Wl,-install_name,@rpath/
  isEmpty(QMAKE_LFLAGS_RPATH): QMAKE_LFLAGS_RPATH=-Wl,-rpath,
  for(R,RPATHDIR) {
    QMAKE_LFLAGS *= \'$${QMAKE_LFLAGS_RPATH}$$R\'
  }
}
########## template for QtAV app project END ################
################# Add your own code below ###################
COMMON = $$PWD/../common
INCLUDEPATH *= $$COMMON $$COMMON/..
RESOURCES += $$COMMON/theme/theme.qrc
#QMAKE_LFLAGS += -u _link_hack
#SystemParametersInfo
*msvc*: LIBS += -lUser32
DEFINES += BUILD_QOPT_LIB
HEADERS = \
    $$COMMON/common.h \
    $$COMMON/Config.h \
    $$COMMON/qoptions.h \
    $$COMMON/ScreenSaver.h \
    $$COMMON/common_export.h

SOURCES = \
    $$COMMON/common.cpp \
    $$COMMON/Config.cpp \
    $$COMMON/qoptions.cpp

!macx: SOURCES += $$COMMON/ScreenSaver.cpp
macx:!ios {
#SOURCE is ok
    OBJECTIVE_SOURCES += $$COMMON/ScreenSaver.cpp
    LIBS += -framework CoreServices #-framework ScreenSaver
}
include(src.pri)
