let get_sys_cpu_freebsd () =
  Util.capture_process "sysctl -n hw.model" ()
  |> String.trim
;;

let get_sys_cpu_openbsd () =
  Util.capture_process "sysctl -n hw.version" ()
  |> String.trim
;;
