# Rust Limine Barebones

# ⚠️ WARNING: This repo makes use of Xargo, whose features got included into regular Cargo. Therefore, you can look into replacing it. ⚠️ 

This is a small kernel that boots using Limine.

## Build

First of all, download Rust ! (I guess you already did it if you are here lol)
Then, do the following things
```sh
# Installs the nightly toolchain, needed for few things
rustup install nightly
cd rust_limine_barebones
# Sets the nightly toolchain as the version of the project 
rustup override set nightly
# Installs cargo xbuild. Needed to build core for our custom target
cargo install cargo-xbuild
```

This kernel needs echfs-utils for building the image that we can pass through qemu, you can found this [here](https://github.com/echfs/echfs)

## Scripts

Because I'm a good guy I made many scripts to help you build the kernel. So in order we have:

- ``build.sh``, builds the kernel. As we use Limine we can let it build a typical ELF executable.
- ``build_limine.sh``, takes the kernel and pack it with limine in a echfs image.
- ``run_qemu.sh``, runs the image generated with ``build_limine.sh``. Now you are ready for many hours of suffering with the x86 arch.
- ``run_update.sh``, launchs every scripts in the order of this list. It aswell deletes the previous image. But still be careful about your compile errors, I don't handle these.

## The target

Maybe I've put some unused gcc linking args but if you want your target working instantly just basically copy it.

# The linking script

Because the ``#[used]`` proc macro isn't enough to keep the ``stivale2hdr`` alive after linking you need the ``linker.ld`` script to keep it breathing. Without this Limine won't boot your kernel because of missing ``stivale2hdr`` section.

# Limine config

Limine config is pretty simple but if your kernel is making some progress you maybe gonna need a ramfs.

# Resources

If you need anything more than what this repo can offer you, here are some links that may be useful:
- [the Limine bootloader's repo](https://github.com/limine-bootloader/limine)
- [OSDEV Resources](https://wiki.osdev.org/Main_Page)
- [DEVSE Wiki, for my french compatriots (59 ftw)](https://devse.wiki/)
- [Osdev awesome, made by same peoples that are making the DEVSE wiki, but no worry it's not only french](https://github.com/developpement-systeme-exploitation/awesome)
