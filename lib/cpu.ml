let freebsd () =
  Util.capture_process "sysctl -n hw.model" ()
  |> String.trim
;;

let dragonflybsd =
  freebsd
;;

let openbsd () =
  Util.capture_process "sysctl -n hw.version" ()
  |> String.trim
;;

let netbsd () =
  Util.capture_process "sysctl -n machdep.dmi.system-vendor machdep.dmi.system-product" ()
  |> String. trim
;;
