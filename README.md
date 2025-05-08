# UC-Irvine-Beier-Lab-Y-Maze
Analysis of miniscope recordings of the neural firing patterns of mice while they participate in the Y Maze experiment.

Provided here are the programs that compare correct vs incorrect alternations in the y maze experiment, where a correct alternation occurs when the mouse explores a new area of the y maze, and an incorrect alternation occurs when the mouse returns to the arm of the maze that it was previously in. 

The left turn vs right turn analysis is not provided since the code is the same and only the turn definitions are different. In this analysis, left turns are defined by the mouse moving to the next arm clockwise and right turns are defined by the mouse moving to the next arm counterclockwise.

Programs should be run in this order for all folders:

1. testCircShuffFunc_correctAlts.m
2. testCircShuffFunc_Inc.m
3. testGetSpikesAroundAlts_correctAlts.m
4. testGetSpikesAroundAlts_Inc.m
5. Any other program

Notes:

- The decoder and 3s plots and stats use z scoring whereas the 1s plots and stats don't.
