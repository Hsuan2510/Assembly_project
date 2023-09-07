INCLUDE Irvine32.inc
INCLUDE Macros.inc
main	EQU start@0

.data
zero0 BYTE "  __  "
zero1 BYTE " /  \ "
zero2 BYTE "| () |"
zero3 BYTE " \__/ "

one0  BYTE "   _  "
one1  BYTE "  / | "
one2  BYTE "  | | "
one3  BYTE "  |_| "

two0  BYTE " ___  "
two1  BYTE "|_  ) "
two2  BYTE " / /  "
two3  BYTE "/___| "

three0  BYTE " ____ "
three1  BYTE "|__ / "
three2  BYTE " |_ \ "
three3  BYTE "|___/ "

four0  BYTE  " _ _  "
four1  BYTE  "| | | "
four2  BYTE  "|_  _|"
four3  BYTE  "  |_| "

five0 BYTE " ___  "
five1 BYTE "| __| "
five2 BYTE "|__ \ "
five3 BYTE "|___/ "

six0 BYTE "  __  "
six1 BYTE " / /  "
six2 BYTE "/ _ \ "
six3 BYTE "\___/ "

seven0 BYTE " ____ "
seven1 BYTE "|__  |"
seven2 BYTE "  / / "
seven3 BYTE " /_/  "

eight0 BYTE " ___  "
eight1 BYTE "( _ ) "
eight2 BYTE "/ _ \ "
eight3 BYTE "\___/ "

nine0 BYTE " ___  "
nine1 BYTE "/ _ \ "
nine2 BYTE "\_, / "
nine3 BYTE " /_/  "

WinScore0 BYTE "  _  __   __  "
WinScore1 BYTE " / |/  \ /  \ "
WinScore2 BYTE " | | () | () |"
WinScore3 BYTE " |_|\__/ \__/ "

clockEndtime DWORD 90000

zeroPosition COORD <0,0>
onePosition COORD <0,0>
twoPosition COORD <0,0>
threePosition COORD <0,0>
fourPosition COORD <0,0>
fivePosition COORD <0,0>
sixPosition COORD <0,0>
sevenPosition COORD <0,0>
eightPosition COORD <0,0>
ninePosition COORD <0,0>
numberattributes WORD 6 DUP(0Eh)

meau0	BYTE " \|||/       \||/	  ||||||||||||/  \||/             \||/ ","*****   |||               |||          /||\         |||||          ||||| "
meau1   BYTE "  |||        ///    |||             \\\             ///  ","*****   ||\              ///|         /||||\         |||\           |||  "
meau2   BYTE "  |||       ///     |||              \\\           ///   ","*****   ||\\            ///||        /||||||\        |||\\          |||  "
meau3   BYTE "  |||      ///      |||               \\\         ///    ","*****   ||\\\          /// ||       ||||||||||       |||\\\         |||  "
meau4   BYTE "  |||     ///       |||                \\\       ///     ","        ||\\\\        //// ||      ||||||||||||      ||| \\\        |||  "
meau5   BYTE "  |||    ///        |||                 \\\     ///      ","        |||\\\\      ////  ||     |||/      \|||     |||  \\\       |||  "
meau6   BYTE "  |||   ///         |||                  \\\   ///       ","        ||  \\\\    ////   ||    ||||        ||||    |||   \\\      |||  "
meau7   BYTE "  |||||///          ||||||||||/           \\||///        ","        ||   \\\\  ////    ||   |||||        |||||   |||    \\\     |||  "
meau8   BYTE "  |||||\\\          |||||||||/             \||//         ","        ||    \\\\////     ||   |||||\       /||||   |||     \\\    |||  "
meau9   BYTE "  |||    \\\        |||                     |||          ","        ||     \\\///      ||   |||||\||||||/|||||   |||      \\\   |||  "
meau10  BYTE "  |||     \\\       |||                     |||          ","        ||                 ||   |||/          \|||   |||       \\\  |||  "
meau11  BYTE "  |||      \\\      |||                     |||          ","        ||                 ||   \||/           \|/   |||        \\\ |||  "
meau12  BYTE "  |||       \\\     |||                     |||          ","*****   ||                 ||   \||            ||/   |||         \\\|||  "
meau13	BYTE "  |||        \\\    |||                     |||          ","*****   ||                 ||   \|/            \|/   |||          \\|||  "
meau14	BYTE "  |||         \\\	  |||||||||||\            |||          ","*****   ||                 ||   \|/            \|/   |||           \|||  "
meau15	BYTE " /|||\        /||\  |||||||||||||\         |||||         ","*****  ||||               ||||   \|\           /|/  |||||          ||||| "
start	BYTE "                                                PRESS ENTER TO START GAME                                                            "
stop    BYTE "                                                   PRESS ESC TO LEAVE                                                                "

meauHandle DWORD 0
count DWORD 0
xyPosition COORD <10,5>
screensize COORD <600,500>
cellsWritten DWORD ?
;meau屬性
meauattributes WORD 57 DUP(0Eh),73 DUP(0Fh)
;picture 屬性
picture_attributes WORD 102 DUP(0Fh)
picture_xyPosition COORD <10,5>

SMALL_RECT STRUCT
Left WORD 287
Top	WORD 145
Right	WORD 437  
Bottom WORD 187  
SMALL_RECT ENDS


remind DWORD 8000,18000,30000,38000,50000,62000,75000,82000 ;define the time teacher turn arround
startTime DWORD ?
nowTime DWORD ?

score WORD 0    		;press one add one
score_count WORD ? 		;really add on screen
scoreBar COORD <31, 14> ;start position of score bar
lengthofBar WORD ?
barAttributes WORD 0Fh  ;bar color: white
bar1 BYTE "|"
bar2 BYTE "|"
bar3 BYTE "|"

ShowScore COORD <70, 30>
scoreText BYTE "SCORE: "
scoreAttributes WORD 7 DUP(0Fh)
ScorePercent WORD ?
ScoreQuotient WORD ?
ScoreRemainder WORD ?
titleStr BYTE "KEYMAN", 0
WinScorePosition COORD <78,30>
WinScoreAttributes WORD 14 DUP(0Eh)
wintime DWORD ?
losetime DWORD ?
;data picture4

front2_0   BYTE "                                                                                                      "     
front2_1   BYTE "                                                                                                      "
front2_2   BYTE "                                                                                                      "                                                                                                 
front2_3   BYTE "                                                                          @@                         "
front2_4   BYTE "                                                                       @@@@@@                         "
front2_5   BYTE "              _____________________________________                  @@@@@@@@                         "
front2_6   BYTE "              | _________________________________  |                /        \                        "
front2_7   BYTE "              | |                                | |                |\ /   _ |                        "
front2_8   BYTE "              | |    ___________________         | |         ______ |T T   _||                        "
front2_9   BYTE "              | |   |                   |        | |         \     \|..      |                        "
front2_10  BYTE "              | |   |                   |        | |          \     ((O)))   /                        "
front2_11  BYTE "              | |   |___________________|        | |           \_____\______/	                       "
front2_12  BYTE "              | |                                | |               \__/     \                         "
front2_13  BYTE "              | |   Coding...                    | |                 /    >  \                        "
front2_14  BYTE "              | |________________________________| |                /_________\                       "      
front2_15  BYTE "              |____________________________________|                   /    |                         "                                                                                                        
front2_16  BYTE "              /                                     \                 =\   =\                         "
front2_17  BYTE "             /                                       \                                                "
front2_18  BYTE "            /                                         \                                               "
front2_19  BYTE "           /                                           \                                              "
front2_20  BYTE "          /_____________________________________________\                                             "
front2_21  BYTE "                                                                                                      "
front2_22  BYTE "                                                                                                      "
front2_23  BYTE "                                                                                                      "  

;data picture3
front0   BYTE "                                                                                                      "     
front1   BYTE "                                                                                                      "
front2   BYTE "                                                                                                      "                                                                                                 
front3   BYTE "                                                                                @@@                   "
front4   BYTE "                                                                       @@@@@@@@@@@                    "
front5   BYTE "              _____________________________________                @@@@@@@@@@@@@@                     "
front6   BYTE "              | _________________________________  |              /    \   /    \                     "
front7   BYTE "              | |                                | |            _|     T   T     |_                   "
front8   BYTE "              | |    ___________________         | |           |_       ..        _|                  "
front9   BYTE "              | |   |                   |        | |             |    (((O)))    |                    "
front10  BYTE "              | |   |                   |        | |             \               /                    "
front11  BYTE "              | |   |___________________|        | |              \_____________/	             "
front12  BYTE "              | |                                | |              ____/      \>                       "
front13  BYTE "              | |   Coding...                    | |                 /        \                       "
front14  BYTE "              | |________________________________| |                /__________\                      "      
front15  BYTE "              |____________________________________|                   |    |                         "                                                                                                        
front16  BYTE "              /                                     \                 =|    |=                        "
front17  BYTE "             /                                       \                                                "
front18  BYTE "            /                                         \                                               "
front19  BYTE "           /                                           \                                              "
front20  BYTE "          /_____________________________________________\                                             "
front21  BYTE "                                                                                                      "
front22  BYTE "                                                                                                      "
front23  BYTE "                                                                                                      "




;data picture1

back1_0   BYTE "                                                                                                      "     
back1_1   BYTE "                                                                                                      "
back1_2   BYTE "                                                                                                      "                                                                                                 
back1_3   BYTE "                                                                 @@@                                  "
back1_4   BYTE "                                                                  @@@@@@@@@@@                         "
back1_5   BYTE "              _____________________________________                @@@@@@@@@@@@@@                     "
back1_6   BYTE "              | _________________________________  |              /             \                     "
back1_7   BYTE "              | |                                | |            _|               |_                   "
back1_8   BYTE "              | |    ___________________         | |           |_                 _|                  "
back1_9   BYTE "              | |   |                   |        | |             |               |                    "
back1_10  BYTE "              | |   |                   |        | |             \               /                    "
back1_11  BYTE "              | |   |___________________|        | |              \_____________/	             "
back1_12  BYTE "              | |                                | |            ______/      \ __                     "
back1_13  BYTE "              | |   Coding...                    | |                 /      __\ _\__                  "
back1_14  BYTE "              | |________________________________| |                /_______\       \                 "      
back1_15  BYTE "              |____________________________________|                   |    |\       \                "                                                                                                        
back1_16  BYTE "              /                                     \                 =|   =| \_______\               "
back1_17  BYTE "             /                                       \                                                "
back1_18  BYTE "            /                                         \                                               "
back1_19  BYTE "           /                                           \                                              "
back1_20  BYTE "          /_____________________________________________\                                             "
back1_21  BYTE "                                                                                                      "
back1_22  BYTE "                                                                                                      "
back1_23  BYTE "                                                                                                      " 


;data picture2
back2_0   BYTE "                                                                                                      "     
back2_1   BYTE "                                                                                                      "
back2_2   BYTE "                                                                                                      "                                                                                                 
back2_3   BYTE "                                                                 @@@                                  "
back2_4   BYTE "                                                                  @@@@@@@@@@@                         "
back2_5   BYTE "              _____________________________________                @@@@@@@@@@@@@@                     "
back2_6   BYTE "              | _________________________________  |              /             \                     "
back2_7   BYTE "              | |                                | |            _|               |_                   "
back2_8   BYTE "              | |    ___________________         | |           |_                 _|                  "
back2_9   BYTE "              | |   |                   |        | |             |               |                    "
back2_10  BYTE "              | |   |                   |        | |          ___\               /                    "
back2_11  BYTE "              | |   |___________________|        | |          \   \_____________/ /	                  "
back2_12  BYTE "              | |                                | |           \______/      \___/                    "
back2_13  BYTE "              | |   Coding...                    | |            \____/        \                       "
back2_14  BYTE "              | |________________________________| |                /__________\                      "      
back2_15  BYTE "              |____________________________________|                   |    |                         "                                                                                                        
back2_16  BYTE "              /                                     \                 =|    |=                        "
back2_17  BYTE "             /                                       \                                                "
back2_18  BYTE "            /                                         \                                               "
back2_19  BYTE "           /                                           \                                              "
back2_20  BYTE "          /_____________________________________________\                                             "
back2_21  BYTE "                                                                                                      "
back2_22  BYTE "                                                                                                      "
back2_23  BYTE "                                                                                                      "  

win0   BYTE "    \\\           ///       //|||||||||||\\       |||           |||           |||                      |||      |||||||||||||      ||\\\             |||      /||\   "     
win1   BYTE "     \\\         ///       |||           |||      |||           |||           |||                      |||           |||           |||\\\            |||      ||||   "
win2   BYTE "      \\\       ///        |||           |||      |||           |||           |||                      |||           |||           ||| \\\           |||      ||||   "                                                                                                 
win3   BYTE "       \\\     ///         |||           |||      |||           |||           |||                      |||           |||           |||  \\\          |||      ||||   "
win4   BYTE "        \\\   ///          |||           |||      |||           |||           |||                      |||           |||           |||   \\\         |||      ||||   "
win5   BYTE "         \\\ ///           |||           |||      |||           |||           |||                      |||           |||           |||    \\\        |||      ||||   "
win6   BYTE "          \|||/            |||           |||      |||           |||           |||                      |||           |||           |||     \\\       |||      ||||   "
win7   BYTE "           |||             |||           |||      |||           |||           |||                      |||           |||           |||      \\\      |||      ||||   "
win8   BYTE "           |||             |||           |||      |||           |||           |||          /\          |||           |||           |||       \\\     |||      ||||   "
win9   BYTE "           |||             |||           |||      |||           |||           |||         //\\         |||           |||           |||        \\\    |||      ||||   "
win10  BYTE "           |||             |||           |||      |||           |||           |||        ///\\\        |||           |||           |||         \\\   |||      ||||   "
win11  BYTE "           |||             |||           |||      |||           |||           |||       ///  \\\       |||           |||           |||          \\\  |||      \||/   "
win12  BYTE "           |||             |||           |||      |||           |||           \\\      ///    \\\      ///           |||           |||           \\\ |||             "
win13  BYTE "           |||             |||           |||      |||           |||            \\\    ///      \\\    ///            |||           |||            \\\|||      /||\   "
win14  BYTE "           |||              \\|||||||||||//        \\|||||||||||//              \\\||///        \\\||///        |||||||||||||      |||             \\\||      \||/   "      
win15  BYTE "                                                                                                                                                                     "                                                                                                        
win16  BYTE "                                                                                                                                                                     "
win17  BYTE "                                                                                  UUUUUUUU                                                                           "
win18  BYTE "                                                 @ @@     @                      /        \                                                                          "
win19  BYTE "                                              @ @@ @  @                          | > _ <  |               _____       _       ____        _    __                    "
win20  BYTE "                                             @@@@@@@@      @    @                |'' U '' |              / ____|     | |     / __ \      | |   | |                   "
win21  BYTE "                                  ( (       /        \  ___                _______\_______/              | |  __  ___| |_   | |  | |_   _| |_  | |                   "
win22  BYTE "                                           | X   X   |_ \  \              E)______    (M)\               | | |_ |/ _ \ __|  | |  | | | | | __| |_|                   "
win23  BYTE "                                           |  ..     _|  \  \____________________/    \ \ \              | |__| |  __/ |_   | |__| | |_| | |_   __                   "
win24  BYTE "                                           \ ((O)) ||\    \__\____________________   / \_\/               \_____|\___|\__|   \____/ \__,_|\__| |_|                   "
win25  BYTE "                                            \________|                            \  \                                                                               "
win26  BYTE "                                   @        /_____   \___                         \  \                                                                               "
win27  BYTE "                                            |     \   \  \    ) )                 /  /                                                                               "
win28  BYTE "                          @                  \_________\                         /  /                                                                                "
win29  BYTE "                                      @         \  \                            /__/__                                                                               "
win30  BYTE "                                                 \= \=      @                  |_____|                                                                               "   
win_attributes WORD 165 DUP(0ch)   

over0   BYTE "   //|||||||||||\\\               /||\              |||\\                  //|||     ||||||||||||///  "
over1   BYTE "  //|||          ||\\            ///\\\             |||\\\                ///|||     |||              "
over2   BYTE "  ||                ||          ///  \\\            ||| \\\              /// |||     |||              "
over3   BYTE "  ||                           ///    \\\           |||  \\\            ///  |||     |||              "
over4   BYTE "  ||                          ///      \\\          |||   \\\          ///   |||     |||              "
over5   BYTE "  ||          |||||\\\       //|||||||||\\\         |||    \\\        ///    |||     ||||||||||||//   "
over6   BYTE "  ||                |||     ///          \\\        |||     \\\      ///     |||     |||              "
over7   BYTE "  ||                 ||    ///            \\\       |||      \\\    ///      |||     |||              "
over8   BYTE "  ||                ||    ///              \\\      |||       \\\  ///       |||     |||              "
over9   BYTE "  \\||||         ||//    ///                \\\     |||        \\\///        |||     |||              "
over10  BYTE "   \\\\\|||||||||//     ///                  \\\    |||         \||/         |||     ||||||||||||\\\  "
over11  BYTE 102 DUP(" ")
over12  BYTE 102 DUP(" ")                                                                                                        
over13  BYTE "      //|||||||||||||\\      \\\                    ///     ||||||||||||||///      ||||||||||||\\\\   "
over14  BYTE "     |||             |||      \\\                  ///      |||                    |||         |||\\  "
over15  BYTE "     |||             |||       \\\                ///       |||                    |||           ||\\ "
over16  BYTE "     |||             |||        \\\              ///        |||                    |||            ||| "
over17  BYTE "     |||             |||         \\\            ///         |||                    |||          ||//  "
over18  BYTE "     |||             |||          \\\          ///          ||||||||||||||//       |||||||||||////    "
over19  BYTE "     |||             |||           \\\        ///           |||                    |||  ||\\          "
over20  BYTE "     |||             |||            \\\      ///            |||                    |||    ||\\        "
over21  BYTE "     |||             |||             \\\    ///             |||                    |||      ||\\      "
over22  BYTE "     |||             |||              \\\  ///              |||                    |||        ||\\    "
over23  BYTE "      \\|||||||||||||//                \\||//               ||||||||||||||\\\      |||          ||\\  " 
overattributes WORD 102 DUP(0ch)
.code

main PROC
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ;get handle to meauHandle 
    	mov meauHandle,eax; 
	
	;set screen size
	INVOKE SetConsoleScreenBufferSize,  ;define scree buffer size
	    meauHandle,
        screensize
	INVOKE SetConsoleTitle, ADDR titleStr	;set console title
	call outmeau  ;print the meau picture
PRESS:
call ReadChar
	.IF ax == 011bh			;press esc to leave the game
	    exit
    .ENDIF
	.IF ax == 1c0dh			;press enter to start game
		call START_GAME
	.ENDIF
    jmp PRESS   ;IF neither esc nor enter jmp press to read the input again
main ENDP

;define meau picture
outmeau PROC
INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    	mov meauHandle,eax; 
    	call Clrscr
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau0,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  


    	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau1,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau2,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau3,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau4,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau5,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau6,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau7,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau8,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau9,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau10,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau11,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau12,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau13,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau14,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  

	inc xyPosition.Y  ; next line


   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR meauattributes,
             130,
      	     xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR meau15,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  
	add xyPosition.Y,10  ; 

 	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR start,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  
	add xyPosition.Y,5  

 	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR stop,  
     	    130,
     	    xyPosition,   
            ADDR cellsWritten  
	ret
outmeau ENDP

;define the number pictures
zero PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     zeroPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR zero0,  
     	    6,
     	    zeroPosition,   
            ADDR cellsWritten

	inc zeroPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     zeroPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR zero1,  
     	    6,
     	    zeroPosition,   
            ADDR cellsWritten 

	inc zeroPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     zeroPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR zero2,  
     	    6,
     	    zeroPosition,   
            ADDR cellsWritten 

	inc zeroPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     zeroPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR zero3,  
     	    6,
     	    zeroPosition,   
            ADDR cellsWritten 
		ret
zero ENDP

one PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     onePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR one0,  
     	    6,
     	    onePosition,   
            ADDR cellsWritten

	inc onePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     onePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR one1,  
     	    6,
     	    onePosition,   
            ADDR cellsWritten 

	inc onePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     onePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR one2,  
     	    6,
     	    onePosition,   
            ADDR cellsWritten 

	inc onePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     onePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR one3,  
     	    6,
     	    onePosition,   
            ADDR cellsWritten 	
		ret
one ENDP

two PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax;
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     twoPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR two0,  
     	    6,
     	    twoPosition,   
            ADDR cellsWritten

	inc twoPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     twoPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR two1,  
     	    6,
     	    twoPosition,   
            ADDR cellsWritten 

	inc twoPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     twoPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR two2,  
     	    6,
     	    twoPosition,   
            ADDR cellsWritten 

	inc twoPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     twoPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR two3,  
     	    6,
     	    twoPosition,   
            ADDR cellsWritten 
		ret
two ENDP

three PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax;			
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     threePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR three0,  
     	    6,
     	    threePosition,   
            ADDR cellsWritten

	inc threePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     threePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR three1,  
     	    6,
     	    threePosition,   
            ADDR cellsWritten 

	inc threePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     threePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR three2,  
     	    6,
     	    threePosition,   
            ADDR cellsWritten 

	inc threePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     threePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR three3,  
     	    6,
     	    threePosition,   
            ADDR cellsWritten 
		ret
three ENDP

four PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax;

   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fourPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR four0,  
     	    6,
     	    fourPosition,   
            ADDR cellsWritten

	inc fourPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fourPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR four1,  
     	    6,
     	    fourPosition,   
            ADDR cellsWritten 

	inc fourPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fourPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR four2,  
     	    6,
     	    fourPosition,   
            ADDR cellsWritten 

	inc fourPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fourPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR four3,  
     	    6,
     	    fourPosition,   
            ADDR cellsWritten 	 	
		ret
four ENDP

five PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fivePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR five0,  
     	    6,
     	    fivePosition,   
            ADDR cellsWritten

	inc fivePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fivePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR five1,  
     	    6,
     	    fivePosition,   
            ADDR cellsWritten 

	inc fivePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fivePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR five2,  
     	    6,
     	    fivePosition,   
            ADDR cellsWritten 

	inc fivePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     fivePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR five3,  
     	    6,
     	    fivePosition,   
            ADDR cellsWritten 	
		ret
five ENDP

six PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sixPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR six0,  
     	    6,
     	    sixPosition,   
            ADDR cellsWritten

	inc sixPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sixPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR six1,  
     	    6,
     	    sixPosition,   
            ADDR cellsWritten 

	inc sixPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sixPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR six2,  
     	    6,
     	    sixPosition,   
            ADDR cellsWritten 

	inc sixPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sixPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR six3,  
     	    6,
     	    sixPosition,   
            ADDR cellsWritten 
		ret
six ENDP

seven PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sevenPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR seven0,  
     	    6,
     	    sevenPosition,   
            ADDR cellsWritten

	inc sevenPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sevenPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR seven1,  
     	    6,
     	    sevenPosition,   
            ADDR cellsWritten 

	inc sevenPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sevenPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR seven2,  
     	    6,
     	    sevenPosition,   
            ADDR cellsWritten 

	inc sevenPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     sevenPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR seven3,  
     	    6,
     	    sevenPosition,   
            ADDR cellsWritten 
		ret
seven ENDP

eight PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax;		
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     eightPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR eight0,  
     	    6,
     	    eightPosition,   
            ADDR cellsWritten

	inc eightPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     eightPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR eight1,  
     	    6,
     	    eightPosition,   
            ADDR cellsWritten 

	inc eightPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     eightPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR eight2,  
     	    6,
     	    eightPosition,   
            ADDR cellsWritten 

	inc eightPosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     eightPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR eight3,  
     	    6,
     	    eightPosition,   
            ADDR cellsWritten
		ret
eight ENDP

nine PROC uses eax esi edx
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax;
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     ninePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR nine0,  
     	    6,
     	    ninePosition,   
            ADDR cellsWritten

	inc ninePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     ninePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR nine1,  
     	    6,
     	    ninePosition,   
            ADDR cellsWritten 

	inc ninePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     ninePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR nine2,  
     	    6,
     	    ninePosition,   
            ADDR cellsWritten 

	inc ninePosition.Y

	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR numberattributes,
             6,
      	     ninePosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR nine3,  
     	    6,
     	    ninePosition,   
            ADDR cellsWritten 
		ret
nine ENDP
; define picture1(back side of teacher)
picture1 PROC uses eax esi ebx edx 
		call clock
		mov picture_xyPosition.X,10
		mov picture_xyPosition.Y,5
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov  meauHandle,eax; 
;firt line	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
			 ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_0,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;2 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
			 ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_1,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;3 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	         ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_2,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;4 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	         ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR back1_3,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;5 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	         ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_4,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;6 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	         ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_5,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;7 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	         ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_6,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;8 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_7,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;9 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_8,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;10 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_9,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;11 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_10,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;12 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_11,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;13 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_12,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;14 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_13,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;15 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_14,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;16 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_15,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;17 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_16,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;18 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_17,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;19 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_18,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;20 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_19,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;21 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_20,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;22 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_21,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;23 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_22,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;24 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back1_23,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 
	call clock
	ret
picture1 ENDP
;define picture2(back size change pose to remind player)
picture2 PROC uses eax esi ebx edx
		call clock
		INVOKE GetTickCount
		mov nowtime,eax
		mov picture_xyPosition.X,10
		mov picture_xyPosition.Y,5
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov  meauHandle,eax; 
;firt line	
   	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_0,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;2 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_1,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;3 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_2,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;4 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_3,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;5 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_4,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;6 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_5,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;7 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_6,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;8 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_7,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;9 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_8,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;10 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_9,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;11 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_10,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;12 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_11,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;13 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_12,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;14 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_13,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;15 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_14,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;16 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_15,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;17 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_16,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;18 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_17,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;19 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_18,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;20 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_19,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;21 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_20,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;22 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_21,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;23 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_22,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;24 line
	INVOKE WriteConsoleOutputAttribute,
              meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
             meauHandle,   
            ADDR back2_23,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 
			
L:	
	call ADDSCORE_OR_NOT
	call Show_score
	call clock
	INVOKE GetTickCount ;get the current time
	sub eax,nowtime  
	.IF eax>=2000   ;IF time >2 sec return 
		ret
	.ENDIF
	jmp L  ;Else keep getime until > 2 sec
picture2 ENDP
;define picture3(front of teacher)
picture3 PROC uses eax esi ebx ecx
	call clock
	INVOKE GetTickCount
	mov nowtime,eax
	mov picture_xyPosition.X,10
	mov picture_xyPosition.Y,5
	
INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
;firt line
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front0,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;2 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front1,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;3 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;4 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front3,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;5 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front4,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;6 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front5,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;7 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front6,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;8 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front7,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;9 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front8,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;10 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front9,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;11 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front10,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;12 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front11,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;13 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front12,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;14 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front13,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;15 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front14,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;16 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front15,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;17 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front16,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;18 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front17,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;19 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front18,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;20 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front19,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;21 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front20,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;22 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front21,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;23 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front22,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 

	inc  picture_xyPosition.Y  ; next line
;24 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	      picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front23,  
     	    102,
     	     picture_xyPosition,   
            ADDR cellsWritten 
		call Show_score
	
L1:	
	call PRESS_OR_NOT  ;to check player press or not IF press then gameover
	call Show_score
	call clock
	INVOKE GetTickCount
	sub eax,nowtime		
	.IF eax>=3000	;during time > 3 sec return
		ret
	.ENDIF
	jmp L1
picture3 ENDP
;define picture4(turn to front size)
picture4 PROC uses eax ebx edx esi
	call clock
	mov picture_xyPosition.X,10
	mov picture_xyPosition.Y,5
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
;firt line	
	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_0,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;2 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_1,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;3 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_2,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;4 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_3,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;5 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_4,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;6 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_5,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;7 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_6,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;8 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_7,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;9 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_8,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;10 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_9,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;11 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_10,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;12 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_11,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;13 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_12,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;14 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_13,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;15 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_14,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;16 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_15,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;17 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_16,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;18 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_17,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;19 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_18,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;20 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_19,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;21 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_20,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;22 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_21,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;23 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_22,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;24 line
	
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR picture_attributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR front2_23,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	call Show_score
	
L4:	
	
	call PRESS_OR_NOT
	call Show_score
	call clock
	INVOKE GetTickCount
	sub eax,nowtime
	.IF eax>=2250
		ret
	.ENDIF
	jmp L4
picture4 ENDP

;win picture
win PROC
		call Clrscr
		mov picture_xyPosition.X,10
		mov picture_xyPosition.Y,5
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
;1 line	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win0,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;2 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win1,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;3 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win2,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;4 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win3,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;5 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win4,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;6 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win5,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;7 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win6,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;8 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win7,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;9 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win8,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;10 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win9,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;11 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win10,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;12 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win11,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;13 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win12,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;14 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win13,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;15 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win14,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;16 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win15,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line

;17 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win16,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;18 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win17,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;19 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win18,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;20 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win19,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;21 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win20,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;22 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win21,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;23 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win22,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;24 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win23,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;25 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win24,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;26 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win25,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;27 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win26,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;28 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win27,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;29 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win28,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;30 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win29,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;31 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR win_attributes,
             165,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR win30,  
     	    165,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
	ret
win ENDP

;overgame picture
outover PROC
	
		mov picture_xyPosition.X,10
		mov picture_xyPosition.Y,5
	INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; 
    		mov meauHandle,eax; 
    		call Clrscr
;firt line	
   	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
			ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over0,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;2 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over1,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;3 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over2,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;4 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over3,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;5 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over4,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;6 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over5,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;7 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over6,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;8 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over7,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;9 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over8,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;10 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over9,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;11 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over10,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;12 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over11,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;13 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over12,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;14 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over13,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;15 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over14,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;16 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over15,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;17 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over16,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;18 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over17,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;19 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over18,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;20 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over19,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;21 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over20,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;22 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over21,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;23 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
			ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over22,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
;24 line
	INVOKE WriteConsoleOutputAttribute,
             meauHandle,
	     ADDR overattributes,
             102,
      	     picture_xyPosition,
             ADDR cellsWritten
	
    	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR over23,  
     	    102,
     	    picture_xyPosition,   
            ADDR cellsWritten 

	inc picture_xyPosition.Y  ; next line
	ret
outover ENDP

START_GAME PROC USES EAX EBX ECX EDX
	INVOKE GetTickCount ;get the time when we enter the game
	mov startTime,eax   ;put it into startTime to save
	mov esi,0
	mov ebx,0
	call Clrscr			;clean the screen
	call picture1		;let screen print picture1
	mov ninePosition.X,20;
	mov ninePosition.Y,30;
	mov zeroPosition.X,26;
	mov zeroPosition.Y,30;
	call nine;
	call zero;
	keep:
		call clock      ;show the time you have
		call ADDSCORE_OR_NOT	;call the procedure you can addscore or not
		call Show_score			;call the procedure to show the score you get
		INVOKE GetTickCount		;every moment to get current time
		sub eax,startTime		;minus the start time to check how many time to spent
		.IF eax >= remind[esi]	;if time arrive at the remind array means teacher will turn around soon
			call picture2		;call picture2 to remind player teacher will turn soon
			call picture4		
			call picture3		;teacher turn around!
			call picture1		;teacher turn back!
			add esi,4			;let remind point to next
		.ENDIF
		cmp eax,90000			;compare spent time with 90 sec 
		JAE stopGAME			;IF equal then stop game
		jmp keep				;else keep game
stopGAME:
		call Clrscr
		call outover
		call ReadChar
			.IF ax==011bh
				exit
			.ENDIF
START_GAME ENDP

ADDSCORE_OR_NOT PROC uses esi edx ebx eax
	call clock
	call Readkey			; look for keyboard input
	jz   Return             ; no key pressed yet
	cmp eax, 00003920h		; check if press space
	je AddScore				; press space once add a score
	jne Return				; end the procedure
	call Show_score			; call show score
AddScore:
	inc score				; add score
	jmp Return				; end the procedure
Return:
	ret
	
ADDSCORE_OR_NOT ENDP

Show_score PROC uses esi eax ebx ecx edx

	mov dx, 0
	mov ax, score
	mov bx, 65				; 65 times/1 score
	div bx					; divide score by 80
	.IF ax == 0				; if haven't get any score
		jmp PrintScore		; print th score
	.ELSEIF ax == 20		; if the score is full
		INVOKE GetTickCount
		mov wintime, eax	; get the time now and put it into wintime
		jmp WinScore		; end the game
	.ENDIF
	
	mov scoreBar.x, 31		; set scoreBar.X to the initial place
	mov lengthofBar, ax

PrintScoreBar:
	dec lengthofBar			; after print a space of bar decrease one
	mov scoreBar.y, 14		; set scoreBar.Y to the initial place
	
	INVOKE WriteConsoleOutputAttribute,
            meauHandle,
			ADDR barAttributes,
            1,
      	    scoreBar,
            ADDR cellsWritten
	
    INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR bar1,  
     	    1,
     	    scoreBar,   
            ADDR cellsWritten
			
	add scoreBar.y, 1
	
	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR bar2,  
     	    1,
     	    scoreBar,   
            ADDR cellsWritten
			
	add scoreBar.y, 1
	
	INVOKE WriteConsoleOutputCharacter,
            meauHandle,   
            ADDR bar3,  
     	    1,
     	    scoreBar,   
            ADDR cellsWritten
	
	add scoreBar.x, 1
	.IF lengthofBar > 0
		jmp PrintScoreBar
	.ENDIF
	
PrintScore:
	;print the title of score
	INVOKE WriteConsoleOutputAttribute,
            meauHandle,
			ADDR scoreAttributes,
            7,
      	    ShowScore,
            ADDR cellsWritten
	
    INVOKE WriteConsoleOutputCharacter,
            meauHandle,
            ADDR scoreText,
     	    7,
     	    ShowScore,   
            ADDR cellsWritten
	
	
	;change press times to percent
	mov dx, 0
	mov ax, score
	mov bx, 13				; put 13 into bx
	div bx					; score/13
	mov ScorePercent, ax	; put the answer to ScorePercent

	
	mov dx, 0
	mov ax, ScorePercent
	mov bx, 10				; put 10 into bx
	div bx					; ScorePecncent/10
	mov ScoreQuotient, ax	; put the quotient into ScoreQuotient
	mov ScoreRemainder, dx  ; put the remainder into ScoreRemainder
	
	;print quotient
	.IF ScoreQuotient == 0			; if ScoreQuotient equal to 0
		mov zeroPosition.x, 78
		mov zeroPosition.y, 30
		call zero					; print zero
	.ELSEIF ScoreQuotient == 1		; if ScoreQuotient equal to 1
		mov onePosition.x, 78
		mov onePosition.y, 30
		call one					; print one
	.ELSEIF ScoreQuotient == 2		; if ScoreQuotient equal to 2
		mov twoPosition.x, 78
		mov twoPosition.y, 30
		call two					; print two
	.ELSEIF ScoreQuotient == 3		; if ScoreQuotient equal to 3
		mov threePosition.x, 78
		mov threePosition.y, 30
		call three					; print three
	.ELSEIF ScoreQuotient == 4		; if ScoreQuotient equal to 4
		mov fourPosition.x, 78
		mov fourPosition.y, 30
		call four					; print four
	.ELSEIF ScoreQuotient == 5		; if ScoreQuotient equal to 5
		mov fivePosition.x, 78
		mov fivePosition.y, 30
		call five					; print five
	.ELSEIF ScoreQuotient == 6		; if ScoreQuotient equal to 6
		mov sixPosition.x, 78
		mov sixPosition.y, 30
		call six					; print six
	.ELSEIF ScoreQuotient == 7		; if ScoreQuotient equal to 7
		mov sevenPosition.x, 78
		mov sevenPosition.y, 30
		call seven					;print seven
	.ELSEIF ScoreQuotient == 8		; if ScoreQuotient equal to 8
		mov eightPosition.x, 78
		mov eightPosition.y, 30
		call eight					; print eight
	.ELSEIF ScoreQuotient == 9		; if ScoreQuotient equal to 9
		mov ninePosition.x, 78
		mov ninePosition.y, 30
		call nine					; print nine
	.ENDIF 
	
	;print remainder
	.IF ScoreRemainder == 0			; if ScoreRemainder equal to 0
		mov zeroPosition.x, 86
		mov zeroPosition.y, 30
		call zero					; print zero
	.ELSEIF ScoreRemainder == 1		; if ScoreRemainder equal to 1
		mov onePosition.x, 86
		mov onePosition.y, 30
		call one					; print one
	.ELSEIF ScoreRemainder == 2		; if ScoreRemainder equal to 2
		mov twoPosition.x, 86
		mov twoPosition.y, 30
		call two					; print two
	.ELSEIF ScoreRemainder == 3		; if ScoreRemainder equal to 3
		mov threePosition.x, 86
		mov threePosition.y, 30
		call three					; print three
	.ELSEIF ScoreRemainder == 4		; if ScoreRemainder equal to 4
		mov fourPosition.x, 86
		mov fourPosition.y, 30
		call four					; print four
	.ELSEIF ScoreRemainder == 5		; if ScoreRemainder equal to 5
		mov fivePosition.x, 86
		mov fivePosition.y, 30
		call five					; print five
	.ELSEIF ScoreRemainder == 6		; if ScoreRemainder equal to 6
		mov sixPosition.x, 86
		mov sixPosition.y, 30
		call six					; print six
	.ELSEIF ScoreRemainder == 7		; if ScoreRemainder equal to 7
		mov sevenPosition.x, 86
		mov sevenPosition.y, 30
		call seven					; print seven
	.ELSEIF ScoreRemainder == 8		; if ScoreRemainder equal to 8
		mov eightPosition.x, 86
		mov eightPosition.y, 30
		call eight					; print eight
	.ELSEIF ScoreRemainder == 9		; if ScoreRemainder equal to 9
		mov ninePosition.x, 86
		mov ninePosition.y, 30
		call nine					; print nine
	.ENDIF
	jmp Return						; return the procedure
	
WinScore:
	; print 100 when win the game
	INVOKE WriteConsoleOutputAttribute,
        meauHandle,
		ADDR WinScoreAttributes,
        14,
      	WinScorePosition,
        ADDR cellsWritten
	
	INVOKE WriteConsoleOutputCharacter,
        meauHandle,   
        ADDR WinScore0,  
     	14,
     	WinScorePosition,   
        ADDR cellsWritten

	inc WinScorePosition.Y
	
    INVOKE WriteConsoleOutputCharacter,
        meauHandle,   
        ADDR WinScore1,  
     	14,
     	WinScorePosition,   
        ADDR cellsWritten 

	inc WinScorePosition.Y

    INVOKE WriteConsoleOutputCharacter,
        meauHandle,   
        ADDR WinScore2,  
     	14,
     	WinScorePosition,   
        ADDR cellsWritten 

	inc WinScorePosition.Y

    INVOKE WriteConsoleOutputCharacter,
        meauHandle,   
        ADDR WinScore3,  
     	14,
     	WinScorePosition,   
        ADDR cellsWritten
	
delay_a_sec:
	; wait for 2 seconds
	 INVOKE GetTickCount
	 sub eax,wintime		; get the time now
	 .IF eax>=2000			; if pass 2 seconds
		call Clrscr			; call clear screen
		call win			; call win page
		call ReadChar		; call ReadChar
		.IF ax == 011bh		; if press esc
			exit			; exit
		.ENDIF
	 .ENDIF
	 jmp delay_a_sec		; if not until 2 seconds
	 

Return:
	ret						; return the procedure
Show_score ENDP

PRESS_OR_NOT PROC uses esi edx ebx eax
	call clock				; call clock
	call Readkey			; call Readkey
		.IF ax==3920h		; if press space	
			INVOKE GetTickCount			; get the time now
			mov losetime,eax			; and put it into losetime
			delay_a_sec2:
				INVOKE GetTickCount		; get the time now
				sub eax,losetime		; time now - losetime
				.IF eax>=1000			; delay the screen 1 sec
					call Clrscr
					call outover		; show GAMEOVER
					call ReadChar
					.IF ax == 011bh		; press esc to exit
						exit
					.ENDIF
				.ENDIF
			jmp delay_a_sec2
		.ENDIF
		jz return
return: 
	ret
PRESS_OR_NOT ENDP

;to show time coutdown
clock PROC uses esi eax ebx ecx
	INVOKE GetTickCount
	mov edx,0
	sub eax,startTime
	mov ebx,clockEndtime
	sub ebx,eax  ;let clockEndtime minus the time you spent will get the time you have
	mov eax,ebx
	mov ecx,10000
	div ecx		  ;divide time with 10000 then EAX will get first number of time
				  ;edx will get second number of time

	;印十位數
	.IF eax==0
		mov zeroPosition.X,20;
		mov zeroPosition.Y,30;
		call zero
	.ELSEIF eax==1
		mov onePosition.X,20;
		mov onePosition.Y,30;
		call one		
	.ELSEIF eax==2
		mov twoPosition.X,20;
		mov twoPosition.Y,30;
		call two
	.ELSEIF eax==3
		mov threePosition.X,20;
		mov threePosition.Y,30;
		call three
	.ELSEIF eax==4
		mov fourPosition.X,20;
		mov fourPosition.Y,30;
		call four
	.ELSEIF eax==5
		mov fivePosition.X,20;
		mov fivePosition.Y,30;
		call five
	.ELSEIF eax==6
		mov sixPosition.X,20;
		mov sixPosition.Y,30;
		call six
	.ELSEIF eax==7
		mov sevenPosition.X,20;
		mov sevenPosition.Y,30;
		call seven
	.ELSEIF eax==8
		mov eightPosition.X,20;
		mov eightPosition.Y,30;
		call eight
	.ELSEIF eax==9
		mov ninePosition.X,20;
		mov ninePosition.Y,30;
		call nine
	.ENDIF
	
	;印個位數

	.IF edx>=9000
		mov ninePosition.X,26;
		mov ninePosition.Y,30;
		call nine
		
	.ELSEIF edx>=8000
		mov eightPosition.X,26;
		mov eightPosition.Y,30;
		call eight

	.ELSEIF edx>=7000
		mov sevenPosition.X,26;
		mov sevenPosition.Y,30;
		call seven

	.ELSEIF edx>=6000
		mov sixPosition.X,26;
		mov sixPosition.Y,30;
		call six
	.ELSEIF edx>=5000
		mov fivePosition.X,26;
		mov fivePosition.Y,30;
		call five
	.ELSEIF edx>=4000
		mov fourPosition.X,26;
		mov fourPosition.Y,30;
		call four
	.ELSEIF edx>=3000
		mov threePosition.X,26;
		mov threePosition.Y,30;
		call three
	.ELSEIF edx>=2000
		mov twoPosition.X,26;
		mov twoPosition.Y,30;
		call two
	.ELSEIF edx>=1000
		mov onePosition.X,26;
		mov onePosition.Y,30;
		call one
	.ELSEIF edx>=0
		mov zeroPosition.X,26;
		mov zeroPosition.Y,30;
		call zero

	.ENDIF
	ret
clock ENDP
END main

