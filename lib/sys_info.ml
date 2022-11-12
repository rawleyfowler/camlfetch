type t =
  { os : string
  ; pkg_count : int
  ; cpu : string
  ; memory : int * int
  ; shell : string
  ; hostname : string
  ; version : string
  ; username : string }

let os_not_supported () =
  failwith "Your operating system is not supported.\nYou can submit a PR to add it at: https://github.com/rawleyfowler/camlfetch"
;;

(** Takes a string [os] and counts the packages installed on the current system depending on the OS *)
let get_sys_pkg_count os () =
  let open Pkg in
  match os with
  | "freebsd" -> freebsd ()
  | "dragonfly" | "dragonflybsd" -> dragonflybsd ()
  | "openbsd" -> openbsd ()
  | "netbsd" -> netbsd ()
  | _ -> 0
;;

(** Returns string [version] of the version of the current system *)
let get_sys_version () =
  let raw =
    Util.capture_process "uname -a" ()
  in
  let raw_s =
    Str.split_delim (Str.regexp " ") raw
  in
  match raw_s with
  | _ :: _ :: version :: _ -> version
  | _ -> os_not_supported ()
;;

(** Returns string [username] of the executing user on the system *)
let get_sys_username () =
  let passwd =
    Unix.getpwuid @@ Unix.getuid ()
  in
  passwd.pw_name
;;

(** Returns string [shell] of the users shell *)
let get_sys_shell () =
  let passwd =
    Unix.getpwuid @@ Unix.getuid ()
  in
  passwd.pw_shell
  |> Str.split_delim (Str.regexp "/")
  |> List.rev
  |> List.hd
;;

(** Returns string [name] of the current operating system *)
let get_sys_os () =
  Util.capture_process "uname" ()
  |> String.trim
;;

(** Takes a string [os] and returns the CPU/Host on the executing system *)
let get_sys_cpu os () =
  let open Cpu in
  match os with
  | "freebsd" -> freebsd ()
  | "dragonflybsd" | "dragonfly" -> dragonflybsd ()
  | "openbsd" -> openbsd ()
  | "netbsd" -> netbsd ()
  | _ -> os_not_supported ()
;;

(** Takes in a string [os], and returns an int * int of [(total_mem, used_mem)] *)
let get_sys_mem os () =
  let open Mem in
  match os with
  | "freebsd" -> freebsd ()
  | "dragonfly" | "dragonflybsd" -> dragonflybsd ()
  | "openbsd" -> openbsd ()
  | "netbsd" -> netbsd ()
  | _ -> os_not_supported ()
;;

let os =
  get_sys_os ()
;;

let os_lower =
  String.lowercase_ascii os
;;

(** Returns an aggregated list of all relevant system info of [Sys_info.t] *)
let get_info () : t =
  { os
  ; pkg_count = get_sys_pkg_count os_lower ()
  ; cpu = get_sys_cpu os_lower ()
  ; memory = get_sys_mem os_lower ()
  ; shell = get_sys_shell ()
  ; hostname = Unix.gethostname ()
  ; version = get_sys_version ()
  ; username = get_sys_username () }
