Title: Another Year
Date: 2015-04-20 19:50
Tags: kernel
Author: K Lange
Summary: Kernel updates, and lots of exciting ports.

It's been nearly a year since I last posted an update, but in that year there's been a solid bit of development activitiy.

## EXT2 drivers

If you've been following ToaruOS for a while, you may know that we had some write support for ext2 a very long time ago, but it was kind of broken and unstable. The good news is, that support is back, and it's notably more stable than it was. The bad news is it's still not done, and there are some known bugs and edge cases to work through.

## More Network Work

The kernel networking support has been vastly improved, though it's still not ready for prime time and still not available from userspace. I'm actually working on this right now, toying with some ideas for exposing the network stack through the VFS. Hopefully, we should have some nice demos like a telnet client and an IRC client in the coming months.

### *Networking and star wars* [![Networking, Star Wars](//i.imgur.com/duIsLh7.png)](//i.imgur.com/duIsLh7.png)
####

## Login Screen Redesign

### *New Login Screen* [![New login screen](//i.imgur.com/x0mJouI.png)](//i.imgur.com/x0mJouI.png)
####

There have actually been two redesigns of the login screen since the last blog post - one was to use a blurred wallpaper for the background, the other was a more extensive redesign of the widgets. This was a fun little project to make use of Cairo. We're also loading a bunch of configuration information (including the logo, positions of various things, what wallpaper to use for the login screen) from a config file, so you can change settings on the fly, without needing to rebuild.

Those config files are also in use for the desktop wallpaper, per-user, so you can change your wallpaper without having to copy files around. We've started shipping all of the in-house wallpapers from older revisions, as well as a few new ones over the past year.

## Doom and Quake

The SDL port has been rejuvinated, targeting Yutani instead of the old compositor, and now we have working Doom and Quake ports. The Doom engine is prboom, with sdlquake for Quake.

### *Quake* [![Quake](//i.imgur.com/i5O8Vcl.png)](//i.imgur.com/i5O8Vcl.png)
####

## New Timing Interface

The kernel timing APIs have been updated. `gettimeofday()` now uses an internal clock rather than always calling the RTC. This means there is some apparent drift, which we try to account for every so often, but it also means accurate timing information is available when you needed it. Additionally, the kernel tick rate has been increased to 1000Hz, or 1ms per click, so we're also more accurate. This affects the multitasking quanta time, as well as the resolution for the uptime information in `/proc/uptime`.

The new timing interface has been adopted for use in animations on the desktop, so if you're running under software emulation in Bochs or QEMU, you should notice that animations are no longer abysmally slow (they'll just have low framerates). This was helpful with adding new animations to the wallpaper when loading applications, but is also used in the compositor and login screen.

### *Faster Gears* [![Timing resulted in an increased framerate in Gears](//i.imgur.com/F2dRiwY.png)](//i.imgur.com/F2dRiwY.png)
####

## What's New in Yutani

Yutani got a number of updates as well, mostly driven by the SDL and Quake ports. Yutani now supports cursor warping and hiding, and will inform clients when a window is moved. A client application, `yutani-test`, has been added for debugging - it works a bit like `xev`.
