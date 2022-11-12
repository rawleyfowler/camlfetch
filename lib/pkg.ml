let count_lines input =
  Str.split_delim (Str.regexp "\n") input |> List.length
;;

let freebsd () =
  Util.capture_process "pkg info" () |> count_lines
;;

let dragonflybsd =
  freebsd
;;

let openbsd () =
  Util.capture_process "printf '%s\n' /var/db/pkg/*/" () |> count_lines
;;

let netbsd () =
  Util.capture_process "pkg_info" () |> count_lines
;;

