# knights_travails
¡IMPORTANT! Because I make a mistake with branches, this branch is the only one (breadth_traverse_graph), even though I had more work on others

This exercise is part of The Odin Project Curriculum
Your task is to build a function knight_moves that shows the shortest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]

Comments:
This was a tough one. Didn't know where to start. The idea of creating a tree form a 8x8 board doesn't make sense in the beginning. Also I wasn't sure of the algorithm to use.

I started creating a graph(even though it wasn't a graph, I thought it was) and creating a recursion that soon enough I realized it was using a Depth first algorithm, which I couldn't manage to get the shortest path (maybe because is not posible?)

After this I realized I have to go level by level...so breadth first. Here is when I fucked up with the branches in GIT, and started working on the new branch from the beginning.

As soon as I got my breadth first algorithm right I realized I didn't know how to track the path. Yes I had a node that was moving and get to the point in the shortest way posible, but I didn't have anymore nodes! So I couldn't "mark" the visited positions to follow the track back in the end. Here I was sure I needed to mark them with a Parent variable, instead of the other way (Children) as I think is easier and faster.

Takes a long time for some combinations, not sure if it is normal or I could save some calculations someway, but it works, after ~13h of working on it (phhew)