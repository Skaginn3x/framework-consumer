vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skaginn3x/framework
    REF "268d08e9403eaad8f373ece871a3810c45352997"
    SHA512 5d03f9b55c258d363671df78fc31c8c960bee3b640ce172b36106a61e81d6624841ec45de63ed5af124b9c1c7821a909438ab1fad67b6dce60f95f75c5fa2733
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
      -DBUILD_EXES=OFF
      -DBUILD_TESTING=OFF
      -DBUILD_DOCS=OFF
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
