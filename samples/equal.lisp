; Taken from page 11 of Lisp 1.5 Programmer's Manual 2nd Edition
; Indentation preserved.
(LABEL EQUAL (LAMBDA (X Y) (COND
  ((ATOM X) (COND ((ATOM Y) (EQ X Y)) ((QUOTE T) (QUOTE F))))
  ((EQUAL (CAR X) (CAR Y)) (EQUAL (CDR X) (CDR Y)))
  ((QUOTE T) (QUOTE F)))))
