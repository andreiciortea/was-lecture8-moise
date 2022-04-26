/* Initial beliefs and rules */
role_goal(my_role, g1).
role_goal(my_role, g2).
role_goal(my_role, g3).

has_plans_for(G) :- G == g1 | G == g2 | G == g3.

i_have_plans_for(R) :- not (role_goal(R, G) & not has_plans_for(G)).

/* Initial goals */

!start.

/* Plans */

+!start : true <-
    .print("hello world.");
    ?i_have_plans_for(my_role).

// { include("$jacamoJar/templates/common-cartago.asl") }
// { include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
// { include("$moiseJar/asl/org-obedient.asl") }
// { include("$moiseJar/asl/org-rules.asl") }
