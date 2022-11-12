# camlfetch
A simple camel based system fetching tool for Unix systems, written in the only
true camel langauge.
```
          ,,_   rf@doom
          (=-'      OS: FreeBSD 13.1-RELEASE-p3
    /\/\  ))      Pkgs: 436
 ~\/    \/ |       Cpu: AMD Ryzen 7 3700X 8-Core Processor
  | )___(  |       Mem: 9698Mb / 16256Mb
  |/     \||     Shell: bash
  |'      |'       
```

## How to install
Make sure that you have [opam](https://opam.ocaml.org/doc/Install.html),
then run the following commands (assuming you're using zsh or bash):
```shell
opam switch create 4.14.0 && opam install dune
eval $(opam env)
make install
camlfetch
```

## Fully supported operating systems
- [FreeBSD](https://www.freebsd.org/)
- [DragonflyBSD](https://www.dragonflybsd.org/)
- [OpenBSD](https://www.openbsd.org/)

## Planned OS support
- NetBSD
- GNU/Linux

## Contributing
Camlfetch is open to any and all contributions! I'm hoping that we can build a
glorious army of ascii camels. OS support would be great too! However, I have
no interest in supporting non-free operating systems.

## License
Camlfetch is provided under the MIT license. Please read the `LICENSE` file
at the root of the project for more information.