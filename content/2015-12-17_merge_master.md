Title: Merging to Master
Date: 2015-12-17 20:50
Tags: kernel
Author: Kevin Lange
Summary: Finally getting rid of the strawberry-dev branch, new CI pipeline, and more.

For several years now, our primary branch has been called `strawberry-dev`. This name came about during a development period in which I had three branches: `vanilla` contained a mostly unmodified kernel circa 2012, `chocolate-dev` contained development towards the GUI (still during the days of the old compositor), and `strawberry-dev` was supposed to include some new kernel work; `master` remained a stable state. Eventually, work from `strawberry-dev` was occasionally merged into `master`, but `chocolate-dev` and `vanilla` stagnated. This led to `strawberry-dev` becoming the default branch as `master` was only updated when it was deemed stable. Now, after three years of this, we're finally getting rid of `strawberry-dev` and making `master` the default branch again. If you have a checkout of our git repository, you'll want to pull and then checkout `master` and make sure it has an appropriate remote.

### *A Travis build in under two minutes* [![A Travis build in under two minutes](http://i.imgur.com/PqGOx2C.png)](http://i.imgur.com/PqGOx2C.png)
####

I've also spent some time working on our CI pipeline. We use [Travis](https://travis-ci.org/) to run builds after every push to Github. This process used to involve building a complete toolchain, which meant that Travis runs would take about 25 minutes to finish. We were also running on the old Travis infrastructure and wanted to upgrade. We've now reduced the build time to under two minutes using cached toolchains. There's still more work to do to make our CI builds actually useful from a testing perspective, and we hope to eventually produce live CDs of every build and host them on S3.

### *Live CD* [![Live CD](http://i.imgur.com/nc8CqL1.png)](http://i.imgur.com/nc8CqL1.png)
### *Micro Live CD* [![Micro Live CD](http://i.imgur.com/JJeDhLK.png)](http://i.imgur.com/JJeDhLK.png)
####

Speaking of live CDs - did you know we host a handful of CDs ourselves? You can get [an up-to-date general-purpose Live CD](http://toaruos.org/live.iso) built from `make cd`, or some older, tailored CDs like [this 10MB "micro" distribution](http://toaruos.org/micro.iso). Suggested QEMU arguments are `-vga std -m 512 -enable-kvm -soundhw ac97 -net user -net nic,model=rtl8139`.


