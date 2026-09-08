ExternalProject_Add(libva
    GIT_REPOSITORY https://github.com/intel/libva.git
    GIT_TAG ad64eb9b616d1b66afaf4cb9f0ea0b8e0ec1169c  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    PATCH_COMMAND ${EXEC} sed -i "s/shared_library/library/g" va/meson.build
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Denable_docs=false
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
            COMMAND bash -c "rm -rf ${MINGW_INSTALL_PREFIX}/lib/libva*.dll.a"
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libva)
force_meson_configure(libva)
cleanup(libva install)
