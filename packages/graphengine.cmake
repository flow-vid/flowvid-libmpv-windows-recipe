ExternalProject_Add(graphengine
    GIT_REPOSITORY https://github.com/sekrit-twc/graphengine.git
    GIT_TAG 7bb77a5c062c610e7f44df6a59155cc3ab3e452a  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    GIT_SUBMODULES ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(graphengine)
cleanup(graphengine install)
