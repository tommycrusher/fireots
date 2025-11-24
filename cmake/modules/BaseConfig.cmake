cmake_minimum_required(VERSION 3.22 FATAL_ERROR)

# *****************************************************************************
# CMake Features
# *****************************************************************************
set(CMAKE_CXX_STANDARD 20)
set(GNUCXX_MINIMUM_VERSION 11)
set(MSVC_MINIMUM_VERSION "19.32")
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
set(Boost_NO_WARN_NEW_VERSIONS ON)

# Make will print more details
set(CMAKE_VERBOSE_MAKEFILE OFF)

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# *****************************************************************************
# Packages / Libs
# *****************************************************************************
find_package(CURL CONFIG REQUIRED)
find_package(GMP REQUIRED)
find_package(LuaJIT REQUIRED)
find_package(MySQL REQUIRED)
find_package(Protobuf REQUIRED)
find_package(Threads REQUIRED)
find_package(ZLIB REQUIRED)
find_package(absl CONFIG REQUIRED)
find_package(asio CONFIG REQUIRED)
find_package(eventpp CONFIG REQUIRED)
find_package(magic_enum CONFIG REQUIRED)
if(FEATURE_METRICS)
    find_package(opentelemetry-cpp CONFIG REQUIRED)
    find_package(prometheus-cpp CONFIG REQUIRED)
endif()
find_package(mio REQUIRED)
find_package(pugixml CONFIG REQUIRED)
find_package(spdlog REQUIRED)
find_package(unofficial-argon2 CONFIG REQUIRED)
find_package(unofficial-libmariadb CONFIG REQUIRED)

find_path(BOOST_DI_INCLUDE_DIRS "boost/di.hpp")
find_path(PARALLEL_HASHMAP_INCLUDE_DIRS "parallel_hashmap/phmap.h")
find_path(ATOMIC_QUEUE_INCLUDE_DIRS "atomic_queue/atomic_queue.h")

# *****************************************************************************
# Sanity Checks
# *****************************************************************************
# === GCC Minimum Version ===
if (CMAKE_COMPILER_IS_GNUCXX)
    message("-- Compiler: GCC - Version: ${CMAKE_CXX_COMPILER_VERSION}")
    if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS GNUCXX_MINIMUM_VERSION)
        message(FATAL_ERROR "GCC version must be at least ${GNUCXX_MINIMUM_VERSION}!")
    endif()
endif()

# === Minimum required version for visual studio ===
if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    message("-- Compiler: Visual Studio - Version: ${CMAKE_CXX_COMPILER_VERSION}")
    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS MSVC_MINIMUM_VERSION)
        message(FATAL_ERROR "Visual Studio version must be at least ${MSVC_MINIMUM_VERSION}")
    endif()
endif()

# *****************************************************************************
# Sanity Checks
# *****************************************************************************
option(TOGGLE_BIN_FOLDER "Use build/bin folder for generate compilation files" ON)
option(OPTIONS_ENABLE_OPENMP "Enable Open Multi-Processing support." ON)
option(DEBUG_LOG "Enable Debug Log" OFF)
option(ASAN_ENABLED "Build this target with AddressSanitizer" OFF)
option(BUILD_STATIC_LIBRARY "Build using static libraries" OFF)
option(SPEED_UP_BUILD_UNITY "Compile using build unity for speed up build" OFF)
option(USE_PRECOMPILED_HEADER "Compile using precompiled header" ON)

# === ASAN ===
if(ASAN_ENABLED)
    log_option_enabled("asan")
    if(MSVC)
        add_compile_options(/fsanitize=address)
    else()
        add_compile_options(-fsanitize=address)
        link_libraries(-fsanitize=address)
    endif()
else()
    log_option_disabled("asan")
endif()

# Build static libs
if(BUILD_STATIC_LIBRARY)
    log_option_enabled("STATIC_LIBRARY")

    if(MSVC)
        set(CMAKE_FIND_LIBRARY_SUFFIXES ".lib")
    elseif(UNIX AND NOT APPLE)
        set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
    elseif(APPLE)
        set(CMAKE_FIND_LIBRARY_SUFFIXES ".a" ".dylib")
    endif()
else()
    log_option_disabled("STATIC_LIBRARY")
endif()

# === SPEED_UP_BUILD_UNITY ===
if(SPEED_UP_BUILD_UNITY)
    log_option_enabled("SPEED_UP_BUILD_UNITY")
else()
    log_option_disabled("SPEED_UP_BUILD_UNITY")
endif()

# === USE_PRECOMPILED_HEADER ===
if(USE_PRECOMPILED_HEADER)
    log_option_enabled("USE_PRECOMPILED_HEADER")
else()
    log_option_disabled("USE_PRECOMPILED_HEADER")
endif()

# === IPO Configuration ===
function(configure_linking target_name)
    if(OPTIONS_ENABLE_IPO)
        # Check if IPO/LTO is supported
        include(CheckIPOSupported)
        check_ipo_supported(
            RESULT ipo_supported
            OUTPUT ipo_output
            LANGUAGES CXX
        )

        # Get the GCC compiler version, if applicable
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            execute_process(
                COMMAND ${CMAKE_CXX_COMPILER} -dumpversion
                OUTPUT_VARIABLE GCC_VERSION
                OUTPUT_STRIP_TRAILING_WHITESPACE
            )
        endif()

        if(ipo_supported)
            set_property(
                TARGET ${target_name}
                PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE
            )
            log_option_enabled("IPO/LTO enabled for target ${target_name}.")

            if(MSVC)
                target_compile_options(${target_name} PRIVATE /GL)
                target_link_options(${target_name} PRIVATE /LTCG)
            elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
                # Check if it's running on Linux, using GCC 14, and in Debug mode
                if(CMAKE_SYSTEM_NAME STREQUAL "Linux"
                   AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU"
                   AND GCC_VERSION VERSION_GREATER_EQUAL "14.0"
                   AND CMAKE_BUILD_TYPE STREQUAL "Debug")
                    log_option_disabled("IPO/LTO disabled for GCC 14+ in Debug mode (known bug).")
                else()
                    target_compile_options(${target_name} PRIVATE -flto=auto)
                    target_link_options(${target_name} PRIVATE -flto=auto)
                endif()
            endif()
        else()
            log_option_disabled("IPO/LTO not supported: ${ipo_output}")
        endif()
    else()
        log_option_disabled("IPO/LTO")
    endif()

    # Incremental Linking for MSVC
    if(MSVC)
        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
            target_link_options(${target_name} PRIVATE /INCREMENTAL)
            log_option_enabled("Incremental linking for Debug mode.")
        else()
            target_link_options(${target_name} PRIVATE /INCREMENTAL:NO)
            log_option_disabled("Incremental linking for non-Debug mode.")
        endif()
    endif()
endfunction()

# === DEBUG LOG ===
# cmake -DDEBUG_LOG=ON ..
if(DEBUG_LOG)
    add_definitions(-DDEBUG_LOG=ON)
    log_option_enabled("DEBUG LOG")
else()
    log_option_disabled("DEBUG LOG")
endif(DEBUG_LOG)

# *****************************************************************************
# Compiler Options
# *****************************************************************************
if (MSVC)
    foreach(type RELEASE DEBUG RELWITHDEBINFO MINSIZEREL)
        string(REPLACE "/Zi" "/Z7" CMAKE_CXX_FLAGS_${type} "${CMAKE_CXX_FLAGS_${type}}")
        string(REPLACE "/Zi" "/Z7" CMAKE_C_FLAGS_${type} "${CMAKE_C_FLAGS_${type}}")
    endforeach(type)

    add_compile_options(/MP /FS /Zf /EHsc)
else()
    add_compile_options(
        -Wno-unused-parameter
        -Wno-sign-compare
        -Wno-switch
        -Wno-implicit-fallthrough
        -Wno-extra
    )
endif (MSVC)

# === Compiler Features ===
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_23)

## Link compilation files to build/bin folder, else link to the main dir
function(set_output_directory target_name)
    if (TOGGLE_BIN_FOLDER)
        set_target_properties(${target_name}
                PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
                )
    else()
        set_target_properties(${target_name}
                PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/"
                )
    endif()
endfunction()

## Setup shared target basic configurations
function(setup_target TARGET_NAME)
    if (MSVC AND BUILD_STATIC_LIBRARY)
        set_property(TARGET ${TARGET_NAME} PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
    endif()
    target_link_libraries(${TARGET_NAME} PUBLIC project_options)
endfunction()

# *****************************************************************************
# DEBUG: Print cmake variables
# *****************************************************************************
#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#	message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
