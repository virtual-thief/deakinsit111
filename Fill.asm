//Program to fill the screen of the hack computer with black
//in the event that a button is pressed

//Header program - resets the address variable to the start
//of the screen and then monitors for keyboard input
(CHECK)		
@SCREEN		//Reset address variable to start of screen memory map
D=A
@address
M=D

@KBD		//Check for keyboard input
D=M

@WHITE		//If no keyboard input (KBD will = 0) jump to white program
D;JEQ

@BLACK		//Otherwise jump to black program (must have been an input)
0;JMP


(LOOP) 		//Define the start of the program loop

(BLACK)		//Loop to print screen to black

@1			//If screen is already black return to Check
D=A
@address
A=M
D=D-M
@CHECK
D;JEQ

@8192		//Set up a counter for the number of RAM addresses in the map
D=A
@counter
M=D

(BLOOP)		//Loop for turning screen black

@address	//Change the current RAM address to 16 1's (-1)
A=M
M=-1

@address	//Increase address variable by 1
M=M+1

@counter	//Decrease counter by 1
M=M-1
D=M

@BLOOP		//Jump back to black loop if counter is greater than 0
D;JGT

@CHECK		//Otherwise return to start of program
0;JMP



(WHITE)		//Same as the Black loop, but to turn the screen white

@0			//If screen is already white - return to check
D=A
@address
A=M
D=D-M
@CHECK
D;JEQ

@8192		//Same counter for decrementing through the memory space
D=A
@counter
M=D

(WLOOP)		//White version of Bloop

@address	//Set current memory address to 16 0's (0)
A=M
M=0

@address	//Increase RAM address for monitor by one
M=M+1

@counter	//Decrease counter by one
M=M-1
D=M

@WLOOP		//Jump back to start of white loop if counter greater than 0
D;JGT

@CHECK		//Otherwise back to the start we go!
0;JMP