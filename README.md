Purdy Patch
===========

This gem provides a `purdypatch` tool for improving the format of `git-format-patch` emails, making them easier for reviewers to read and reply to in a decentralized, email-based review system.

It uses the incredibly useful [PrettyPatch formatter](http://svn.webkit.org/repository/webkit/trunk/Websites/bugs.webkit.org/PrettyPatch/), which is used by the patch review system on [bugs.webkit.org](https://bugs.webkit.org). The HTML emails it creates are nicely formatted in Mail for OS X, and make it easy to inline reply to individual lines of the patch.

To get started, run `gem install purdypatch` to install the tool.

Once you have `purdypatch` installed, here's a simple workflow for sending out a patch for review:

    $ git format-patch --to="Doge <sohip@suchclass.com>" --attach HEAD~1
    $ purdypatch *.patch

At this point, you'll have a .purdypatch file for each of the .patch files. You can edit them if you'd like to add any additional notes, and then you can send them out via email like so:

    $ git send-email *.purdypatch

Enjoy.
