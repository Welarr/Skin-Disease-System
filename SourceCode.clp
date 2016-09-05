(defglobal ?*explanaition* = NIL) ; Global Variable for explanation facility
(defglobal ?*remedy-file* = remedy.txt) ; Global Variable for inferencing the remedy

;Definition of templates to draw records from the file

(deftemplate symptom-details
    (slot symptom-name)    
    (slot disease)
    (slot exists (default no))
    (slot weight (default 0)))

(deftemplate disease-weight
    (slot disease-name )    
    (slot weight (default 0)))

; Definition of functions--------------------------------------

(deffunction ask-question (?question $?allowed-values)
    (printout t ?question) ;prints question
    (bind ?answer (read)) ;reads user input and binds to lower case
    (if (lexemep ?answer) 
        then (bind ?answer (lowcase ?answer)))
    (while 
        (not (member ?answer ?allowed-values)) 
        do
            (printout t ?question)
            (bind ?answer (read))
            (if (lexemep ?answer) 
                then (bind ?answer (lowcase ?answer))
            )
    )
?answer)

(deffunction yes-or-no-p (?question) ;responses allowed in the system
    (bind ?response (ask-question ?question yes no y n))
    (if (or (eq ?response yes) (eq ?response y))
        then yes 
    else no)
)

(deffunction show-explanaition (?response)
    (if (or (eq ?response yes) (eq ?response y))
        then (bind ?*explanaition* TRUE) 
    else (bind ?*explanaition* FALSE) )
)


;Dynamic creation of rules------------------------------------------------------------------------------------------

;Function to make the question rules dynamically.This allows addition for new rules through the text files

(deffunction make-questions (?template ?disease ?symptom ?question ?weight)
    (bind ?symp-rule (str-cat "know-" ?symptom)) ;append know to the rule name
    (build (str-cat "(defrule " ?symp-rule " (not (diagnosis ?))  ;define the rules                
        =>
        (assert
            (" ?template "
                
                (disease " ?disease ")
                (symptom-name " ?symptom")
                (exists 
                    (yes-or-no-p " ?question "))
                (weight " ?weight "))))"
            )
        )
)

; Dynamically generate rules to check for diagnosis;
(deffunction make-diagnosis (?disease)
    (bind ?symp-rule (str-cat "check-" ?disease "-diagnosis"))
    (build (str-cat "(defrule " ?symp-rule"(not (diagnosis ?))  ;define rules               
        =>
        (assert (" ?symp-rule ")))"
)))

;Creates remedy rules dynamically
(deffunction show-remedy (?dis ?disease $?filename)    
    (if (eq (length ?filename) 0)
        then (bind ?filename remedy.txt)
    else 
        (bind ?filename (implode$ (subseq$ ?filename 1 1))))
    (open ?filename file-data) ; open the file and store data in file-data
    (bind ?stop FALSE) ; initialize stop  to FALSE
    (bind ?dis-tmp (read file-data)) ;get values from the file
    (bind ?disease-tmp (read file-data)) ;get values from the file
    
    (while (not ?stop) ; while  stop is still not TRUE
        (bind ?temp-line (readline file-data))
        (if (and (eq ?dis ?dis-tmp)
        (eq ?disease ?disease-tmp))
            then 
                (if (eq ?temp-line EOF) ; if End of File reached
                    then 
                    (printout t crlf "I hope that I have been of assistance ☺ ☻ ☻ ☺" crlf)
                    (bind ?stop TRUE) ; Set stop variable to TRUE to stop the loop

                else (if (eq ?temp-line "ENDDISEASE") ;End of the details of a particular disease
                    then
                    (printout t crlf crlf  " Thank you for using the Skin Disease Diagnosis Expert System!" crlf crlf)
                    (bind ?stop TRUE) ; Set stop variable to TRUE to stop the loop

                else (if (eq ?temp-line "") ; If reads empty string, do nothing
                        then (printout t "") 

                else
                    (printout t crlf ?temp-line crlf)
                    )))

            else (if (eq ?temp-line "ENDDISEASE") ; if End of disease details
                then 
                (bind ?dis-tmp (read file-data))
                (bind ?disease-tmp (read file-data)) 

            else if (eq ?temp-line "EOF"
                then
                (printout t "Sorry, we could not find any advice for this Diagnosis :(" )
                (bind ?stop TRUE)
                )))
    ) ; end while loop
(close)) ;closes the remedy text file

; Dynamically generate diagnosis rules
(deffunction gen-diagnosis-rules (?disease ?diagnosis-patient)
    (bind ?diagnosis-rule-name (str-cat "confirm-" ?disease)) ;get rule name and bind to rule
    (bind ?diagnosis-question (str-cat "check-" ?disease "-diagnosis")) ;get question
    (bind ?threshold 0.65) ; threshold value for certainity of a disease
    (build (str-cat "(defrule " ?diagnosis-rule-name " ?probable_disease <- (" ?diagnosis-question ")
        =>
        (retract ?probable_disease)
            (if (diagnose-patient-disease " ?disease " " ?threshold ")
                then
                (assert (diagnosis " ?diagnosis-patient"  " ?disease "))
                ))"
)))

;Functions for reading text files------------------------------------------------------------------------------

(deffunction read-symptoms-file (?template ?file)
    (open ?file file-data) ; open the symptoms file and store data in file-data
    (bind ?stop FALSE) 
    (bind ?disease (read file-data)) ;get disease from symptoms file

    (while (not ?stop) ; while stop variable is not TRUE
        (bind ?temp-line (readline file-data)) ; read the whole line from the symptoms file

        (if (eq ?temp-line EOF) ; if End of File
            then (bind ?stop TRUE) ; Set stop variable to TRUE

        else (if (eq ?temp-line "ENDDISEASE") ;If it is at the end of the details of a disease 
            then
            (make-diagnosis ?disease)
            (bind ?disease (read file-data)) ; Continue reading the next disease details

        else (if (eq ?temp-line "") ; Function reads an empty string and prints out nothing
                then (printout t "") 

        else
            (bind ?exp-line (explode$ ?temp-line)) ; delimits the line read using spaces

            (make-questions ;Create the rules for the questions for user interaction
                ?template                
                ?disease
                (implode$ (subseq$ ?exp-line 1 1)) ;generate string from multifield values
                (implode$ (subseq$ ?exp-line 2 2))
                (implode$ (subseq$ ?exp-line 3 3)))
            ))))
(close)) ;Close the symptoms file correctly


(deffunction read-skin-diseases-file (?file)
    (open ?file file-data) ; open the file and store data in file-data
    (bind ?stop FALSE) ; initialize stop variable to FALSE
    (bind ?disease-name (read file-data))

    (while (not ?stop) ; while stop variable is not TRUE
        (bind ?temp-line (readline file-data)) ; read entire line from text file

        (if (eq ?temp-line EOF) ; if reached the End of File
            then (bind ?stop TRUE) ; Set stop variable to TRUE

        else(if (eq ?temp-line "ENDDISEASE") ;End of the details of a disease
            then
            (bind ?disease-name(read file-data))

        else (if (eq ?temp-line "") ; If reads empty string hence does nothing
                then (printout t "") 

        else
            (bind ?exp-line (explode$ ?temp-line)) ; delimits the line read using spaces
            (gen-diagnosis-rules ;create the rules needed to diagnose patients                
                (implode$ (subseq$ ?exp-line 1 1))
                (implode$ (subseq$ ?exp-line 2 2)))
            ))))
(close)) ;close the file when done

;Definition of Rules.-------------------------------------------------------------------------------------------------
;Start of the program

(defrule system-banner ""
    (declare (salience 10))
    =>
    (printout t crlf)
    (printout t "******************************************************" crlf)
    (printout t "        SKIN DISEASE EXPERT SYSTEM " crlf)
    (printout t "******************************************************")
    (printout t crlf crlf))

;Determines whether system should show explainations for disease certainity

(defrule determine-explanaition "Rules without explanaition"
    (declare (salience 9))
    (not (explanaition ?))
    =>
    (show-explanaition (yes-or-no-p "Would you like to see explanaition for the conclusions? (yes/no)? "))
    (printout t "" crlf)
    (assert (explanaition)))

;Load Text files by calling the functions read-symptoms-file AND read-skin-diseases-file
(defrule initiate
   (declare (salience 1))
   =>
   (read-symptoms-file symptom-details symptoms.txt) ;call functions
   (read-skin-diseases-file skin-diseases.txt))

;Rule to diagnose a patient
(defrule diagnose-patient
   (not (diagnosis ?))
   =>
   (assert (probable-disease)))

;Rule to get disease while considering the certainity levels
(defrule get-probable-disease
    (not (diagnosis ?))
    ?probable_disease <- (probable-disease)

    (disease-weight (disease-name ?patient-disease)                    
        (weight ?weight1))
        (not (disease-weight (weight ?weight2&:(> ?weight2 ?weight1))))
        =>
        
    (printout t crlf crlf "The symptoms provided is not enough to conclude a disease with high certainity " crlf
        "However, the patient is most likely suffering from: " ?patient-disease crlf)
)
; Get confidence level, diagnose with regards to the threshold
(deffunction diagnose-patient-disease (?disease ?threshold) ;receives arguements of a disease and the threshold
    (bind ?weight 1)
    (if ?*explanaition* ; if explanaition question answered as YES
        then
        (printout t "" crlf 
            "The system is computing the confidence level for " ?disease crlf)
        )

        (do-for-all-facts ((?g symptom-details)) ;repeat with all symptoms facts
            (and 
                (eq ?g:exists yes)            
                (eq ?g:disease ?disease)
            )

            (if ?*explanaition*
                then
                (printout t ?g:symptom-name " confidence level: " ?g:weight crlf)            
                (printout t "Calculation: " ?weight " * (1 - "  ?g:weight ")" crlf)) ;Calculate the confidence level
                (bind ?weight (* ?weight (- 1 ?g:weight)))
                
            (if ?*explanaition*
                then
                (printout t "= " ?weight crlf "" crlf)))

            (if ?*explanaition*
                then
                (printout t "Confidence Level of Skin Disease:" ?disease " (1 - " ?weight ")"crlf))
                (bind ?weight (- 1 ?weight))

            (if ?*explanaition*
                then
                (printout t "= " ?weight crlf 
                    "Threshold" crlf "= "?threshold crlf crlf))

            (assert (disease-weight (disease-name ?disease) (weight ?weight)))

            (if (> ?weight ?threshold)
                then TRUE))


;Display the Diagnosis and Remedies

(defrule print-diagnosis ""
    (declare (salience 10))
    (diagnosis ?statement ?dis ?disease)
    =>
    (printout t crlf crlf)    
    (format t " %s%n%n" ?statement)
    (printout t "  ------------Remedy Solutions---------------- " crlf)
    (show-remedy ?dis ?disease)
    (assert (diagnosis TRUE)))