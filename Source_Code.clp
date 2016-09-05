(defrule Menu
	(not (iffoundChoice ?))
=>
(printout t crlf crlf crlf
"	Choose one of the problem areas listed below" crlf crlf
"	1.) Patches of Dry, Itchy Skin. " crlf crlf
"	2.) Red Patches on the Skin." crlf crlf
"	3.) Stinging, and Burning between the toes." crlf crlf
"	4.) Small Pustules on their periphery-lips and mouth." crlf crlf
"	5.) Fever." crlf crlf
"	6.) Painless subcutaneous nodule followed by more nodules." crlf crlf
"	7.) Blisters which ooze." crlf crlf
"	8.) Scaly demarcated reddish brown plaques." crlf crlf
"	9.) Raspberry-like papule or nodule." crlf crlf
"	10.) Loss of sensation." crlf crlf
"	11.) Extensive sloughing of adjacent tissue." crlf crlf
"	12.) EXIT OF SYSTEM.." crlf crlf
"	Enter no. of your choice: " )
(assert (iffoundChoice (read))))

;; Rules common skin diseases in Africa

;;------------------R10------------------
(defrule Common_Skin_Diseases10
(iffoundChoice 1)
?retractCh1 <- (iffoundChoice 1)
(not (ifYesNochoice10 ?))
=>
(retract ?retractCh1)
(printout t crlf crlf crlf " Are you suffering from skin redness ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice10 (read))))

;;------------------R11------------------
(defrule Common_Skin_Diseases11
(ifYesNochoice10 yes)
?retractChy <- (ifYesNochoice10 yes)
(not (ifYesNochoice11 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from skin swelling ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice11 (read))))

;;------------------R12------------------
(defrule Common_Skin_Diseases12
(ifYesNochoice11 yes)
?retractChy <- (ifYesNochoice11 yes)
(not (ifYesNochoice12 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from papules, blisters, oozing or crust skin ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice12 (read))))

;;------------------R13------------------
(defrule Common_Skin_Diseases13
(ifYesNochoice12 yes)
?retractChy <- (ifYesNochoice12 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Eczema.. " crlf crlf " Remedy " crlf " Stop use of irritants such as Vaseline, mineral oils and soap. "crlf " Avoid extreme tempretures. "crlf " Avoid contact with wool. "crlf " Apply hydrocortisone cream until lesions clear. "crlf " Use antohistamines. "crlf crlf " Thank you for using our Program... "crlf crlf))


;;------------------R141------------------
(defrule Common_Skin_Diseases141
(ifYesNochoice12 no)
?retractChy <- (ifYesNochoice12 no)
(not (ifYesNochoice141 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Do you have fever ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice141 (read))))

;;------------------R142------------------
(defrule Common_Skin_Diseases142
(ifYesNochoice141 yes)
?retractChy <- (ifYesNochoice141 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Chicken pox.. " crlf crlf " Remedy " crlf " Calamine lotion or phenol-zinc lotion. "crlf " Antihistamine. "crlf " Use betadine scrub and chlorhexidine 1% mouthwash. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R14------------------
(defrule Common_Skin_Diseases14
(ifYesNochoice141 no)
?retractChy <- (ifYesNochoice141 no)
(not (ifYesNochoice153 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from scaling at the periphery - face, arms or shoulders ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice153 (read))))

;;------------------R15------------------
(defrule Common_Skin_Diseases15
(ifYesNochoice153 yes)
?retractChy <- (ifYesNochoice153 yes)
(not (ifYesNochoice143 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have round lesions ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice143 (read))))

;;------------------R180------------------
(defrule Common_Skin_Diseases180
(ifYesNochoice143 yes)
?retractChy <- (ifYesNochoice143 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Ringworms.. " crlf crlf " Remedy " crlf " Whitefields ointment twice a day for a minimum of 4 weeks. "crlf " Griseofulvin 500mg once a day 2-6 weeks (adults); 10-15mg once a day 2–6 weeks (children). "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R167------------------
(defrule Common_Skin_Diseases167
(ifYesNochoice143 no)
?retractChy <- (ifYesNochoice143 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R160------------------
(defrule Common_Skin_Diseases160
(ifYesNochoice153 no)
?retractChy <- (ifYesNochoice153 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R144------------------
(defrule Common_Skin_Diseases144
(ifYesNochoice11 no)
?retractChy <- (ifYesNochoice11 no)
(not (ifYesNochoice144 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from scaling at the periphery - face, arms or shoulders ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice144 (read))))

;;------------------R145------------------
(defrule Common_Skin_Diseases145
(ifYesNochoice144 no)
?retractChy <- (ifYesNochoice144 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R146------------------
(defrule Common_Skin_Diseases146
(ifYesNochoice144 yes)
?retractChy <- (ifYesNochoice144 yes)
(not (ifYesNochoice145 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from round lesions ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice145 (read))))

;;------------------R147------------------
(defrule Common_Skin_Diseases147
(ifYesNochoice145 no)
?retractChy <- (ifYesNochoice145 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R148------------------
(defrule Common_Skin_Diseases148
(ifYesNochoice145 yes)
?retractChy <- (ifYesNochoice145 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Ringworms.. " crlf crlf " Remedy " crlf " Whitefields ointment twice a day for a minimum of 4 weeks. "crlf " Griseofulvin 500mg once a day 2-6 weeks (adults); 10-15mg once a day 2–6 weeks (children). "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R120------------------
(defrule Common_Skin_Diseases120
(ifYesNochoice10 no)
?retractChy <- (ifYesNochoice10 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))


;;------------------R20------------------
(defrule Common_Skin_Diseases20
(iffoundChoice 2)
?retractCh2 <- (iffoundChoice 2)
(not (ifYesNochoice20 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are you suffering from round lesions ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice20 (read))))

;;------------------R21------------------
(defrule Common_Skin_Diseases21
(ifYesNochoice20 yes)
?retractChy <- (ifYesNochoice20 yes)
(not (ifYesNochoice21 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from scaling at the periphery - face, arms or shoulders ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice21 (read))))

;;------------------R24------------------
(defrule Common_Skin_Diseases24
(ifYesNochoice20 no)
?retractChy <- (ifYesNochoice20 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R22------------------
(defrule Common_Skin_Diseases22
(ifYesNochoice21 yes)
?retractChy <- (ifYesNochoice21 yes)
(not (ifYesNochoice22 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you feeling itchness ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice22 (read))))

;;------------------R241------------------
(defrule Common_Skin_Diseases241
(ifYesNochoice21 no)
?retractChy <- (ifYesNochoice21 no)
(not (ifYesNochoice241 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Do you have fever ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice241 (read))))

;;------------------R242------------------
(defrule Common_Skin_Diseases242
(ifYesNochoice241 yes)
?retractChy <- (ifYesNochoice241 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Chicken pox.. " crlf crlf " Remedy " crlf " Calamine lotion or phenol-zinc lotion. "crlf " Antihistamine. "crlf " Use betadine scrub and chlorhexidine 1% mouthwash. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R214------------------
(defrule Common_Skin_Diseases214
(ifYesNochoice241 no)
?retractChy <- (ifYesNochoice241 no)
(not (ifYesNochoice253 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from scaling at the periphery - face, arms or shoulders ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice253 (read))))

;;------------------R215------------------
(defrule Common_Skin_Diseases215
(ifYesNochoice253 yes)
?retractChy <- (ifYesNochoice253 yes)
(not (ifYesNochoice243 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have round lesions ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice243 (read))))

;;------------------R280------------------
(defrule Common_Skin_Diseases280
(ifYesNochoice243 yes)
?retractChy <- (ifYesNochoice243 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Ringworms.. " crlf crlf " Remedy " crlf " Whitefields ointment twice a day for a minimum of 4 weeks. "crlf " Griseofulvin 500mg once a day 2-6 weeks (adults); 10-15mg once a day 2–6 weeks (children). "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R267------------------
(defrule Common_Skin_Diseases267
(ifYesNochoice243 no)
?retractChy <- (ifYesNochoice243 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R260------------------
(defrule Common_Skin_Diseases260
(ifYesNochoice253 no)
?retractChy <- (ifYesNochoice253 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R23------------------
(defrule Common_Skin_Diseases23
(ifYesNochoice22 yes)
?retractChy <- (ifYesNochoice22 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Ringworms.. " crlf crlf " Remedy " crlf " Whitefields ointment twice a day for a minimum of 4 weeks. "crlf " Griseofulvin 500mg once a day 2-6 weeks (adults); 10-15mg once a day 2–6 weeks (children). "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R26------------------
(defrule Common_Skin_Diseases26
(ifYesNochoice22 no)
?retractChy <- (ifYesNochoice22 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R30------------------
(defrule Common_Skin_Diseases30
(iffoundChoice 3)
?retractCh2 <- (iffoundChoice 3)
(not (ifYesNochoice30 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are you suffering from itchiness ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice30 (read))))

;;------------------R31------------------
(defrule Common_Skin_Diseases31
(ifYesNochoice30 yes)
?retractChy <- (ifYesNochoice30 yes)
(not (ifYesNochoice31 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from white scaling lesions ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice31 (read))))

;;------------------R34------------------
(defrule Common_Skin_Diseases34
(ifYesNochoice30 no)
?retractChy <- (ifYesNochoice30 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R32------------------
(defrule Common_Skin_Diseases32
(ifYesNochoice31 yes)
?retractChy <- (ifYesNochoice31 yes)
(not (ifYesNochoice32 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from inflammation of the skin ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice32 (read))))

;;------------------R35------------------
(defrule Common_Skin_Diseases35
(ifYesNochoice31 no)
?retractChy <- (ifYesNochoice31 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R33------------------
(defrule Common_Skin_Diseases33
(ifYesNochoice32 yes)
?retractChy <- (ifYesNochoice32 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Ringworm.. " crlf crlf " Remedy " crlf " Keep space in-between the toes dry e.g dry skin thoroughly after washing, exposing to air, GV paint, cotton socks. "crlf " Imidazole/ Whitefields cream for 4 weeks. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R36------------------
(defrule Common_Skin_Diseases36
(ifYesNochoice32 no)
?retractChy <- (ifYesNochoice32 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R40------------------
(defrule Common_Skin_Diseases40
(iffoundChoice 4)
?retractCh2 <- (iffoundChoice 4)
(not (ifYesNochoice40 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are you suffering from red macules ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice40 (read))))

;;------------------R41------------------
(defrule Common_Skin_Diseases41
(ifYesNochoice40 yes)
?retractChy <- (ifYesNochoice40 yes)
(not (ifYesNochoice41 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you feeling itchiness and pain  ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice41 (read))))

;;------------------R43------------------
(defrule Common_Skin_Diseases43
(ifYesNochoice40 no)
?retractChy <- (ifYesNochoice40 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R42------------------
(defrule Common_Skin_Diseases42
(ifYesNochoice41 yes)
?retractChy <- (ifYesNochoice41 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Thrush.. " crlf crlf " Remedy " crlf " GV solution. "crlf " Potassium permanganate dressing. "crlf " Nystalin Ointment twice daily for 2 weeks. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R44------------------
(defrule Common_Skin_Diseases44
(ifYesNochoice41 no)
?retractChy <- (ifYesNochoice41 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R50------------------
(defrule Common_Skin_Diseases50
(iffoundChoice 5)
?retractCh2 <- (iffoundChoice 5)
(not (ifYesNochoice50 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are you suffering from red macules ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice50 (read))))

;;------------------R51------------------
(defrule Common_Skin_Diseases51
(ifYesNochoice50 yes)
?retractChy <- (ifYesNochoice50 yes)
(not (ifYesNochoice51 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you feeling itchiness ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice51 (read))))

;;------------------R53------------------
(defrule Common_Skin_Diseases53
(ifYesNochoice50 no)
?retractChy <- (ifYesNochoice50 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R542------------------
(defrule Common_Skin_Diseases542
(ifYesNochoice51 yes)
?retractChy <- (ifYesNochoice51 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Chicken pox.. " crlf crlf " Remedy " crlf " Calamine lotion or phenol-zinc lotion. "crlf " Antihistamine. "crlf " Use betadine scrub and chlorhexidine 1% mouthwash. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R514------------------
(defrule Common_Skin_Diseases514
(ifYesNochoice51 no)
?retractChy <- (ifYesNochoice51 no)
(not (ifYesNochoice553 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from scaling at the periphery - face, arms or shoulders ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice553 (read))))

;;------------------R515------------------
(defrule Common_Skin_Diseases515
(ifYesNochoice553 yes)
?retractChy <- (ifYesNochoice553 yes)
(not (ifYesNochoice243 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have round lesions ? (yes | no) " crlf crlf " Your answer: ")
(assert (ifYesNochoice543 (read))))

;;------------------R580------------------
(defrule Common_Skin_Diseases580
(ifYesNochoice543 yes)
?retractChy <- (ifYesNochoice543 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Ringworms.. " crlf crlf " Remedy " crlf " Whitefields ointment twice a day for a minimum of 4 weeks. "crlf " Griseofulvin 500mg once a day 2-6 weeks (adults); 10-15mg once a day 2–6 weeks (children). "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R567------------------
(defrule Common_Skin_Diseases567
(ifYesNochoice543 no)
?retractChy <- (ifYesNochoice543 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R560------------------
(defrule Common_Skin_Diseases560
(ifYesNochoice253 no)
?retractChy <- (ifYesNochoice253 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))


;;------------------R52------------------
(defrule Common_Skin_Diseases52
(ifYesNochoice51 yes)
?retractChy <- (ifYesNochoice51 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Chicken pox.. " crlf crlf " Remedy " crlf " Calamine lotion or phenol-zinc lotion. "crlf " Antihistamine. "crlf " Use betadine scrub and chlorhexidine 1% mouthwash. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R54------------------
(defrule Common_Skin_Diseases54
(ifYesNochoice51 no)
?retractChy <- (ifYesNochoice51 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R60------------------
(defrule Common_Skin_Diseases60
(iffoundChoice 6)
?retractCh2 <- (iffoundChoice 6)
(not (ifYesNochoice60 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are you suffering from lesions on the body especially feet ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice60 (read))))

;;------------------R61------------------
(defrule Common_Skin_Diseases61
(ifYesNochoice60 yes)
?retractChy <- (ifYesNochoice60 yes)
(not (ifYesNochoice61 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you experiencing a discharge of pus with grains ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice61 (read))))

;;------------------R64------------------
(defrule Common_Skin_Diseases64
(ifYesNochoice60 no)
?retractChy <- (ifYesNochoice60 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R62------------------
(defrule Common_Skin_Diseases62
(ifYesNochoice61 yes)
?retractChy <- (ifYesNochoice61 yes)
(not (ifYesNochoice62 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from formation of abscesses and ulcers which spread to bones and joints ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice62 (read))))

;;------------------R65------------------
(defrule Common_Skin_Diseases65
(ifYesNochoice61 no)
?retractChy <- (ifYesNochoice61 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R63------------------
(defrule Common_Skin_Diseases63
(ifYesNochoice62 yes)
?retractChy <- (ifYesNochoice62 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Madura Foot.. " crlf crlf " Remedy " crlf " Remove the smaller lesions surgically. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R66------------------
(defrule Common_Skin_Diseases66
(ifYesNochoice62 no)
?retractChy <- (ifYesNochoice62 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R70------------------
(defrule Common_Skin_Diseases70
(iffoundChoice 7)
?retractCh2 <- (iffoundChoice 7)
(not (ifYesNochoice70 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Do the blisters have yellow crusts ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice70 (read))))

;;------------------R71------------------
(defrule Common_Skin_Diseases71
(ifYesNochoice70 yes)
?retractChy <- (ifYesNochoice70 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Impetigo.. " crlf crlf " Remedy " crlf " Avoid sharing things such as clothes, towels, Vaseline."crlf " Don’t use Vaseline, use aqueous cream instead."crlf " Doxacilin 250 mg / 4 times a day for 7-10 days."crlf " Dress affected areas with GV, saline solution, betadine solution. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R72------------------
(defrule Common_Skin_Diseases72
(ifYesNochoice70 no)
?retractChy <- (ifYesNochoice70 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R80------------------
(defrule Common_Skin_Diseases80
(iffoundChoice 8)
?retractCh2 <- (iffoundChoice 8)
(not (ifYesNochoice80 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are the plaques dry, smooth to slightly creased ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice80 (read))))

;;------------------R81------------------
(defrule Common_Skin_Diseases81
(ifYesNochoice80 yes)
?retractChy <- (ifYesNochoice80 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Erythrasma.. " crlf crlf " Remedy " crlf " An imidazole cream twice daily for 4 weeks. If not effective or recurrent infection:.."crlf crlf" Erythromycin 250 mg 4 times daily for 2 weeks ."crlf " Erythromycin 2% lotion twice daily for 4 week. "crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R82------------------
(defrule Common_Skin_Diseases82
(ifYesNochoice80 no)
?retractChy <- (ifYesNochoice80 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))


;;------------------R90------------------
(defrule Common_Skin_Diseases90
(iffoundChoice 9)
?retractCh2 <- (iffoundChoice 9)
(not (ifYesNochoice90 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are they wet, easily bleeding ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice90 (read))))

;;------------------R91------------------
(defrule Common_Skin_Diseases91
(ifYesNochoice90 yes)
?retractChy <- (ifYesNochoice90 yes)
(not (ifYesNochoice91 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from nodules, ulcerations ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice91 (read))))

;;------------------R93------------------
(defrule Common_Skin_Diseases93
(ifYesNochoice90 no)
?retractChy <- (ifYesNochoice90 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R92------------------
(defrule Common_Skin_Diseases92
(ifYesNochoice91 yes)
?retractChy <- (ifYesNochoice91 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Yaws.. " crlf crlf " Remedy " crlf " Benzathine penicillin 2,4 million units per IM injection, repeat after two weeks. For children benzathine penicillin 1,2 million units per IM injection, repeat after two weeks "crlf " In case of penicillin-allergy: Erythromycin 500 mg 4 times daily for 2 weeks." crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R94------------------
(defrule Common_Skin_Diseases94
(ifYesNochoice91 no)
?retractChy <- (ifYesNochoice91 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R100------------------
(defrule Common_Skin_Diseases100
(iffoundChoice 10)
?retractCh2 <- (iffoundChoice 10)
(not (ifYesNochoice100 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Do you have enlargement of great auricular, ulnar and radiocutaneous nerves ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice100 (read))))

;;------------------R101------------------
(defrule Common_Skin_Diseases101
(ifYesNochoice100 yes)
?retractChy <- (ifYesNochoice100 yes)
(not (ifYesNochoice101 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Do you have Patches or papules and nodules dry skin with or without ulcers fingers are bent or even lost ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice101 (read))))

;;------------------R103------------------
(defrule Common_Skin_Diseases103
(ifYesNochoice100 no)
?retractChy <- (ifYesNochoice100 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R102------------------
(defrule Common_Skin_Diseases102
(ifYesNochoice101 yes)
?retractChy <- (ifYesNochoice101 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Leprosy.. " crlf crlf " Remedy " crlf " Rifampicine 600 mg once a month under supervision plus dapsone (DDS) 100 mg daily for 6 months unsupervised. " crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R104------------------
(defrule Common_Skin_Diseases104
(ifYesNochoice101 no)
?retractChy <- (ifYesNochoice101 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))


;;------------------R110------------------
(defrule Common_Skin_Diseases110
(iffoundChoice 11)
?retractCh2 <- (iffoundChoice 11)
(not (ifYesNochoice110 ?))
=>
(retract ?retractCh2)
(printout t crlf crlf crlf " Are you suffering from peridontitis, then ulcerative stomatitis ? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice110 (read))))

;;------------------R111------------------
(defrule Common_Skin_Diseases111
(ifYesNochoice110 yes)
?retractChy <- (ifYesNochoice110 yes)
(not (ifYesNochoice111 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you suffering from necrosis of bone with foul-smelling and very painful? (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoice111 (read))))

;;------------------R113------------------
(defrule Common_Skin_Diseases113
(ifYesNochoice110 no)
?retractChy <- (ifYesNochoice110 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))

;;------------------R112------------------
(defrule Common_Skin_Diseases112
(ifYesNochoice111 yes)
?retractChy <- (ifYesNochoice111 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf" You are suffering from Noma.. " crlf crlf " Remedy " crlf " Oral hygiene. " crlf " Doses of penicillin." crlf " High protein diet." crlf crlf " Thank you for using our Program... "crlf crlf))

;;------------------R114------------------
(defrule Common_Skin_Diseases114
(ifYesNochoice111 no)
?retractChy <- (ifYesNochoice111 no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You should be sure for your symptoms.. Try again..." crlf crlf " Thank you for using my Program... "crlf crlf ))
