;gnu clisp 2.49

(DEFUN APPEND1 (X Y)
       (COND ((CDR X) (CONS (CAR X) (APPEND1 (CDR X) Y)))
             (T (CONS (CAR X) Y))))
(DEFUN REVERSE1 (X)
       (COND ((CDR (CDR X)) (APPEND1 (REVERSE1 (CDR X)) (LIST (CAR X))))
             (T (LIST (CAR (CDR X)) (CAR X)))))

(DEFUN MERGE1 (X Y) (MERGE2 X Y NIL))

(DEFUN MERGE2 (X Y Z)
       (COND ((NOT (OR X Y)) 
               (REVERSE1 Z))
             ((NULL X) 
               (MERGE2 X (CDR Y) (CONS (CAR Y) Z)))
             ((NULL Y) 
               (MERGE2 (CDR X) Y (CONS (CAR X) Z)))
             ((> (CAR X) (CAR Y)) 
               (MERGE2 X (CDR Y) (CONS (CAR Y) Z)))
             (T 
               (MERGE2 (CDR X) Y (CONS (CAR X) Z)))) )

(print (MERGE1 '(1 3 5) '(2 4)))