vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skaginn3x/framework
    REF "ab01235fa7ff5c8a4d829ee61a07d17e380e1cbc"
    SHA512 6ef3bbd56e305d281bf25321fc79a2d5169086649c10e5231114a6a9545380963ad3525b73887325386599f625dd9bae5cce031e16ffccf5d178b9993453956a
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
      -DBUILD_EXES=ON
      -DBUILD_TESTING=OFF
      -DBUILD_DOCS=OFF
)

vcpkg_cmake_install(ADD_BIN_TO_PATH)
vcpkg_cmake_config_fixup(PACKAGE_NAME tfc)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
