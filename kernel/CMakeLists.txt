set (KERNEL_SOURCES src/boot.asm src/kernel.c include/io.asm)

add_executable(myth.bin ${KERNEL_SOURCES})

target_link_options(myth.bin PRIVATE
    -T${CMAKE_SOURCE_DIR}/linker.ld
    -nostdlib
)
