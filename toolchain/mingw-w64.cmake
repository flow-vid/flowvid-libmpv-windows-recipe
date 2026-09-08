ExternalProject_Add(mingw-w64
    GIT_REPOSITORY https://github.com/mingw-w64/mingw-w64.git
    GIT_TAG 31bd54ab7d5fe03c67ed2bb1a57e531b9c7f8cc4
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(mingw-w64)
get_property(MINGW_SRC TARGET mingw-w64 PROPERTY _EP_SOURCE_DIR)
