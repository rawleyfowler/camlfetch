let info = Sys_info.get_info ()

let () =
  Printf.printf
    "\n%s %s
| %s@%s
| %s\n"
    info.Sys_info.os
    info.Sys_info.version
    info.Sys_info.username
    info.Sys_info.hostname
    info.Sys_info.shell
;;
