ExternalProject_Add(angle-headers
    GIT_REPOSITORY https://github.com/google/angle.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_TAG c073400b3d7ccf16219dc458b008ed9d4f3aa8a2  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone include/EGL include/KHR"
    GIT_SUBMODULES ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy_directory <SOURCE_DIR>/include/EGL ${MINGW_INSTALL_PREFIX}/include/EGL
            COMMAND ${CMAKE_COMMAND} -E copy_directory <SOURCE_DIR>/include/KHR ${MINGW_INSTALL_PREFIX}/include/KHR
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(angle-headers)
cleanup(angle-headers install)
