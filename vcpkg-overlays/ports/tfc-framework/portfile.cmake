vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skaginn3x/framework
    REF "4fdf1daf4a62a3b0332d870928c8581370059dfd"
    SHA512 0198f03616864b3085c8a33996df8f81b8c47e66cc7271601377abf8191fdadb50f33e0146e19582c60dff033b2e30b504e4aa46a455c599e49cf8fa575a04a7
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
      -DBUILD_EXES=OFF
#      -DBUILD_TESTING=OFF
#      -DCMAKE_TOOLCHAIN_FILE=/opt/vcpkg/scripts/buildsystems/vcpkg.cmake
)

vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
