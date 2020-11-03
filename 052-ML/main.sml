(* split a number into into a set of digits *)
fun splitInt num =
  IntListSet.fromList (List.map Option.valOf (List.map (fn (item) => Int.fromString
  (Char.toString item)) (explode (Int.toString num))));

fun permutedMult base mult =
  if mult = 6 then base else (* found the result *)
  (* current digit set is the same as next multiplier, recurse *)
  if (IntListSet.equal
        ((splitInt (base * mult)),
          (splitInt (base * (mult + 1)))))
  then
    permutedMult base (mult + 1)
  (* this number failed the check for being the same as its multiple, increment 'base' to try next number *)
  else
    permutedMult (base + 1) 1;

(* can start at 10, obviously value under that couldn't have the same digits as
* its multiples *)
val _ = print (Int.toString (permutedMult 10 1));

OS.Process.exit(OS.Process.success);
