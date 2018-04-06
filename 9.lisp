;gnu clisp 2.49


(DEFUN MAKE-CAR-CDR (S X Q) 
       (STR (AMT S X 1) Q) )

(DEFUN AMT (S X L) 
       (COND ((NULL S)
              NIL)
             ((EQ (CAR S) X) 
              L)
             (T 
              (AMT (CDR S) X (+ L 1)))) )

(DEFUN STR (L ANSWER) 
       (COND ((NULL L)
              NIL)
             ((= L 1) 
              (CONS 'CAR (CONS ANSWER NIL)))
             (T
              (STR (- L 1) (CONS 'CDR (CONS ANSWER NIL))))) )

(print (MAKE-CAR-CDR '(A X B) 'X 'Q))