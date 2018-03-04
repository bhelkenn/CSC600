/* facts */
teaches(jozo, csc600).
teaches(tim, comm150).
teaches(yoon, csc631).
teaches(abc, astr14).
teaches(xyz, csc340).
teaches(tim, comm250).
teaches(tim, comm350).

freshman(comm150).
freshman(astr14).
sophomore(csc340).
sophomore(comm250).
junior(csc600).
junior(comm350).
senior(csc631).
morning(astr14).
morning(csc340).
morning(comm250).
morning(comm350).
afternoon(comm150).
afternoon(csc600).
afternoon(csc631).
tth(comm150).
tth(comm250).
tth(comm350).
tth(csc631).
mwf(astr14).
mwf(csc600).
mwf(csc340).

/* inference rules */
teaches_freshman(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), freshman(CLASS).
teaches_sophomore(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), sophomore(CLASS).
teaches_junior(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), junior(CLASS).
teaches_senior(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), senior(CLASS).
teaches_morning(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), morning(CLASS).
teaches_afternoon(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), afternoon(CLASS).
teaches_whole_day(INSTRUCTOR) :- teaches_morning(INSTRUCTOR), teaches_afternoon(INSTRUCTOR).
works_mwf(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), mwf(CLASS).
works_tth(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), tth(CLASS).
teaches_three_classes(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS1), teaches(INSTRUCTOR, CLASS2), 
                                     CLASS1 \= CLASS2, !, teaches(INSTRUCTOR, CLASS3), 
                                     CLASS2 \= CLASS3.
