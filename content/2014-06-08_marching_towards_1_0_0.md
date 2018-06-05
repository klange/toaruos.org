Title: Marching Towards 1.0.0
Date: 2014-06-08 00:20
Tags: kernel
Author: K Lange
Summary: Various updates before I go on vacation

I'm heading to Tokyo again in under a week, as I routinely do. Before I leave, I wanted get a blog post out covering my recent work on improving "quality of life" in ToaruOS - cleaning up the little nits here and there that have been annoying me and those brave enough to try things out for themselves.

## Tiling

Yutani's window manager is a stacking window manager, but like with Compiz's grid plugin I wanted to implement some simple tiling for "everyday" situations like throwing up terminals with quarter/half splits. This is accomplished with a move and resize, triggered by a keybinding in the compositor. The tiling looks really nice in combination with my older decoration theme, which I've updated to indicate focus.

### *Tiled windows* [![Tiled windows](//i.imgur.com/3fZvBvo.png)](//i.imgur.com/3fZvBvo.png)
####

## Display Server Nesting

When I first started working on Yutani, I had in the back of my mind the idea that it should be nestable. Since Yutani operates against a "graphics context" provided by my generic graphics library, and since that same library is used for windowed applications running within Yutani, getting Yutani to run as a client of itself wasn't too far-fetched, but it did require some quick changes here and there.

### *Nested Yutani* [![Nested Yutani](//i.imgur.com/nhnH1ew.png)](//i.imgur.com/nhnH1ew.png)
####

## Window Shaping

Yutani inhereted a system for tracking clicks from its older brother called "selection buffers" (also referred to as "click buffers" or "picking buffers"). Selection buffers provide a way to give constant-time lookup by coordinates in a rendered surface, but eat a lot of memory and can be slow to generate. It took me longer than I care to admit to come to conclusion that selection buffers were *not* the right way to go moving forward in Yutani, but I eventually came to my senses and replaced my selection buffers with a slower, but much more useful, click-time lookup. Combining this with some (application-controlled) thresholding on window alpha channels allowed for a quick and easy implementation of window shaping: allowing a window's "shape" in the compositor to reflect its contents.

This is most noticable in the Gears application: Previously, the gears window was a large, mostly transparent box, and any click in that box was delivered to the gears application. With the selection buffer, rectangles were drawn to represent the application windows, so we could at least track rotation, but we could not track the finer details of the gears.

### *Boxes* [![Boxes](//i.imgur.com/RP2mY5Q.png)](//i.imgur.com/RP2mY5Q.png)
####

Using the new method, we can now make clicks on the "not gears" map through to the wallpaper below. This screenshot is actually from a transitionary phase where selection buffers were still in use, but demonstrates the window shaping quite well:

### *Gears* [![Gears](//i.imgur.com/Ef32dh5.png)](//i.imgur.com/Ef32dh5.png)
####

The shaping of windows is only calculated under the mouse cursor, but we can view the results of this shaping with a debug tool (might want to click on this one):

### *Window Shapes* [![Debugging window shapes](//i.imgur.com/2ZPyE8k.png)](//i.imgur.com/2ZPyE8k.png)
####

## Unix Pipes

Toaru's kernel has supported a sort of IPC that I've been calling "pipes" for a very long time now. These pipes were fundamental in the operation of the old compositor, and are still used these days internally for some drivers that require buffering (keyboard, mouse). That said, these were definitely not *Unix* pipes, and trying to get things like Bash working with them was a nightmare. Adding proper Unix pipes allowed me to finally have a working Bash - including assigning output to variables. I've also implemented pipes in my own shell.

### *Pipes* [![Pipes](//i.imgur.com/9y43ERE.png)](//i.imgur.com/9y43ERE.png)
####

## Shebangs

Shebangs are those lines you see at the tops of scripts that look like `#!/bin/foo` - they tell the kernel's binary loader to take this file and pass its name as an argument to another executable, and they allow scripts like shell scripts and Python files to be executed directly, rather than having to call the interpreter.

### *Shebangs* [![Shebangs](//i.imgur.com/t3ELorx.png)](//i.imgur.com/t3ELorx.png)
####

## `pstree` and `ls`

A tool I really like on Linux is `pstree`, which shows a visual representation of how the process tree looks (what processes are children of other processes, etc.). Implementing my own `pstree` required adding some functionality to `procfs` to support parent PIDs. I've also put some work into making `ls` more like the GNU version, supporting multiple arguments, human-readable file sizes, and minimizing column widths.

### *pstree and ls* [![pstree and ls](//i.imgur.com/StAAwXs.png)](//i.imgur.com/StAAwXs.png)
####

## VGA terminal improvements

The last thing on our list for today is some improvements to the VGA terminal. I fixed a notable bug in line wrapping and also added color mappings from the 256-color palette, and from arbitrary 24-bit and 32-bit colors. Now the prompt looks nice and colorful again in VGA text mode:

### *VGA text-mode* [![VGA text-mode](//i.imgur.com/pzy2AIQ.png)](//i.imgur.com/pzy2AIQ.png)
####

And we can `cat /usr/share/color-test`:

### *color-test* [![cat /usr/share/color-test](//i.imgur.com/XeW990L.png)](//i.imgur.com/XeW990L.png)
####

`pstree` also looks nice with some Unicode-to-VGA mappings for line-drawing characters:

### *pstree VGA* [![pstree in VGA text-mode](//i.imgur.com/cezN0wE.png)](//i.imgur.com/cezN0wE.png)
####

I don't know if I'll be able to get much work done over the next week, and I'm sure my Github activity streak will be broken while I'm in Japan. There's still a lot of work to be done for the network stack, which is a major blocker to a "1.0.0" release.
