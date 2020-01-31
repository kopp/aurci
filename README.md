# aurci [![Build Status](https://travis-ci.org/kopp/aurci.svg?branch=master)](https://travis-ci.org/kopp/aurci)

Forked from [`localnet/aurci`](https://github.com/localnet/aurci).

Use [Travis CI](https://travis-ci.org) for building and packaging a few [AUR](https://aur.archlinux.org) packages and deploy them to [GitHub Releases](https://github.com/kopp/aurci/releases) so it can be used as repository in [Arch Linux](https://www.archlinux.org).

## Use repository

To use as custom repository in [Arch Linux](https://www.archlinux.org), add to file `/etc/pacman.conf`:

```
[aurci]
SigLevel = Optional TrustAll
Server = https://github.com/kopp/aurci/releases/download/repository
```

Then on the command line:

```
pacman -Sy            # Refresh package database.
pacman -Sl aurci      # Show packages in repository.
pacman -S {package}   # Install a package.
```

## available packages

All packages (and their dependencies, which cannot be installed from "normal" repositories) mentioned in the file `pkglist` will be made available in this repository.
Note, that this file can contain comments (lines with leading `#`).

To get a list of all pacman packages that are installed on your system but are not found in the sync database(s) use

    pacman -Qm

If you have used a tool such as `cower` to install packages from AUR previously, the output of this command should be all packages which were installed from AUR, so you can enter them to `pkglist` to download them from this repository in the future.

**NOTE:** List of currently maintained packages can change at any moment.




## Forking repository

For build the [AUR](https://aur.archlinux.org) packages of your election fork this repository and enable [Travis CI](https://travis-ci.org):

  - Fork this GitHub repository and edit `pkglist`.
  - Generate a personal access token with scope `public_repo` (see [tokens](https://github.com/settings/tokens))
  - Enable Travis CI for your new forked repository (see your [settings](https://travis-ci.org/account/repositories) and "Sync account" if the new repository is not shown yet)
  - In Travis CI repository settings disable build pull request updates, for security.
  - In Travis CI repository settings declare one environment variable:
    - `GITHUB_TOKEN`: The previously created personal access token, disable display value.
  - Optionally, enable a cron job in Travis CI repository settings.
