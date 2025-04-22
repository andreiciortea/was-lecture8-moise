/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true
  <- .print("hello world.");
     .wait(1000);
     !do_auction("a1", movie("General Magic"));
  .

{ include("inc/auctioneer.asl") }
