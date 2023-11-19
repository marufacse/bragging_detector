go :- hypothesize(Bragging),
       write('I guess that the Bragging types is: '),
       write(Bragging), nl, undo.

 /* hypotheses to be tested */

hypothesize(achievement) :- achievement, !.
hypothesize(action) :- action, !.
hypothesize(feeling) :- feeling, !.
hypothesize(trait) :- trait, !.
hypothesize(possession) :- possession, !.
hypothesize(affiliation) :- affiliation, !.
hypothesize(not_bragging). /* no diagnosis */

/* Bragging detection and classification rules */
achievement :- bragging,(
                verify(successful_completion_or_accomplishment);
                verify(concrete_outcome_of_individual_actions);
                verify(accomplished_goals_awards_and_positive_change);
                verify(accomplished_by_hard_work_ability_or_heroism)).
action :- bragging,
            (verify(doing_something_to_achieve_an_aim_or_deal_with_situation);

            verify(physical_or_mental_activity)).
feeling:- bragging,
               (verify(emotional_state_or_reaction);
               verify(function_or_power_of_perceiving_by_touch);
               verify(mental_or_physical_responsed_by_pleasur_pain_attraction_repulsion)).
trait :- bragging,
             (verify(experience_or_capability);
             verify(skill_or_ability_of_user);
             verify(characteristic_or_quality_of_person)).
possession :- bragging,
                (verify(having_or_owning_or_controlling_something);
                verify(tangible_object_belonging_to_user)).
affiliation :- bragging,
                 (verify(connection_to_something );
                 verify(connected_to_individual_family_group_party_or_business)).
/* classification rules
not_bragging :- verify(selected_statement_unclear_what_the_author_connection_is_to_the_people_or_things_it_mentions), !.
not_bragging :- verify(the_statements_belong_to_someone_other_than_the_author_of_the_tweet).*/

bragging :- verify(statement_is_clear_what_the_author_indicate);
            verify(statement_belong_to_selg-representation).
/* how to ask questions */

ask(Question) :-
        write('Mention '),
        write(Question), write('? '),
         read(Response), nl,
         ( (Response == yes ; Response == y)
         -> assert(yes(Question)) ;
         assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/* How to verify something */
verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))).
/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.






