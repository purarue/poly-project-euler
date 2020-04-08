(defn self-power [n]
  "Gives n*n as a BigInteger from an integer"
  (let [big-n, (. java.math.BigInteger (valueOf n))]
    (reduce * (repeat big-n big-n))))

(defn main []
  (let [full-sum, (reduce + (map self-power (range 1 1001)))]
    (println (apply str (take-last 10 (str full-sum))))))

(main)
