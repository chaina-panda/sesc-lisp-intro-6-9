;gnu clisp 2.49


(DEFUN APPEND1 (X Y)
       (COND ((CDR X) (CONS (CAR X) (APPEND1 (CDR X) Y)))
             (T (CONS (CAR X) Y))))
(DEFUN REVERSE1 (X)
       (COND ((CDR (CDR X)) (APPEND1 (REVERSE1 (CDR X)) (LIST (CAR X))))
             (T (LIST (CAR (CDR X)) (CAR X)))))

(DEFUN ATOMS (X) (REVERSE1 (ATOMS1 X NIL)))

(DEFUN ATOMS1 (X Y)
    (COND ((NULL X) 
            Y)
          ((ATOM (CAR X)) 
            (ATOMS1 (CDR X) (CONS (CAR X) Y)))
          (T 
            (ATOMS1 (CDR X) (ATOMS1 (CAR X) Y)))) )

(print (ATOMS '((A B) C NIL (D (E F G))) ))