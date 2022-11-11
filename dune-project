(lang dune 3.4)

(name camlfetch)
(generate_opam_files true)

(package
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
 
