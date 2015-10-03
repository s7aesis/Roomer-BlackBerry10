# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/AppCover.qml) \
        $$quote($$BASEDIR/assets/BBM.qml) \
        $$quote($$BASEDIR/assets/HelpSheet.qml) \
        $$quote($$BASEDIR/assets/Home.qml) \
        $$quote($$BASEDIR/assets/Invoke.qml) \
        $$quote($$BASEDIR/assets/SettingsSheet.qml) \
        $$quote($$BASEDIR/assets/Spinners.qml) \
        $$quote($$BASEDIR/assets/Toasts.qml) \
        $$quote($$BASEDIR/assets/controls/NetworkActivity.qml) \
        $$quote($$BASEDIR/assets/images/background.png) \
        $$quote($$BASEDIR/assets/images/bbm.png) \
        $$quote($$BASEDIR/assets/images/bbworld.png) \
        $$quote($$BASEDIR/assets/images/cover.png) \
        $$quote($$BASEDIR/assets/images/filepicker.png) \
        $$quote($$BASEDIR/assets/images/get.png) \
        $$quote($$BASEDIR/assets/images/home.png) \
        $$quote($$BASEDIR/assets/images/icon.png) \
        $$quote($$BASEDIR/assets/images/invite.png) \
        $$quote($$BASEDIR/assets/images/post.png) \
        $$quote($$BASEDIR/assets/images/share.png) \
        $$quote($$BASEDIR/assets/images/spinner.png) \
        $$quote($$BASEDIR/assets/images/splash-1280x720.png) \
        $$quote($$BASEDIR/assets/images/splash-1280x768.png) \
        $$quote($$BASEDIR/assets/images/splash-720x720.png) \
        $$quote($$BASEDIR/assets/images/toast.png) \
        $$quote($$BASEDIR/assets/images/update.png) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/requestinfo.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/RequestHeaders.cpp) \
        $$quote($$BASEDIR/src/activeFrameQML.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/bbm/BBMHandler.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/RequestHeaders.hpp) \
        $$quote($$BASEDIR/src/activeFrameQML.h) \
        $$quote($$BASEDIR/src/applicationui.hpp) \
        $$quote($$BASEDIR/src/bbm/BBMHandler.hpp) \
        $$quote($$BASEDIR/src/secrets.hpp)
}

INCLUDEPATH += $$quote($$BASEDIR/src/bbm) \
    $$quote($$BASEDIR/src)

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../src/bbm/*.c) \
        $$quote($$BASEDIR/../src/bbm/*.c++) \
        $$quote($$BASEDIR/../src/bbm/*.cc) \
        $$quote($$BASEDIR/../src/bbm/*.cpp) \
        $$quote($$BASEDIR/../src/bbm/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/controls/*.qml) \
        $$quote($$BASEDIR/../assets/controls/*.js) \
        $$quote($$BASEDIR/../assets/controls/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)
