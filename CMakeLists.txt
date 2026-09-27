cmake_minimum_required(VERSION 3.20)

project(MythOS
    VERSION 0.1.0
    LANGUAGES C ASM_NASM
)

add_compile_options(
    $<$<COMPILE_LANGUAGE:C>:-ffreestanding>
    $<$<COMPILE_LANGUAGE:C>:-O2>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-fno-builtin>
    $<$<COMPILE_LANGUAGE:C>:-fno-stack-protector>
    $<$<COMPILE_LANGUAGE:C>:-mno-red-zone>
)

set(CMAKE_ASM_NASM_FLAGS "-f elf64")
add_subdirectory(kernel)

add_custom_target(run
    COMMAND qemu-system-x86_64 -drive format=raw,file=$<TARGET_FILE:myth.bin>
    DEPENDS myth.bin
    COMMENT "Launching Myth OS in QEMU..."
)
