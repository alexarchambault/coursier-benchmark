#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

export COURSIER_CACHE="$(pwd)/coursier-cache"

if [ -e "$COURSIER_CACHE" ]; then
  echo "Wiping $COURSIER_CACHE" 1>&2
  rm -rf "$COURSIER_CACHE"
fi

git checkout project/plugins.sbt # just in case

echo "sbt-coursier durations, cache empty:"
sbt update updateClassifiers 2>&1 | grep "Total time"

echo "sbt-coursier durations, cache full:"
sbt update updateClassifiers 2>&1 | grep "Total time"

IVY_HOME="$(pwd)/ivy2"

if [ -e "$IVY_HOME" ]; then
  echo "Wiping $IVY_HOME" 1>&2
  rm -rf "$IVY_HOME"
fi

rm -f project/plugins.sbt

echo "SBT/Ivy durations, cache empty:"
sbt -Dsbt.ivy.home="$IVY_HOME" update updateClassifiers 2>&1 | grep "Total time"

echo "SBT/Ivy durations, cache full:"
sbt -Dsbt.ivy.home="$IVY_HOME" update updateClassifiers 2>&1 | grep "Total time"

git checkout project/plugins.sbt
