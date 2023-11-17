(defrule p1
   ?p1<-(start)=>
   (printout t"Is the library closed?")
   (assert (close (read)))
   (retract ?p1))
(defrule p2
   (close no)
   =>
   (printout t "Does the user have more than 2 overdue books?")
   (assert (overdue (read))))
(defrule p3
   (close no)
   (overdue no)
   =>
   (printout t "Is there a book section in the field the user is searching for?")
   (assert (field (read))))
(defrule p4
   (close no)
   (overdue no)
   (field yes)
   =>
   (printout t "Is the book available?")
   (assert (available (read))))
(defrule p5
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   =>
   (printout t "Is the book in a restricted section?")
   (assert (restricted (read))))
(defrule p6
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   =>
   (printout t "Is the book being repaired?")
   (assert (repaired (read))))
(defrule p7
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired no)
   =>
   (printout t "Is the book on hold for another user?")
   (assert (hold (read))))
(defrule rule1
   (close yes)
   =>
   (printout t "no books available for checkout" crlf)
   (clear))
(defrule rule2
   (close no)
   (overdue yes)
   =>
   (printout t "user may not checkout more books" crlf)
   (clear))
(defrule rule3
   (close no)
   (overdue no)
   (field no)
   =>
   (printout t "book not available" crlf)
   (clear))
(defrule rule4
   (close no)
   (overdue no)
   (field yes)
   (available no)
   =>
   (printout t "book not available" crlf)
   (clear))
(defrule rule5
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted yes)
   =>
   (printout t "Availability may be limited" crlf)
   (clear))
(defrule rule6
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired no)
   (hold yes)
   =>
   (printout t "book not available" crlf)
   (clear))
(defrule rule7
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired no)
   (hold no)
   =>
   (printout t "book is available" crlf)
   (clear))
(defrule p8
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired yes)
   =>
   (printout t "Is the repair completion date known?")
   (assert (date (read))))
(defrule p9
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired yes)
   (date yes)
   =>
   (printout t "Is the current date past the repair completion date?")
   (assert (past (read))))
(defrule rule8
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired yes)
   (date no)
   =>
   (printout t "book not available" crlf)
   (clear))
(defrule rule9
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired yes)
   (date yes)
   (past yes)
   =>
   (printout t "book available for checkout" crlf)
   (clear))
(defrule rule10
   (close no)
   (overdue no)
   (field yes)
   (available yes)
   (restricted no)
   (repaired yes)
   (date yes)
   (past no)
   =>
   (printout t "book not available" crlf)
   (clear))
