let capture_process proc () =
  Unix.open_process_in proc |> In_channel.input_all
;;
