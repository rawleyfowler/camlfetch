open Camlfetch

let info =
  Sys_info.get_info ()
;;

let ascii =
  let a =
    try
      Sys.getenv "CF_ASCII"
    with Not_found -> "caml"
  in
  Ascii.find a
;;

let pp info ascii () =
  let (total_mem, used_mem) =
    info.Sys_info.memory
  in    
  let info_t =
    [ Printf.sprintf
        "%s@%s"
        info.Sys_info.username
        info.Sys_info.hostname
    ; Printf.sprintf
        "OS: %s %s"
        info.Sys_info.os
        info.Sys_info.version
    ; Printf.sprintf
        "Pkgs: %d"
        info.Sys_info.pkg_count
    ; Printf.sprintf
        "Cpu: %s"
        info.Sys_info.cpu
    ; Printf.sprintf
        "Mem: %dMb / %dMb"
        used_mem
        total_mem
    ; Printf.sprintf
        "Shell: %s"
        info.Sys_info.shell ]
  in
  let ascii_t =
    Str.split_delim (Str.regexp "\n") ascii
    |> List.map (fun s -> s ^ "   ")
  in
  let () =
    print_newline ()
  in
  let rec aux = function
    | (a :: b, i :: g) ->
       print_endline @@ a ^ i;
       aux (b, g)
    | (a :: b, []) ->
       print_endline a;
       aux (b, [])
    | ([], []) -> print_newline ()
    | _ -> failwith "something went terribly wrong!"
  in
  aux (ascii_t, info_t)
;;

let () =
  pp info ascii ()
;;
