vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skaginn3x/framework
    REF "af4e47b788e90f4d5bea0b25047c5e725ecbc383"
    SHA512 b338b8216f3ab5e1cdee17e5d2de5ef51789dfc54cb1335d8910024ffce50a802addbca4003e08549846c60fa259882637230900505606a670029ab7ca9bcf4f
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
      -DBUILD_EXES=OFF
      -DBUILD_TESTING=OFF
      -DBUILD_DOCS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME tfc)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
