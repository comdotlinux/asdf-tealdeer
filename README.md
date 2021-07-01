<div align="center">

# asdf-tealdeer ![Build](https://github.com/comdotlinux/asdf-tealdeer/workflows/Build/badge.svg) ![Lint](https://github.com/comdotlinux/asdf-tealdeer/workflows/Lint/badge.svg)

[tealdeer](https://dbrgn.github.io/tealdeer) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add tealdeer
# or
asdf plugin add tealdeer https://github.com/comdotlinux/asdf-tealdeer.git
```

tealdeer:

```shell
# Show all installable versions
asdf list-all tealdeer

# Install specific version
asdf install tealdeer latest

# Set a version globally (on your ~/.tool-versions file)
asdf global tealdeer latest

# Now tealdeer commands are available
tldr --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/comdotlinux/asdf-tealdeer/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Guruprasad Kulkarni](https://github.com/comdotlinux/)
