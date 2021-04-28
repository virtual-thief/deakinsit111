@R2		//Ensure that R2 = 0 (it will be used as our total value)
M=0

@R0		//Test script has a lot of R0 0 and - assignments
D=M		//This script section skips those by checking if R0
@LOOP	//is greater than 0 and going to Loop if it is but
D;JGT	//going straight to END if it is 0 or a negative

@END	//Force the jump since it can't get here unless non positive value
0;JMP	

(LOOP) 	//Define the start of the program loop

@R1    	//Retrieve the value of R1 and assign it to D
D=M

@R2		//Add the value of R1 to R2
M=M+D

@R0		//Reduce R0 by 1 (it's our loop counter)
D=M-1	//Start by assigning to D so we can use it as our jump test
M=D

@LOOP 	//Start loop again if R0 is still greater than 0
D;JGT

(END) 	//Traditional infinite end loop
@END
0;JMP