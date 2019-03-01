#!/bin/sh

set -eux

# Reset checkout
for f in *-*/build.gradle; do (cd $(dirname $f) && git checkout .); done

# Include gitlab publish config
for f in *-*/build.gradle; do printf '\n\napply from: "../gitlab/publish.gradle"\n' >> $f; done
for f in *-*/build.gradle.kts; do printf '\n\nrootProject.apply { from(rootProject.file("../gitlab/publish.gradle")) }\n' >> $f; done
