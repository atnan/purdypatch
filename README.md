Purdy Patch
===========

The `purdypatch` tool provided by this gem takes patch emails created via `git-format-patch`, and inserts a prettified HTML version of the patch attachments into the email.

My workflow is something like this:

    $ git format-patch --attach HEAD~1
    $ purdypatch *.patch
    $ git send-email *.purdypatch

If you need to do decentralized patch reviews, hopefully this tool will be useful to you.
