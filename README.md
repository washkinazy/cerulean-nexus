# Cerulean Nexus &nbsp; [![bluebuild build badge](https://github.com/washkinazy/cerulean-nexus/actions/workflows/build.yml/badge.svg)](https://github.com/washkinazy/cerulean-nexus/actions/workflows/build.yml)

- [Cerulean Nexus   ](#cerulean-nexus--)
  - [Local Dev Loop](#local-dev-loop)
  - [Installation](#installation)
  - [ISO](#iso)
  - [Verification](#verification)

## Local Dev Loop

Using the [Blue Build CLI](https://github.com/blue-build/cli?tab=readme-ov-file) there are a few [workflows](https://blue-build.org/how-to/local/) that can be used to validate the container build prior to push. 

```bash
bluebuild build ./recipes/cerulean-nexus[-nvidia].yml
```

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/washkinazy/cerulean-nexus:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/washkinazy/cerulean-nexus:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

```bash
sudo docker run --rm --privileged \
    --volume ./iso-output:/build-container-installer/build \
    --security-opt --pull=always \
    ghcr.io/jasonn3/build-container-installer:latest \
    IMAGE_REPO=ghcr.io/washkinazy \
    IMAGE_NAME=nerulean-nexus-nvidia \
    IMAGE_TAG=latest \
    VARIANT=Silverblue \
    ISO_NAME=generated-installer
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/washkinazy/cerulean-nexus[-nvidia]
```
