Title: Half a Year in Japan, and What's Changed in ToaruOS
Date: 2016-12-22 20:00
Tags: kernel
Author: K Lange
Summary: It's been over a year since the last post, so let's talk about lots of stuff.

It's been over a year since my last blog post, and a lot has happened in ToaruOS and my own life in that time. For one, I moved to Tokyo back in May, which has been quite an adventure in itself. The year in development has seen many key improvements to the OS, including considerable support for VirtualBox with the guest additions driver and network drivers for the AMD PCNet series of NICs, support for ISO 9660 file systems, and most recently the addition of dynamic linking. As the ISO 9660 support is not particularly interesting and the VirtualBox Guest Addition are already described in detail [on the OSDev.org wiki](//wiki.osdev.org/VirtualBox_Guest_Additions), this blog post will instead focus on dynamic linking and the changes it brings to the ToaruOS build process and applications.

Dynamic linking has been a goal for ToaruOS for quite some time now, and several git checkouts litter my work environment with incomplete attempts at starting a dynamic loader. Before I go into depth on how the current ToaruOS dynamic loader works, I'd like to give a quick shout-out to the team behind [Pedigree](https://www.pedigree-project.org/), which was a big help in understanding how this process works.

ToaruOS's dynamic loader is still a work-in-progress and lacks many important features such as properly handling binding options and sharing libraries between processes. That said, it is complete enough to support a full dynamically-linked userspace, which I now ship by default.

### *Dynamically-linked userspace, look at all those SOs!* [![Dynamically-linked userspaec, look at all those SOs!](//i.imgur.com/kgnpgBo.png)](//i.imgur.com/kgnpgBo.png)
####

The loader also provides `dlopen` and friends so I can do much more interesting things like loading decorator themes dynamically based on the user's profile.

### *Red title bars?* [![Red title bars?](//i.imgur.com/FT1rkez.png)](//i.imgur.com/FT1rkez.png)
####

But we're not done there: ToaruOS now has a stable build of Python 3.6 - and with a very small diff against the Python sources. It even includes support for loading shared object C modules such as the accelerated JSON parser and the math module. Thanks to the `ctypes` module, I was able to very quickly build bindings to Yutani, so you can write windowed applications in Python as well.

### *Python is cool!* [![Python is cool!](//i.imgur.com/2LUS5Wh.png)](//i.imgur.com/2LUS5Wh.png)
### *We've got WM bindings.* [![We've got WM bindings.](//i.imgur.com/PDfO9Ty.png)](//i.imgur.com/PDfO9Ty.png)
####

With stable networking and a nicer language to write applications in, it's about time ToaruOS get some sort of package manager, which is where `get-py` comes in. Not the best at naming things, `get-py` is a tool written in Python that gets things.

### *Lots of packages* [![Lots of packages!](//i.imgur.com/t8MAc6H.png)](//i.imgur.com/t8MAc6H.png)
### *Enjoy Quake from a CD* [![Enjoy Quake from a CD](//i.imgur.com/QVSB9vK.png)](//i.imgur.com/QVSB9vK.png)
####

Packages are defined in a manifest as a series of pre-steps, files, post-steps, and dependencies - essentially automating the process I've been using on my own to install new things to running live CDs. You can download, decompress, and mount small filesystem images and executables, and verify file integrity with SHA512 sums. I've ensured there are packages for most of the random ports I've been working on, but there's still a few things missing such as the `libav` video player (which I intend to port to `ffmpeg`) and the entire compiler suite (which is just really big and hard to package).

As we approach the 1.0 release, you can track the pre-release builds [on our GitHub releases page](https://github.com/klange/toaruos/releases). Both manual builds with Python and automated builds without (built by Travis CI) are available.
