ExternalProject_Add(nvcodec-headers
    GIT_REPOSITORY https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
    GIT_TAG 1b5a81ada8874efb2af0534ffe74049c557e212d  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ${MAKE} -C <SOURCE_DIR>
        PREFIX=${MINGW_INSTALL_PREFIX}
        install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(nvcodec-headers)
cleanup(nvcodec-headers install)
