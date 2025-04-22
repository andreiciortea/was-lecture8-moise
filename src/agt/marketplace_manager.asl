/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <-
    .print("hello world.");
    !setup_marketplace;
    .print("Autonomous marketplace set up and ready to go!").

+!setup_marketplace : true <-
    createWorkspace(marketplace_wksp);
    joinWorkspace(marketplace_wksp, WkspId);
    makeArtifact(marketplace_org, "ora4mas.nopl.OrgBoard", ["src/org/auction-os.xml"], OrgArtId);
    focus(OrgArtId);
    createGroup(movie_auction_group, auctionGroup, GrArtId);
    focus(GrArtId);
    .broadcast(tell, marketplace(marketplace_wksp, marketplace_org, movie_auction_group)).

{ include("$jacamoJar/templates/common-cartago.asl") }

// { include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
// { include("$moiseJar/asl/org-obedient.asl") }
