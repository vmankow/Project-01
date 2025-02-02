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

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR hunger = 0
VAR vines = 1
VAR visited_waterfall = 0
VAR visited_east_path = 0
VAR visited_west_path = 0

-> abduct

== abduct ==
One night, you are awaken from a deep sleep to a light so bright it pierces through your closed eyes. Blinded and afraid, you feel yourself begin to float! Seconds pass- maybe a minute. Higher and higher you go. When will this all be over?! Crash... you fall hard onto a cold metallic floor. As your vision restores, you are able to make out a few large egg shapes. Are they green? Oh no... ALIENS! What do you choose to do next? 

+ [ fight back ] -> fight 
+ [succumb] -> succumb

== fight ==
You kick and punch with all of your energy yet none of them are the slightest bit startled. Can they not feel pain? While contemplating escape plans, one of the aliens spits a neon goo onto your arm. As the sludge slides down your body, you thoughts subside and your eyes become heavy.
-> wake_up

== succumb
The tallest alien pulls a lever and a heavy gas spills out from vents all around you. After you inhale the heavy mist, your vision and mind go blank.
-> wake_up

== wake_up ==
You wake up to the feeling of dirt below you. When you look around, there are no signs of the aliens. As you pick yourself up, something feels wierd... did you lose 50 pounds? You try to take a step forward but your leg is moving oddly slow. Oh no- LOW GRAVITY!

~ hunger +=1
{ hunger >= 5: -> hunger_faint }

+ [move onwards] -> move_onwards
* [panic] -> panic

== panic ==
You realize you are not on Earth any longer. You are all by yourself on a foreign planet! With nobody else in sight! No sigm of life. Your chest becomes tight, your vision goes blurry, your head is building immense pressure. You can hardly stand anymore. Your legs begin to wobble and your body loses all strength.  

-> END



== move_onwards== 
You walk along an open flatland plain. Something glimmers in the daylight. You want to go explore it. 
~ hunger +=1
{ hunger >= 5: -> hunger_faint }

-> explore

== explore ==
Before you stands a lush waterfall. Off in the distance, you hear what sounds like a bark. A three-eyed puppy runs out wagging its tail. The new environment is less intimidating now. What is your pet's name?

* [Scout] 
    ~ pet_name = "Scout" 
    -> waterfall
* [Marty]
    ~ pet_name = "Marty"
    -> waterfall
* [Blue]
    ~ pet_name = "Blue"
    -> waterfall

-> waterfall

== waterfall ==
{ visited_waterfall == 0:
You step toward the edge of the waterfall and see lush forests of fruitiful trees down below. Your mouth waters at the thought of sweet fruit. Suddenly, a breeze picks up behind you causing you to lose your balance. You fall forward off the edge. You wake up and it is night. How did you not die on impact? Must be because of the low gravity.
}
{ visited_waterfall > 0: 
You return to the waterfall, its rushing sound is soothing in the eerie alien landscape. 
}
~ visited_waterfall += 1


{torches == 0: There is a torch on the floor.} There is a path illuminated before you splitting to the east and west 
+ [walk the east path] -> east_path
+ [walk the west path] -> west_path
* {torches == 0} [Pick up the torch] -> torch_pickup

=== torch_pickup ===
You now have a torch. May it light the way. 
~ torches += 1
* [Go back] -> waterfall


== hunger_faint == 
Your body weakens as hunger overtakes you. Your head is pounding, stomach beyond empty. You pass out and don't regain consciousness until hours later.
-> waterfall

== east_path ==

~ hunger +=1
{ hunger >= 5: -> hunger_faint }

{ visited_east_path == 0:
You are in the east path. The area starts to dim. It is very dark, you can't see anything. You remember the torch you found earlier. 
}
{ visited_east_path > 0:
You return to the east path. The dimness is no longer unfamiliar.
}
~ visited_east_path += 1
* { torches > 0 } [Light Torch] -> east_path_lit 
+ [Go back] -> waterfall

== west_path ==

~ hunger +=1
{ hunger >= 5: -> hunger_faint }

{ visited_west_path == 0:
You are in the west. It gets darker and darker as you walk. Fear of what may lie ahead begins to crowd your mind. 
}
{ visited_west_path > 0: 
You are extra cautious to avoid the west path because it scared you last time. 
} 
~ visited_west_path +=1 
{ pet_name == "Scout": Scout would protect me if something bad happened... right?| }
* [Move Onwards] -> encounter_bugs
+ [Go back] -> waterfall
-> END 

== encounter_bugs ==
You are walking when you hear a crack on the ground. Did you maybe step on a twig? Not thinking much of it, you take another step. The floor caves beneath you. With nobody around to hear your screams, tears well up in your eyes. You hear buzzing in all directions. Poke, jab, stab. Fiery needles are piercing all over your skin. Unearthly bugs swarm your body. Painful and slow, you collapse. 
+ [Fight the bugs] -> death

== death == 
You try to fight off the bugs, but there are too many of them. There are bites all over your body. You feel warmth everywhere, but you have never been so cold before. You die. 
-> END

== pick_fruit ==
You pick as many berries as you can hold. As you look around at all of the trees, you notice one much taller than the others. Rather than a yellow white glow, it radiates purple. You now aim to retrieve the purple berries. How will you get up there?

~ hunger -=2
{ hunger < 0: hunger = 0 }
-> rope_search

== rope_search == 
You scower the area for something to climb up on. After what seems like hours, you have no luck. All seems to be failing until you notice a thick vine in the distance. You get to the vine and tug on it in opposite ways. Good... its sturdy. You use a sharp rock to sever the far end. You wind the vine around your arm.

You have {vines} vine

* [Throw the vine around a high branch] ->  climb_tree

== climb_tree == 

~ hunger +=2
{ hunger >= 5: -> hunger_faint }

You race over to see what will happen when you climb up the tree. You throw the vine as high as you can in hopes that it will tie around the branch, but with no success it floats back to the ground. Just a little bit higher now! You toss the vine up with all your might and it revolves around the branch twice. You wrap your body around to climb up. -Exercise is muuch lower in low gravity!- You climb above the rest of the normal trees. Things look pretty from high up on this planet. You are nearing the purple tree now. Reaching one arm outward, you pick a cluster of the purple berries. Curious and hungry, you toss one in your mouth. Remarkably sweet, yet tart, the berries are quite addictive. What was the point of climbing up here? Why are these ones purple? Nothing is happening. Amidst your frustration, the sun starts to peek through the leaves below you. Alas, you have made it through the night. 
* {vines > 0 } [Changed attitude] -> resolution


== east_path_lit == 
The light of your torch triggers the fruit growing on the trees around you. That must have been what was lighting the path earlier- the fruits retain light. You strategize what can keep things lit until dawn.  
* [Pick fruit] -> pick_fruit 
+ [Go back] -> waterfall

== resolution == 
While this planet is lonesome, you appreciate the beauty that Earth could not offer. Maybe the aliens weren't ill-intentioned, though they did abduct you. Surrounding you are endless views of lush gardens, foreign agriculture, and pools of water. In the daylight, you even notice other puppies running in the distance. This new life is intriguing... what else are you yet to discover?  
-> END








