# We can't create the same interface imported target multiple times, CMake will complain if we do
# that. This can happen if the find_package call is done in multiple different subdirectories.
if(TARGET WrapHarfbuzz::WrapHarfbuzz)
    set(WrapHarfbuzz_FOUND ON)
    return()
endif()

set(WrapHarfbuzz_FOUND OFF)

find_package(harfbuzz)

# Gentoo has some buggy version of a harfbuzz Config file. Check if include paths are valid.
set(__harfbuzz_target_name "harfbuzz::harfbuzz")
if(harfbuzz_FOUND AND TARGET "${__harfbuzz_target_name}")
    get_property(__harfbuzz_include_paths TARGET "${__harfbuzz_target_name}"
                                          PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
    foreach(__harfbuzz_include_dir ${__harfbuzz_include_paths})
        if(NOT EXISTS "${__harfbuzz_include_dir}")
            # Must be the broken Gentoo harfbuzzConfig.cmake file. Try to use pkg-config instead.
            set(__harfbuzz_broken_config_file TRUE)
            break()
        endif()
    endforeach()
endif()

if(__harfbuzz_broken_config_file)
    find_package(PkgConfig)

    pkg_check_modules(harfbuzz harfbuzz IMPORTED_TARGET)
    set(__harfbuzz_target_name "PkgConfig::harfbuzz")

    if (NOT TARGET "${__harfbuzz_target_name}")
        set(harfbuzz_FOUND 0)
    endif()
endif()

if(TARGET "${__harfbuzz_target_name}")
    set(WrapHarfbuzz_FOUND ON)

    add_library(WrapHarfbuzz::WrapHarfbuzz INTERFACE IMPORTED)
    target_link_libraries(WrapHarfbuzz::WrapHarfbuzz INTERFACE ${__harfbuzz_target_name})
endif()
unset(__harfbuzz_target_name)
unset(__harfbuzz_include_dir)
unset(__harfbuzz_broken_config_file)
