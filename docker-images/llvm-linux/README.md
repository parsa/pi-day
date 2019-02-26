# Docker Image

* OS: Debian 9 Stretch - <https://hub.docker.com/_/debian>
* Software:
    * clang++ 8
    * clang-tidy 8
    * CMake - <https://packages.debian.org/stretch/cmake>
    * Git - <https://packages.debian.org/stretch/git>
    * Boost 1.62 - <https://packages.debian.org/stretch/libboost1.62-dev>
    * MPFR - <https://packages.debian.org/stretch/libmpfr-dev>

## References
* <https://releases.llvm.org/>
* <https://clang.llvm.org/extra/clang-tidy/checks/readability-non-const-parameter.html>
* <https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-6.0-on-ubuntu-16.04-xenial-wsl.html> - [archived](https://web.archive.org/web/20190226185153/https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-6.0-on-ubuntu-16.04-xenial-wsl.html)

### Apt Repos

#### Debian

| Version | Codename | Apt Repo |
| --- | --- | --- |
| 9 | Stretch | <http://apt.llvm.org/stretch/> |
| 8 | Jessie | <http://apt.llvm.org/jessie/> |
| 7 | Wheezy | <http://apt.llvm.org/wheezy/> |

#### Ubuntu

| Version | Codename | Apt Repo |
| --- | --- | --- |
| 19.04 | Disco Dingo | <http://apt.llvm.org/disco/> |
| 18.10 | Cosmic Cuttlefish | <http://apt.llvm.org/cosmic/> |
| 18.04 LTS | Bionic Beaver | <http://apt.llvm.org/bionic/> |
| 17.10 | Artful Aardvark | <http://apt.llvm.org/artful/> |
| 17.04 | Zesty Zapus | <http://apt.llvm.org/zesty/> |
| 16.10 | Yakkety Yak | <http://apt.llvm.org/yakkety/> |
| 16.04 | LTS Xenial Xerus | <http://apt.llvm.org/xenial/> |
