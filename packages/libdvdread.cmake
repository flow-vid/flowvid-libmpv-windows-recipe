ExternalProject_Add(libdvdread
    DEPENDS libdvdcss
    GIT_REPOSITORY https://code.videolan.org/videolan/libdvdread.git
    GIT_TAG 0dea3eb326297110889c34030c33b928a85c91ea  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} sed -i [['/^if import/,/endif/d']] <SOURCE_DIR>/meson.build
    COMMAND ${EXEC} meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Dlibdvdcss=enabled
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libdvdread)
force_meson_configure(libdvdread)
cleanup(libdvdread install)
