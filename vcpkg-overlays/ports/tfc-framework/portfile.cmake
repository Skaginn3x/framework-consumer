vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skaginn3x/framework
    REF "5220e47e988480350333dd29e06ce73db3b9bc7f"
    SHA512 bf5481f1143e18534ca55069edb7154d7d56a6d132de919eced54df68eb11be099f7f13fe196eaf52667753fffe6565b7d55c396d7e46fb468920d224eae63ba
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
