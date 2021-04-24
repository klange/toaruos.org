Title: Misaka, and the Future of ToaruOS
Date: 2021-04-24 12:00
Tags: kernel
Author: K Lange
Summary: Rebuilding the world with a new kernel.

Sometimes I forget I even have this blog. The last post was over two years ago. ToaruOS has seen a lot of change since then.
Most notable is the introduction of [Kuroko](https://kuroko-lang.github.io/), my project to replace CPython.
Kuroko has occupied much of my time for the last several months and has become stable, fast, and feature-complete, with
nearly complete coverage for modern Python 3 syntax. There's still a lot of work to do on Kuroko's standard library, but
it's more than good enough to provide a programming environment within ToaruOS, and has been integrated into [Bim](https://github.com/klange/bim),
my code editor, as a plugin and syntax highlighting language for a while now. The latest release of Kuroko is included in
[ToaruOS v1.14.0](https://github.com/klange/toaruos/releases/tag/v1.14.0) alongside sample bindings for Yutani (the windowing system)
allowing for simple demonstrations of how it will be used in the future to build graphical applications. Ultimately,
the plan is to recreate the Python user experience provided in ToaruOS prior to the NIH project.

Kuroko is not the only big thing to happen in ToaruOS, though. Hidden away in a separate repository in a new organization
on Github is [Misaka](https://github.com/toaruos/misaka) - the ongoing project to build a new x86-64, SMP-capable
kernel for ToaruOS. Misaka is not a new project; it began over five years ago, before the merge of the NIH project, before
ToaruOS had its own C standard library, and before we could rebuild the entire ecosystem in under a minute. The idea of
porting the OS seemed so distant then, and after much stalling I turned to other projects - I was, after all, preparing to
move to a new country. Now that I've settled in, the goal seems more attainable.

Much of the work of porting ToaruOS to a 64-bit platform has already been done: Large parts of the libc have been tested
as part of other projects, like [the port of Kuroko to run on EFI](https://github.com/kuroko-lang/kuroko-efi) and Bim
being my primary editor on 64-bit Linux for well over a year now. Porting the kernel internals to work with new paging
structures and verifying that the change in word size doesn't cause unforeseen issues should take little more than a month
of effort, if all goes well. I'll be focusing on that aspect of Misaka during the upcoming
[Golden Week](https://en.wikipedia.org/wiki/Golden_Week_%28Japan%29) holidays. Beyond that initial porting work, a new project
like this offers an opportunity to redesign internal APIs and build a kernel that better suits the role of being an educational
demonstration.

