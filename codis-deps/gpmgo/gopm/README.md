Go Package Manager [![wercker status](https://app.wercker.com/status/899e79d6738e606dab98c915a269d531/s/ "wercker status")](https://app.wercker.com/project/bykey/899e79d6738e606dab98c915a269d531) [![Gopm Download](http://gopm.io/badge/github.com/gpmgo/gopm)](http://gopm.io/github.com/gpmgo/gopm)
=========================

Go Package Manager (gopm) is a package manager and build tool for Go.

**News** Try out [Gopm.io](http://gopm.io), the online version caching and package download service for Go.

**News** Want an online cross-compile and download service? Try [GoBuild.io](http://gobuild.io) and it won't let you down! BTW, it's powered by Gopm.

Please see **[Documentation](https://github.com/gpmgo/docs)** before you start.

## Requirements

- Go development environment: >= **go1.2**

## Installation

We use [gobuild](http://gobuild.io) to do online cross-platform compiling work.  You can see the full available binary list [here](http://gobuild.io/github.com/gpmgo/gopm).

### Install from source code

    go get -u github.com/gpmgo/gopm

The executable will be produced under `$GOPATH/bin` in your file system; for global use purpose, we recommand you to add this path into your `PATH` environment variable.

## Features

- No requirement for installing any version control system tool like `git`, `svn` or `hg` in order to download packages.
- Download, install or build your packages with specific revisions.
- When building programs with `gopm build` or `gopm install`, everything just happens in its own GOPATH and does not bother anything you've done (unless you told it to).
- Can put your Go projects anywhere you want (through `.gopmfile`).

## Commands

```
NAME:
   Gopm - Go Package Manager

USAGE:
   Gopm [global options] command [command options] [arguments...]

VERSION:
   0.8.6.1228 Beta

COMMANDS:
   list		list all dependencies of current project
   gen		generate a gopmfile for current Go project
   get		fetch remote package(s) and dependencies
   bin		download and link dependencies and build binary
   config	configure gopm settings
   run		link dependencies and go run
   test		link dependencies and go test
   build	link dependencies and go build
   install	link dependencies and go install
   clean	clean all temporary files
   update	check and update gopm resources including itself
   help, h	Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --noterm, -n		disable color output
   --strict, -s		strict mode
   --debug, -d		debug mode
   --help, -h		show help
   --version, -v	print the version
```

## License

This project is under the Apache v2 License. See the [LICENSE](LICENSE) file for the full license text.
