# Nick's Homelab

[![license](https://img.shields.io/github/license/nwsmonster/homelab?style=flat-square&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0.html)
[![issues](https://img.shields.io/github/issues-raw/nwsmonster/homelab)](https://github.com/nwsmonster/homelab/issues)
[![tag](https://img.shields.io/github/v/tag/nwsmonster/homelab?style=flat-square&logo=semver&logoColor=white)](https://github.com/nwsmonster/homelab/tags)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

This project utilizes [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) to automate provisioning, operating, and updating self-hosted services in my homelab.

## Overview

**Project Status:** PRE-ALPHA

> **Important**
>
> This is _**MY**_ homelab. Decisions were made based on my hardware, level of understanding, and personal experience.  
> If you want to experiment, I encourage you to checkout [khuedoan's homelab](https://github.com/khuedoan/homelab) project and start from there.  
> My goal for this project is for my own needs.

- My nodes have their OS installed manually. They're too old for PXE with UEFI and it's just not worth it for my needs. I will likely update to PXE boot provisioning when I get new hardware.

## Host controller requirements

```bash
make python-deps
```

## Docs

> I really like the tips outlined in [DokuWiki's "Hints on good style"](https://www.dokuwiki.org/tips:good_style).

The docs are built using [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

## License

Copyright &copy; 2023 Nick Halase

Distributed under the GPLv3 License.
See [LICENSE.md](https://github.com/nwsmonster/homelab/blob/main/LICENSE) file for more information.

## Acknowledgements

References:

- [khuedoan/homelab](https://github.com/khuedoan/homelab)
  - Big shout-out to this project as the base inspiration for my homelab ❤️
- [markdownlint](https://github.com/DavidAnson/vscode-markdownlint)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Conventional Commits](https://conventionalcommits.org)
