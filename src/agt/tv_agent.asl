/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <-
    .print("hello world.");
    .wait(1000);
    !do_auction("a1", movie("General magic")).

{ include("inc/auctioneer.asl") }

// { include("$jacamoJar/templates/common-cartago.asl") }
// { include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
// { include("$moiseJar/asl/org-obedient.asl") }
// { include("$moiseJar/asl/org-rules.asl") }
