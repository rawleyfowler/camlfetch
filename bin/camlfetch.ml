let info = Sys_info.get_info ()

let () =
  Printf.printf
    "%s %s | %s@%s | %s"
    info.Sys_info.os
    info.Sys_info.version
    info.Sys_info.username
    info.Sys_info.hostname
    info.Sys_info.shell
;;
