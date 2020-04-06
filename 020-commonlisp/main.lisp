(defun factorial (num)
  "calculate the factorial of the integer num"
  (if (= num 1)
    num
    (* num (factorial (- num 1))))
  )

(defun digitsum (char-list &optional (listsum 0))
  "Given a list of characters (char-list), caluclates the digit sum"
  (if (endp char-list) ;; if list is empty
    listsum
    (digitsum
     (cdr char-list) ;; call with rest of list
     (+ listsum (digit-char-p (car char-list))))
  )
  )

(defun int-to-char-list (num)
  "Converts an integer to a list of characters"
  (coerce (write-to-string num) 'list)
  )

(defun main ()
  (print (digitsum (int-to-char-list (factorial 100))))
  (terpri)
  )
