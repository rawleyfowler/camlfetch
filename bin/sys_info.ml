type t =
  { os : string
  ; shell : string
  ; hostname : string
  ; version : string
  ; username : string }

let os_not_supported () =
  failwith {|Your operating system is not supported.
            You can submit a PR to add it at:
            https://github.com/rawleyfowler/camlfetch|}

let get_sys_version () =
  let raw =
    Unix.open_process_args_in "uname" [| "-a" |] |> In_channel.input_all
  in
  let raw_s =
    Str.split_delim (Str.regexp " ") raw
  in
  match raw_s with
  | _ :: _ :: version :: _ -> version
  | _ -> os_not_supported ()
;;

let get_sys_username () =
  let passwd =
    Unix.getpwuid @@ Unix.getuid ()
  in
  passwd.pw_name
;;

let get_sys_shell () =
  let passwd =
    Unix.getpwuid @@ Unix.getuid ()
  in
  passwd.pw_shell
;;

let get_sys_os () =
  Unix.open_process_args_in "uname" [||] |> In_channel.input_all
;;

let get_info () : t =
  { os = get_sys_os ()
  ; shell = get_sys_shell ()
  ; hostname = Unix.gethostname ()
  ; version = get_sys_version ()
  ; username = get_sys_username () }
;;

