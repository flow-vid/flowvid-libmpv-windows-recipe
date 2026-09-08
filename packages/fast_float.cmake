ExternalProject_Add(fast_float
    GIT_REPOSITORY https://github.com/fastfloat/fast_float.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    GIT_TAG 8ec5d236e2a9bc6b89a191212920c2237144f936  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(fast_float)
cleanup(fast_float install)
