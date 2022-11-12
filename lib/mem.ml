let failed_to_get_mem os () =
  failwith @@ Printf.sprintf "Failed to read memory for OS: %s" os
;;

let get_sys_mem_freebsd () =
  let total_mem =
    (Util.capture_process "sysctl -n hw.physmem" ()
     |> String.trim
     |> int_of_string) / 1024 / 1024
  in
  let (page_size, inactive_count, free_count, cache_count) =
    match
      Util.capture_process "sysctl -n hw.pagesize vm.stats.vm.v_inactive_count vm.stats.vm.v_free_count vm.stats.vm.v_cache_count" ()
      |> String.trim
      |> Str.split_delim (Str.regexp "\n")
      |> List.map (fun s -> int_of_string_opt @@ String.trim s)
    with
    | [Some a; Some b; Some c; Some d] -> (a, b, c, d)
    | _ -> failed_to_get_mem "freebsd" ()
  in
  let rem_mem =
    total_mem - ((inactive_count + free_count + cache_count) * page_size / 1024 /1024)
  in
  (total_mem, rem_mem)
;;

let get_sys_mem_openbsd () =
  let total_mem =
    (Util.capture_process "sysctl -n hw.physmem" ()
     |> String.trim
     |> int_of_string) / 1024 / 1024
  in
  (* This was translated from sh to OCaml from dylanaraps/pfetch on github *)
  let rem_mem =
    let mem_line =
      match Util.capture_process "vmstat" () |> Str.split_delim (Str.regexp "\n") with
      | _ :: _ :: t :: [] -> t
      | _ -> failed_to_get_mem "openbsd" ()
    in
    let res  =
      match Str.split_delim (Str.regexp " ") mem_line with
      | _ :: _ :: t :: _ -> t
      | _ -> failed_to_get_mem "openbsd" ()
    in
    Str.replace_first (Str.regexp "M") "" res
    |> int_of_string
  in
  (total_mem, rem_mem)
;;
