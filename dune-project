(lang dune 3.4)

(name camlfetch)
(version bf9efe7)
(generate_opam_files true)

(package
 (maintainers "Rawley Fowler <rawleyfowler@gmail.com>")
 (name camlfetch)
 (allow_empty)
 (synopsis "A simple system fetching tool")
 (depends
   (ocaml (>= 4.14))
   dune
   unix
   str)
 (tags
  (topics fetch)))

(source
 (github rawleyfowler/camlfetch))
