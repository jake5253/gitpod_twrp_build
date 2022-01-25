FROM gitpod/workspace-base

# Install required Android AOSP packages
########################################
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    bc \
    bison \
    build-essential \
    ccache \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    gnupg \
    gperf \
    imagemagick \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    liblz4-tool \
    libncurses5-dev \
    libncurses5 \
    libncursesw5 \
    libsdl1.2-dev \
    libssl-dev \
    libwxgtk3.0-gtk3-dev \
    libxml2 \
    libxml2-utils \
    lzop \
    make \
    maven \
    openjdk-8-jdk \
    openssl \
    pngcrush \
    procps \
    python \
    rsync \
    schedtool \
    squashfs-tools \
    unzip \
    wget \
    xsltproc \
    zip \
    zlib1g-dev \
&& sudo rm -rf /var/lib/apt/lists/* \
&& sudo apt-get clean \
&& sudo apt-get autoclean

# Environment variables
#######################
ENV SRC_DIR /workspace/twrp
ENV CCACHE_DIR /workspace/ccache
ENV IMG_DIR /workspace/imgs

# Configurable environment variables
####################################

# By default we want to use CCACHE, you can disable this
# WARNING: disabling this may slow down a lot your builds!
ENV USE_CCACHE 1

# Environment that controls the CCACHE size
# suggested: 50G
ENV CCACHE_SIZE '50G'

# Environment that compresses objects stored in CCACHE
# suggested: 1
# WARNING: While this may involve a tiny performance slowdown, it increases the number of files that fit in the cache.
ENV CCACHE_COMPRESS 1

# Environment for the LineageOS Branch name
# See https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni/branches for possible options
ENV BRANCH_NAME 'twrp-9.0'

# Environment for the device list ( separate by comma if more than one)
# eg. DEVICE_LIST=hammerhead,bullhead,angler
ENV DEVICE_LIST 'YT9216BJ'

# User identity
ENV USER_NAME 'LineageOS Buildbot'
ENV USER_MAIL 'lineageos-buildbot@docker.host'

# If you want to start always fresh ( re-download all the source code everytime ) set this to 'true'
ENV CLEAN_SRCDIR false

# If you want to preserve old IMGs set this to 'false'
ENV CLEAN_OUTDIR true

# Print detailed output rather than only summary
ENV DEBUG true

# Clean artifacts output after each build
ENV CLEAN_AFTER_BUILD true

# Provide a default JACK configuration in order to avoid out-of-memory issues
ENV ANDROID_JACK_VM_ARGS "-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

# Set the entry point
ENTRYPOINT "workspaceinit"
