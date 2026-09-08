ExternalProject_Add(libass
    DEPENDS
        harfbuzz
        freetype2
        fribidi
        libiconv
        fontconfig
        libunibreak
    GIT_REPOSITORY https://github.com/libass/libass.git
    GIT_TAG 4a05d8127f525943ebf45fdc6497c9e665947f0d  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Dfontconfig=enabled
        -Ddirectwrite=enabled
        -Dasm=enabled
        -Dlibunibreak=enabled
        -Dtest=disabled
        -Dcompare=disabled
        -Dprofile=disabled
        -Dfuzz=disabled
        -Dcheckasm=disabled
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libass)
force_meson_configure(libass)
cleanup(libass install)
