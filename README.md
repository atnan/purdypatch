Purdy Patch
===========

This gem provides a `purdypatch` tool for improving the format of `git-format-patch` emails, making them easier for reviewers to read and reply to in a decentralized, email-based review system.

It uses the incredibly useful [PrettyPatch formatter](http://svn.webkit.org/repository/webkit/trunk/Websites/bugs.webkit.org/PrettyPatch/), which is used by the patch review system on [bugs.webkit.org](https://bugs.webkit.org).

To get started, simply run `gem install purdypatch` to install the tool.

Once you have `purdypatch` installed, here's a simple workflow for sending out a patch for review:

    $ git format-patch --to="Doge <sohip@suchclass.com>" --attach HEAD~1
    $ purdypatch *.patch
    $ git send-email *.purdypatch

According to [Devil’s Dictionary of Programming](http://programmingisterrible.com/post/65781074112/devils-dictionary-of-programming), `purdypatch` is simple, opinionated *and* lightweight.

Enjoy.
