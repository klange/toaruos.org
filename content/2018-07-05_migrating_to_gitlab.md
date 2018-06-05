Title: Migrating to GitLab, and ToaruOS-NIH
Date: 2018-06-05 12:00
Tags: kernel
Author: K Lange
Summary: We're moving.

In light of GitHub's acquisition by Microsoft, we are migrating to GitLab. ToaruOS has been mirrored on GitLab for many years now, but the mirror is moving from my personal projects to a [ToaruOS group](https://gitlab.com/toaruos). Subprojects, such as first-party applications not shipped in the default distribution have also been migrated to that group. I will continue to update the GitHub mirrors for the foreseeable future.

Additionally, for the past several months, I have been working on a new project for ToaruOS: [ToaruOS-NIH](https://gitlab.com/toaruos/toaru-nih)

The goal of this project is to replace Newlib, as well as removing Cairo and FreeType from the default installation. Much work has been done on building a new C library for ToaruOS, and new text rendering technologies have been implemented to replace FreeType. Ultimately, the goal of this project is to be the new base for ToaruOS. Many of the Python parts of the original ToaruOS distribution are being rewritten in C for performance reasons (and because we can't build Python for our new C library quite yet).

### *ToaruOS-NIH* [![ToaruOS NIH](//i.imgur.com/vwVV7sG.png)](//i.imgur.com/vwVV7sG.png)
####
