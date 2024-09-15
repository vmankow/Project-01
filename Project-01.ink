/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR key = false
VAR whip = false
VAR strength = 0
VAR smarts = 0




 -> setting

== setting == 
You are the ringmaster of a once famous circus. Recently, things have been going strangely wrong. There is a big show tonight. Your task is to navigate through tonight's performance making sure everything runs smoothly. You must save your circus. 

* [Go to opening] -> opening

== opening == 
You are standing behind a curtain, eager and nervous for the show to start. You hear the laughs of children, carnival music loud in the tent, lights beaming bright to illuminate the vibrant atmosphere. Before the show begins, you feel it is a good idea to check on some of the acts. 

+ [ Check in on tiger] -> tiger_check
+ [Check on clowns] -> clowns_check

== tiger_check == 
You walk further backstage where the tiger cage is, only to find it is not there. You begin to panic. There are large paw prints leading to the forest.There is a whip on the floor.

* [Pick up Whip] 
~ whip_pickup = true
-> next
* [Leave whip] 
~ whip_pickup = false
-> next

== next ==
* [Pick up the whip] -> whip
+ [Follow prints] -> follow_prints
+ [Set Trap] -> set_trap

== follow_prints ==
You follow the prints int the forest, but the trail stops abruptly. Suddenly the tiger leaps out at you! 

* [Fight the tiger] -> fight_tiger
* [Run back to circus] -> escape_tiger

== fight_tiger ==
The tiger lunges at you!

{whip_pickup: 
You crack the whip! The tiger steps back in fear. You crack it again! The tiger now obeys you, you subdue it. 
-> subdue_tiger
}

{whip_pickup: 
Without any weapon, the tiger overpowers you. You retreat back to the circus. 
-> escape_tiger
}

== subdue_tiger ==
You safely return the tiger to its cage. The show can go on. 

-> discover_truth

== escape_tiger ==
You run back to the circus to warn everyone. 


-> discover_truth


== clowns_check ==
You routinely check on the clowns to make sure everything is in place for the show. However, they have had a mischevious look recently which leads you to be suspicious. Because of this, you decide to eavesdrop on their tent. 


+ [Eavesdrop]

You stand by the door and listen in on the clowns. In doing so, you hear remarks about how they hate their job and how they deserve more respect. They hate being laughed at all of the time. Tonight they plan to take action by lighting the tent on fire as the grand finale. What will you do? 

+ [Confont the clowns] -> confront
+ [Retreat and come up with a plan] -> retreat_plan


== confront == 
You barge into the clowns' tent. Their faces go blank, and then they all put on an evil smile. You try to turn back, but they overpower you and force you into a hanging cage. 

-> END


== retreat_plan ==
You run onto the stage, frantic. You start screaming fire, fire, fire! Everyone starts laughing because they think it is a joke. All but one of the clowns come out and put on an act to make everything seem fine. The one missing strikes a match and throws it on the floow. The tent goes up in flames. 

-> END


== discover_truth ==
After surviving the clown or tiger, you see a trail of black smoke coming from a bush in the corner. It is a poison plant called Madroot. There is a bottle of its essence labeled: for clowns. Someone has been poisoning the circus! Do you run away or seek justice for the circus? 

+ [ Seek Justice]-> justice
+ [ Escape] -> escape

== escape == 

You attempt to flee the evil being who seeks to destroy your circus. You escape, but your circus dies.
-> END

== justice == 

You fight the evil being who is trying to destroy your circus. You win and find the anecdote in his pocket. You give it to the clowns right before they set the tent on fire. Everyone is saved. 

-> END









