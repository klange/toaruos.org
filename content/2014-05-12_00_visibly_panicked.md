Title: Visibly Panicked
Date: 2014-05-12 20:20
Tags: kernel
Author: Kevin Lange
Summary: New panick screens for graphical outputs

Panic screens are an important part of any OS - they allow you to see not only that you've made a mistake, but often why and how. The panic screen in Windows is particularly infamous, and helpful to some subset of engineers, though not very shiny. OS X has a rather neat, but ultimately not very useful panic screen involving an embedded image in the kernel.

とあるOS has mostly had debug output like kernel panics written to a serial log. Since I'm usually working in the GUI and often have the logs completely disabled, it made sense to add a new panic format. To that end, I was inspired by a popular video game series, and made these new panic screens:

[![Assertion failed - login](http://i.imgur.com/Q8cce5d.png)](http://i.imgur.com/Q8cce5d.png)

[![Assertion failed - desktop](http://i.imgur.com/QyDAOxO.png)](http://i.imgur.com/QyDAOxO.png)

[![Out of memory](http://i.imgur.com/Mjj6886.png)](http://i.imgur.com/Mjj6886.png)

The panic handler first outputs to the debug log (if set) and then calls out to the video driver to have it display a visual indicator of failure. The video driver can take an array of messages to display, which are usually `sprintf`'d into the kernel stack by the calling fault handler. With this particular setup, the video driver desaturates the dispaly to grayscale, adds a (crude) vignette effect, and then displas the fault message in the center of the screen using an embedded bitmap font.
