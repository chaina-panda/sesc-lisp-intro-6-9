;gnu clisp 2.49

(DEFUN LENGTH1 (X)
       (COND (X (+ (LENGTH1 (CDR X)) 1))
             (T 0)))

(DEFUN SORT1 (X &OPTIONAL (L (LENGTH1 X)))
       (COND ((= L 1) 
              X)
             (T 
              (SORT1 (SORT2 X) (- L 1)))) )

(DEFUN SORT2 (X)
       (COND ((NULL (CDR X)) 
              X)
             ((> (CAR X) (CADR X)) 
              (CONS (CADR X) (SORT2 (CONS (CAR X) (CDDR X)))))
             (T 
              (CONS (CAR X) (SORT2 (CDR X))))) )

(print (SORT1 '(1 5 2 4 3)))