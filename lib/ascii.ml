let caml =
{eos|          ,,_
          (=-'   
    /\/\  ))   
 ~\/    \/ |    
  | )___(  |    
  |/     \||  
  |'      |'    |eos}
;;

let ascii_hash : (string, string) Hashtbl.t =
  Hashtbl.create 10
;;
 
let () =
  Hashtbl.add ascii_hash "caml" caml
;;

let find name =
  match Hashtbl.find_opt ascii_hash name with
  | None -> caml
  | Some s -> s
;;
