# knights_travails
This exercise is part of The Odin Project Curriculum
Your task is to build a function knight_moves that shows the shortest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]

First idea:
Create a "board" which consists on a linked list. This linked list will have each node value as a two dimensional array ([u,v]), creating all posible combinations in the board. 
The function to move the knight will take the actual position as an array and the desired position. The algorithm will call itself looking for al the posible positions (A kinght can move two units in a way + 1 unit in another, this for example could be translated so a position of [4,1] could move to [6,2], [2,2], [2,0] [6,0], [5,3], [3,3]. [5,-1] and [3,-1] are not posible because they'd be out of the board. This constriction makes posible to do it like this, so the algorith would sum +2 to u and +1 to v and viceversa without being negative or >7 *I did it in the end using 1 as starter and 8 as end*)