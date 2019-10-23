Simple [`scalafmt`](https://github.com/scalameta/scalafmt) packaging as a Docker
Hub automated build.

In most cases, you may prefer to use https://github.com/mroth/scalafmt-native
which does not require the JVM and thus starts significantly faster, however
this version exists as a backup for when that is infeasible (or when the current
version is not buildable in native for some reason.)
