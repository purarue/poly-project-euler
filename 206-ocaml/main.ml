let rec combine_into_concealed_rec l1 l2 result =
  match l1, l2 with
  (* l2 has one less item than l1, if its empty, then just append l1s last item and return *)
  | hd::[], [] -> int_of_string (result ^ hd)
  (* both still have values, extract head and zip onto result *)
  | a::l1_tl, b::l2_tl -> combine_into_concealed_rec l1_tl l2_tl (result ^ a ^ String.make 1 b)
  | _, _ -> raise (Invalid_argument "unexpected list size")
;;

(* intersperses the integer x into the pattern to create a possible concealed square*)
let combine_into_concealed x =
  combine_into_concealed_rec
    ["1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"; "0" ]
    (List.of_seq (String.to_seq (Printf.sprintf "%09d" x)))
    ""
;;

let is_perfect_square x = Float.is_integer (sqrt (Float.of_int x))

(* iterate through all possible concealed squares, checking if the sqrt is an integer *)
let rec solve x =
  let c = combine_into_concealed x in
  match is_perfect_square c with
    | true -> Printf.printf "%d\n" (Float.to_int (sqrt (Float.of_int c)))
    | false -> solve (x - 1)
;;

(* maximum value that this can have, to be able to intersperse into 9 digits *)
solve 999999999
