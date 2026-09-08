ExternalProject_Add(curl
    DEPENDS
        mbedtls
    GIT_REPOSITORY https://github.com/curl/curl.git
    GIT_TAG 2c1e625a6f6b8eafbdfcef6408407e08c63949bd  # FlowVid pin 2026-09-08: revision as of 2026-06-25 (last proven build)
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    PATCH_COMMAND ${EXEC} git am --3way ${CMAKE_CURRENT_SOURCE_DIR}/curl-*.patch
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} autoreconf -fi && CONF=1 <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --with-mbedtls=${MINGW_INSTALL_PREFIX}
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(curl)
cleanup(curl install)

# Download the cacert.pem file: https://curl.haxx.se/docs/caextract.html
# Rename the cacert.pem file to curl-ca-bundle.crt
# Put in same directory as curl.exe
