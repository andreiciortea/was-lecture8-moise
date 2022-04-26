marketplace_role(auctioneer).

+!do_auction(Id, P)
   <- // creates a scheme to coordinate the auction
      .concat("sch_", Id, SchName);
      createScheme(SchName, doAuction, SchArtId);
      //debug(inspector_gui(on))[artifact_id(SchArtId)];
      setArgumentValue(auction, "Id", Id)[artifact_id(SchArtId)];
      setArgumentValue(auction, "Service", P)[artifact_id(SchArtId)];
      .my_name(Me); setOwner(Me)[artifact_id(SchArtId)];  // I am the owner of this scheme!
      focus(SchArtId);
      addScheme(SchName);  // set the group as responsible for the scheme
      commitMission(mAuctioneer)[artifact_id(SchArtId)].

/* plans for organizational goals */

+!start_auction[scheme(Sch)]                        // plan for the goal start defined in the scheme
   <- .print("Scheme: ", Sch); ?goalArgument(Sch,auction,"Id",Id);   // retrieve auction Id and service description S
      ?goalArgument(Sch,auction,"Service",S);
      .print("Start scheme ",Sch," for ",S);
      makeArtifact(Id, "tools.AuctionArtifact", [], ArtId); // create the auction artifact
      focus(ArtId);  // place observable properties of ArtId into a name space
      // .broadcast(achieve,focus(Id));         // <1>
      start(S);
      //.at("now + 4 seconds", {+!decide(Id)}); // <2>
      .

+!decide_winner[scheme(Sch)]
   <- stop.

+winner(W) : W \== no_winner
   <- ?task(S);
      ?best_bid(V);
      .print("Winner for ", S, " is ",W," with ", V).

+oblUnfulfilled( obligation(Ag,_,done(Sch,bid,Ag),_ ) )[artifact_id(AId)]  // it is the case that a bid was not achieved
   <- .print("Participant ",Ag," didn't bid on time! S/he will be placed in a blocklist");
       // TODO: implement a block list artifact
       admCommand("goalSatisfied(bid)")[artifact_id(AId)].

{ include("inc/marketplace.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
