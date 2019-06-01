I like things that work. Things that work are simple. I like simplicity. This is my try at creating something cool on my bare-metal Raspberry Pi. There are some resources on the internet that show how to write a small, custom OS for the Pi and this repository exists to capture what I learn and put it into working code.

I develop on Windows. All dependencies are included in this repository. Cloning it onto your Windows machine should allow you to run every script. If not, create an issue.

The GCC compiler was downloaded from
	https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
the zip file link is
	https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-win32.zip?revision=ab9cb8f8-6a9d-4a6e-818a-295f5d1ca982?product=GNU%20Arm%20Embedded%20Toolchain,ZIP,,Windows,8-2018-q4-major

I do not use make. Makefiles are hard to read. The Windows batch files can be easily translated into Linux shell scripts.
