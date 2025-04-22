/* Initial beliefs and rules */

// All the goals relevant for role1
role_goal(my_role1, g1).
role_goal(my_role1, g2).

// All the goals relevant for role2
role_goal(my_role2, g1).
role_goal(my_role2, g2).
role_goal(my_role2, g3).

can_achieve(G) :- G == g1 | G == g2 .

// Incorrect implementation (will return true if at least one goal matches):
i_have_plans_for(R) :- role_goal(R, G) & can_achieve(G).

// Correct implementation (will return true if all goals match):
// i_have_plans_for(R) :- not (role_goal(R, G) & not can_achieve(G)).

/* Initial goals */

!start.

/* Plans */

+!start : true <-
    .print("hello world.");
    ?i_have_plans_for(my_role2);
    .print("Yoohooo!").


// { include("$jacamoJar/templates/common-cartago.asl") }
// { include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
// { include("$moiseJar/asl/org-obedient.asl") }
// { include("$moiseJar/asl/org-rules.asl") }
