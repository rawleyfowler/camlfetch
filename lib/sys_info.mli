type t =
  { os : string
  ; pkg_count : int
  ; cpu : string
  ; memory : int * int
  ; shell : string
  ; hostname : string
  ; version : string
  ; username : string }

(** Gets the number of packages installed on the system.
    Returns [0] if the system is unsupported *)
val get_sys_pkg_count : string -> unit -> int;;

(** Gets the system version. For example: 13.1-RELEASE-p3 *)
val get_sys_version : unit -> string;;

(** Returns the [username] of the executing user on the system *)
val get_sys_username : unit -> string;;

(** Returns the current running shell for the executing user.
    I.e: ["bash"], ["zsh"], etc. *)
val get_sys_shell : unit -> string;;

(** Returns string [name] of the current operating system *)
val get_sys_os : unit -> string;;

(** Takes a valid OS name. Returns a string describing the host cpu *)
val get_sys_cpu : string -> unit -> string;;

(** Takes in a string [os], and returns an int * int of
    [(total_mem, used_mem)]. If the OS is not supported, returns [(0,0)]. *)
val get_sys_mem : string -> unit -> int * int;;

(** Returns a recrod [t] of all relevant system info of [Sys_info.t] *)
val get_sys_info : unit -> t;;




