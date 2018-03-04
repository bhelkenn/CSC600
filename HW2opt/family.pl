/* genders */
is_male(brady).
is_male(john).
is_male(will).
is_male(charles).
is_male(richard).
is_male(frank).
is_male(william).
is_male(helkenn).
is_female(nadine).
is_female(patricia).
is_female(sydrah).
is_female(rose).
is_female(beers).

/* relationship facts */
is_parent_of(nadine,brady).
is_parent_of(nadine,john).
is_parent_of(nadine,will).
is_parent_of(charles,brady).
is_parent_of(charles,john).
is_parent_of(charles,will).
is_parent_of(frank,charles).
is_parent_of(frank,patricia).
is_parent_of(rose,charles).
is_parent_of(rose,patricia).
is_parent_of(beers,nadine).
is_parent_of(beers,richard).
is_parent_of(william,frank).
is_parent_of(helkenn,william).

/* inference rules */
mother(MOTHER, CHILD) :- is_parent_of(MOTHER, CHILD), is_female(MOTHER).
father(FATHER, CHILD) :- is_parent_of(FATHER, CHILD), is_male(FATHER).

sibling1(NAME1, NAME2) :- is_parent_of(PARENT, NAME1), is_parent_of(PARENT, NAME2), NAME1 \= NAME2.
brother1(NAME1, NAME2) :- sibling1(NAME1, NAME2), is_male(NAME2).
sister1(NAME1, NAME2) :- sibling1(NAME1, NAME2), is_female(NAME2).

sibling2(NAME1, NAME2) :- is_parent_of(PARENT1, NAME1), is_parent_of(PARENT2, NAME2), 
                          PARENT1 \= PARENT2, NAME1 \= NAME2, !, is_parent_of(PARENT1, NAME2), 
                          is_parent_of(PARENT2, NAME1).
brother2(NAME1, NAME2) :- sibling2(NAME1, NAME2), is_male(NAME2).
sister2(NAME1, NAME2) :- sibling2(NAME1, NAME2), is_female(NAME2).

cousin(NAME1, NAME2) :- is_parent_of(PARENT1, NAME1), is_parent_of(PARENT2, NAME2), 
                        PARENT1 \= PARENT2, NAME1 \= NAME2, !, sibling1(PARENT1, PARENT2).
uncle(UNCLE, CHILD) :- is_male(UNCLE), sibling1(UNCLE, PARENT), is_parent_of(PARENT, CHILD).
aunt(AUNT, CHILD) :- is_female(AUNT), sibling1(AUNT, PARENT), is_parent_of(PARENT, CHILD).

grandparent(GRANDPARENT, GRANDCHILD) :- is_parent_of(GRANDPARENT, PARENT), 
                                        is_parent_of(PARENT, GRANDCHILD).
grandmother(GRANDMOTHER, GRANDCHILD) :- grandparent(GRANDMOTHER, GRANDCHILD), is_female(GRANDMOTHER).
grandfather(GRANDFATHER, GRANDCHILD) :- grandparent(GRANDFATHER, GRANDCHILD), is_male(GRANDFATHER).
grandchild(GRANDCHILD, GRANDPARENT) :- is_parent_of(PARENT, GRANDCHILD), 
                                       is_parent_of(GRANDPARENT, PARENT).

greatgrandparent(GREATGRANDPARENT, GREATGRANDCHILD) :- is_parent_of(GREATGRANDPARENT, GRANDPARENT), 
                                                       grandparent(GRANDPARENT, GREATGRANDCHILD).
ancestor(ANCESTOR, CHILD) :- grandparent(ANCESTOR, GRANDPARENT), grandparent(GRANDPARENT, CHILD).
