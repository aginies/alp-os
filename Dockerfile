# SPDX-License-Identifier: MIT
# Define the tags for OBS and build script builds:
#!BuildTag: %%TAGPREFIX%%/demo:latest
#!BuildTag: %%TAGPREFIX%%/demo:%%PKG_VERSION%%
#!BuildTag: %%TAGPREFIX%%/demo:%%PKG_VERSION%%-%RELEASE%

FROM opensuse/tumbleweed

# Mandatory labels for the build service:
#   https://en.opensuse.org/Building_derived_containers
# labelprefix=%%LABELPREFIX%%
LABEL org.opencontainers.image.title="Demp container"
LABEL org.opencontainers.image.description="Container for the Demo"
LABEL org.opencontainers.image.created="%BUILDTIME%"
LABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
LABEL org.opencontainers.image.url="https://build.opensuse.org/package/show/home:aginies:branches:openSUSE:Templates:Images:Tumbleweed/demo-container"
LABEL org.openbuildservice.disturl="%DISTURL%"
LABEL org.opensuse.reference="%%REGISTRY%%/%%TAGPREFIX%%/demo:%%PKG_VERSION%%.%RELEASE%"
LABEL org.openbuildservice.disturl="%DISTURL%"
LABEL com.suse.supportlevel="techpreview"
LABEL com.suse.eula="beta"
LABEL com.suse.image-type="application"
LABEL com.suse.release-stage="prototype"
# endlabelprefix

#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
RUN mkdir /container
COPY start_workload /container
COPY label-install /container
RUN chmod +x /container/start_workload
RUN chmod +x /container/label-install

#ENTRYPOINT [ "/entrypoint.sh" ]

LABEL INSTALL="/usr/bin/docker run --env IMAGE=IMAGE --rm --privileged -v /:/host IMAGE /bin/bash /container/label-install"
