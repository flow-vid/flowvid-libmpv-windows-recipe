ExternalProject_Add(lcms2
    DEPENDS
        libjpeg
        zlib
    GIT_REPOSITORY https://github.com/mm2/Little-CMS.git
    GIT_TAG 76ffc49448b8bd6aa6a36c1f5869ab318831abb9  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Dfastfloat=true
        -Dthreaded=true
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(lcms2)
force_meson_configure(lcms2)
cleanup(lcms2 install)
