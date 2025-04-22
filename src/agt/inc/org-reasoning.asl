role_goal(R, G) :-
    role_mission(R, _, M) & 
    mission_goal(M, G).

can_achieve(G) :-
    .relevant_plans({+!G[scheme(_)]}, LP) & LP \== [].

i_have_plans_for(R) :-
    not (role_goal(R, G) & not can_achieve(G)).

my_role(R) :-
    role(R, _) & i_have_plans_for(R).

// Plan used to bootstrap the marketplace
+marketplace(WkspName, OrgArtName, GroupArtName)[source(marketplace_manager)] : true
  <- .print("Joining marketplace: ", WkspName, " " , OrgArtName, " ", GroupArtName);
     joinWorkspace(WkspName, WkspId);
     focusWhenAvailable(OrgArtName)[wid(WkspName)];
     focusWhenAvailable(GroupArtName)[wid(WkspName)];
     ?marketplace_role(Role);
    //  .print("Checking that I can enact role: ", Role);
    //  ?i_have_plans_for(Role);
    //  ?my_role(Role);
     .print("Adopting role ", Role, " in group: ", GroupArtName);
     adoptRole(Role);
  .

{ include("$moiseJar/asl/org-rules.asl") }
