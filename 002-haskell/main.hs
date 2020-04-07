fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = 
    print $ sum $ filter even $ takeWhile (< 4000000) $ map fib [1..]

