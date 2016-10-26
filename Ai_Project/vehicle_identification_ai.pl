/*
  vehicle identification ai.

By
Rony Dev Nath ,  Sujon Kumar Dev Krishna, Mohoshin Uddin ,  Jilani Ahmed
 20005                  20009               20018              20019



 */

/* start with ?- go.     */

go :- hypothesize(Vehicle),
      write('I think this is the vehicle of: '),
      write(Vehicle),
      nl,
      undo.
/* hypotheses to be tested */
hypothesize(mohsin)   :- mohsin, !.
hypothesize(shuvo)     :- shuvo, !.
hypothesize(rony)     :- rony, !.
hypothesize(sultan)     :- sultan, !.
hypothesize(asif)     :- asif, !.
hypothesize(jilani)     :- jilani, !.
hypothesize(sujon)     :- sujon, !.
hypothesize(roni)     :- roni , !.
hypothesize(arif)     :- arif , !.
hypothesize(ruman)     :- ruman , !.



hypothesize(unknown).             /* no diagnosis */

/* vehicle identification rules */
mohsin :- bmw,
	   verify(type_car),
           verify(has_red_color),
           verify(has_number_syl444).
shuvo :- ferari,
         verify(type_car),

         verify(has_black_color),
         verify(has_number_dhk1234).
rony :- volkswagen,
	verify(type_car),

	verify(has_blue_color),
	verify(has_number_dhk2134).
sultan :- jaguar,
	verify(type_car),

	verify(has_white_color),
	verify(has_number_sy6543).


asif :- audi,
	verify(type_car),

	verify(has_red_color),
	verify(has_number_la6843).


jilani :- hunk,
	verify(type_motor_bike),

	verify(has_silver_color),
	verify(has_number_syl23583).
sujon :- fz,
	verify(type_motor_bike),

	verify(has_sky_color),
	verify(has_number_syl23783).

roni :- pulser,
	verify(type_motor_bike),

	verify(has_black_color),
	verify(has_number_syl29983).
arif :- dayang,
	verify(type_bi_cycle),

	verify(has_golden_color),
	verify(has_number_sylct2993).
ruman :- phoenix,
	verify(type_bi_cycle),

	verify(has_sky_color),
	verify(has_number_sylct2963).




/* classification rules */
bmw    :- verify(name_bmw), !.

ferari      :- verify(name_ferari), !.
volkswagen    :-verify(name_volkswagen), !.
jaguar    :-verify(name_jaguar), !.
audi    :-verify(name_audi), !.
hunk    :-verify(name_hunk), !.
fz    :-verify(name_fz), !.
pulser    :-verify(name_pulser), !.
dayang    :-verify(name_dayang), !.
phoenix    :-verify(name_phoenix), !.







/* how to ask questions */
ask(Question) :-
    write('Does the vehicle have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.







