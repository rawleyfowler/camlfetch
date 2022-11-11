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

let find uname =
  match Hashtbl.find_opt ascii_hash uname with
  | None -> caml
  | Some s -> s
;;
