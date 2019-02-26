FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y curl gnupg \
    && echo 'deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main' >>/etc/apt/sources.list \
    && curl -JL http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add - \
    && apt-get update \
    && apt install -y \
        clang-8 \
        clang-tidy-8 \
        cmake \
        git \
        libboost1.62-dev \
        libmpfr-dev \
        locales \
    && apt-get purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-8 100 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-8 100 \
    && update-alternatives --install /usr/bin/clang-cpp clang-cpp /usr/bin/clang-cpp-8 100 \
    && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-8 100 \
    && update-alternatives --install /usr/bin/clang-tidy-diff.py clang-tidy-diff.py /usr/bin/clang-tidy-diff-8.py 100 \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
