FROM archlinux/base

# Update packages.
RUN pacman -Syu --noconfirm

# Install base-devel group.
RUN pacman -S --needed --noconfirm base-devel

# Install missing dependencies
# | package                 | missed by
# | ----------------------- | ----------
# python-setuptools         | python-colorzero
# tk                        | python-guizero
RUN pacman -S --needed --noconfirm python-setuptools tk

# Clear cache.
RUN pacman -Scc --noconfirm

# Create an unprivileged user.
RUN useradd -m -G wheel -s /bin/bash pkguser

# Grant group wheel sudo rights without password.
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

# Set user.
USER pkguser

# Set working dir.
WORKDIR /home/pkguser

# Create dirs.
RUN mkdir src bin
