role_goal(R, G) :-
    role_mission(R, _, M) & 
    mission_goal(M, G).

has_plans_for(G) :-
    .relevant_plans({+!G[scheme(_)]}, LP) & LP \== [].

i_have_plans_for(R) :-
    not (role_goal(R, G) & not has_plans_for(G)).

my_role(R) :-
    role(R, _) & i_have_plans_for(R).

+!setup_marketplace : true <-
    createWorkspace(autonomous_marketplace);
    joinWorkspace(autonomous_marketplace, WkspId);
    makeArtifact(marketplace, "ora4mas.nopl.OrgBoard", ["src/org/auction-os.xml"], OrgArtId);
    focus(OrgArtId);
    .broadcast(tell, marketplace(autonomous_marketplace,marketplace)).

+marketplace(WkspName, OrgArtName, GroupArtName)[source(marketplace_manager)] : true <-
    .print("Joining marketplace: ", WkspName, " " , OrgArtName, " ", GroupArtName);
    joinWorkspace(WkspName, WkspId);
    focusWhenAvailable(OrgArtName)[wid(WkspName)];
    focusWhenAvailable(GroupArtName)[wid(WkspName)];
    // ?marketplace_role(Role);
    ?my_role(Role);
    // .print("Checking that I can enact role: ", Role);
    // ?i_have_plans_for(Role);
    .print("Adopting role ", Role, " in group: ", GroupArtName);
    adoptRole(Role).

{ include("$moiseJar/asl/org-rules.asl") }
