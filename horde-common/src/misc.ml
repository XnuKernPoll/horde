let string_list_t =
  let open Depyt in
  list string

let from_result res =
  match res with
  | Ok x -> Some x
  | Error x -> None 

let encode_string_list l =
  Fmt.strf "%a \n" (Depyt.pp_json string_list_t) l 

let decode_string_list body =
   let decoder = Jsonm.decoder (`String body) in 
   Depyt.decode_json string_list_t decoder |> from_result 
