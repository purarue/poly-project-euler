let sqrtint n = (float >> sqrt >> int) n

let isPrime n =
  [ 2 .. sqrtint n ]
  |> List.forall ( fun x -> n % x <> 0)

// cycles a list, starting at 'from'
// Once you reach the end of the list
// wrap around to the beginning, till you hit from - 1
// returns a joined string of the result
let cycle (lst: List<char>) (from: int) =
  [ for i in from..(lst.Length + from - 1) do yield lst.[i % lst.Length] ]
  |> Seq.fold ( fun acc c -> acc + (string c)) ""

// cycles a number
// e.g. 123 -> [123, 231, 312]
let cycleNum (n: int) =
  let nseq = sprintf "%i" n |> Seq.toList
  // initialize 'n' of the same sequence, so we can cycle through iterations
  List.init nseq.Length ( fun _ -> nseq )
  |> Seq.mapi ( fun i nx -> cycle nx i )
  // parse back to integers
  |> Seq.map System.Int32.Parse

let isCircularPrime (n: int) = cycleNum n |> Seq.forall isPrime

let rec circularPrimeAcc (st: Set<int>) (cur: int) (till: int) =
  // base case
  if cur >= till then st
  // already been processed on some other recurse
  elif st.Contains(cur) then circularPrimeAcc st (cur + 1) till
  // this is a circular prime, add all cycles
  elif isCircularPrime cur then circularPrimeAcc (Set.union st (cycleNum cur |> Set.ofSeq)) (cur + 1) till
  // not a circular prime, continue
  else circularPrimeAcc st (cur + 1) till

[<EntryPoint>]
let main _ =
  circularPrimeAcc Set.empty 2 1000000
  |> Set.count
  |> printf "%d\n"
  0
