# Docker Image

* OS: Windows Server Core - <https://hub.docker.com/r/microsoft/dotnet-framework>
* Software:
    * MSVC
    * CMake
    * Git 2.20.1 - <https://github.com/git-for-windows/git/releases/>
    * Vcpkg - <https://github.com/Microsoft/vcpkg>
    * Boost.MultiPrecision - <https://github.com/Microsoft/vcpkg/tree/master/ports/boost-multiprecision>
    * MPFR - <https://github.com/Microsoft/vcpkg/tree/master/ports/mpfr>

## References
* <https://devblogs.microsoft.com/cppblog/using-msvc-in-a-docker-container-for-your-c-projects/>
    * [archived](https://web.archive.org/web/20190226191640/https://devblogs.microsoft.com/cppblog/using-msvc-in-a-docker-container-for-your-c-projects/)
* <https://github.com/Microsoft/vs-dockerfiles/blob/master/native-desktop>
* <https://github.com/Limech/git-powershell-silent-install>
* [`[error]Container feature requires Windows Server 1803 or higher. Please
 reference documentation (https://go.microsoft.com/fwlink/?linkid=875268)`](https://go.microsoft.com/fwlink/?linkid=875268)
