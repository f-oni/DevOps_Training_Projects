# Working with Text Editors

The project fouses on how to use the two most popular text editors on Linux. Vim and Nano were utilized for the project. How to launch, enter, edit and delete texts were demonstrated for  each of the editors. Saving work and exiting the program was also demonstrated.

## vim Text Editor

**vim** was entered into the terminal to confirm the existence of the vim program on the server.

![image](https://github.com/user-attachments/assets/520bcafb-c3a6-446b-9ed4-4d6dc5005d7c)

 A new file was created by entering **vim exercise.txt** to the terminal

 ![image](https://github.com/user-attachments/assets/d09a7f39-9df1-4c97-8b85-e3b54db681de)

 The letter **i** on the keyboard was used to enter the insert mode
 
 ![image](https://github.com/user-attachments/assets/0194f063-c4dc-43a3-9de4-df0591cbd904)

 The following texts were entered in the insert mode as shown below:
 Hello, this is a vim hands-on project.
 Welcome to derey.io.

 ![image](https://github.com/user-attachments/assets/7cf98144-e534-46e3-9544-013540a2adcf)

 ## Navigation and Editing text in Vim

 The **esc key** was used to exit the insert mode. 

 ![image](https://github.com/user-attachments/assets/5d6c9dc6-e140-4ab2-83a1-f0c4aad08a9c)

 In the command mode of Vim, the letters on the keyboard, were used to navigate through the document
 - **l**  to move the cursor one step  to the right
 - **h** to move the cursor one step to the left
 - **j** to move the cursor one step down to the next line.
 - **k** to move the cursor one step up to the previous line.
   see screenshots below:
   ![image](https://github.com/user-attachments/assets/602d16dc-74b1-4cf0-974b-3606890f930a)

   ![image](https://github.com/user-attachments/assets/780baf6d-5288-46eb-9668-f6735f40dfd2)

   ![image](https://github.com/user-attachments/assets/b85f6245-6d80-4f09-bea8-5614fefd1b55)

   ![image](https://github.com/user-attachments/assets/da6b32ee-0a60-4849-ac87-ad7ae0a4a57c)

   ## Deletion, Undo and Saving in Vim

   After navigating the cursor to a charater of choice in the normal mode, the letter **x** on the keyboard was used to delete the character

   ![image](https://github.com/user-attachments/assets/94abe2d5-5ffb-44e2-8388-d89fa062bf78)

   While still in the normal mode and placing the cursor in line 2, the letter **d** was preesed two consecutive times to delete the line.

   ![image](https://github.com/user-attachments/assets/5b934a82-a821-4d53-b2fd-0eedc6f58469)
   
   The letter **u** on the keyboard was used to undo the deletion as shown below:

   ![line deletion undone](https://github.com/user-attachments/assets/7a87b22e-ef3a-470d-8737-60243ae5cc5e)

   **:wq** was used to write or save the changes and quit the program. And thus, reutured to the terminal


   ![image](https://github.com/user-attachments/assets/a8906acf-3e01-4744-a909-849efd6c37a5)

   The file was accessed again by typing: **vim exercise.txt**. The following key combination **:q!** was used to quit without saving changes

   ![image](https://github.com/user-attachments/assets/abcde94d-ddb0-48e8-a9d7-1ff77d203fd6)

   ## The Nano Editor

   To launch the nano editor and create a new file named "nano_file.txt", the following was entered to the terminal: **nano nano_file.txt**

   ![image](https://github.com/user-attachments/assets/7efa5cc4-d752-4837-85dc-c78b55540564)

   The interface is as shown below:

   ![image](https://github.com/user-attachments/assets/274eae34-0547-4840-86b0-3ac64fd01a06)

   The following lines of text were entered to the editor:
   *Hello, welcome to DevOps class.
   We are learning very fast.*

   ![image](https://github.com/user-attachments/assets/ca2450fb-40c1-4f86-bd8d-2c99cf55254a)

   The arrow keys on the keyboard were used to move the cursor up, down, left and right. The backspace key was used for deletion of characters.

   ![image](https://github.com/user-attachments/assets/235f6d76-f065-4165-b3b5-b984cc89578d)

  - **ctlr + o** was used to save the changes.

    ![image](https://github.com/user-attachments/assets/66a05860-28b5-4b89-af32-d66e47ecc41c)
    
  - **ctlr + x** was used to exit the nano program and returned to the terminal
    
    ![image](https://github.com/user-attachments/assets/828299a1-066f-49f4-a237-78d136078393)

 The existing *nano_file.txt* was re-accessed by using the command **nano nano_file.txt**

 ![image](https://github.com/user-attachments/assets/da7233bc-05fd-4ae6-adfc-df26a180673f)

 A third line was added: "The projects are interesting!"

 ![image](https://github.com/user-attachments/assets/82e203c6-2733-495a-b3c1-0b21d3a989da)

 **ctlr + x** was used to exit the nano program without saving but there was a prompt that requested confirmation to either save or discard the changes in form of "Yes" or "No". The "Y" option was selected to save the work and exit the nano program.

 ![image](https://github.com/user-attachments/assets/a8b4fb2d-d42d-436e-8747-7402db60a515)

 ## Conclusion
 The project made it possible to get better familiarity with the vim and nano text editors. file creation, text entry/insertion, editing existing files, saving and gracefully exiting the programs were thoroughly explored for each of the editors.


 





   






   




   











