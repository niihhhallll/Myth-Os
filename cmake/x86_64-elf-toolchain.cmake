
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# Set cross-compilers (adjust path if not in your PATH)
set(CMAKE_C_COMPILER x86_64-elf-gcc)
set(CMAKE_ASM_NASM_COMPILER nasm)

# Tell CMake where the root environment is (none for bare-metal)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
