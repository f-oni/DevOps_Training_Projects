# Shell Scripting - Control Flow

The project is about how to navigate through decision points while writing codes. It also helps to manage the flow or sequence of instruction execution. The following were demonstrated:

- **if**
- **if-else**
- **for loops**

# Task

1.A file named **cotrol_flow.sh** was created using the *vim* editor. The command was **vim control_flow.sh**
2. After entering the *insert mode* with the letter *i* on the keyboard, the shebang (#!/bin/bash) was typed to the file.
3. The following line of code was entered into the script:
 *read -p "Enter a number :" num* 
 **read** is meant to get input from the user while "num" is a variable.
4. The file was saved (:wq) and the execute permission was granted to the user owner with the command: **sudo chmod u+x control_flow.sh**
5. It was executed with the command: **./control_flow.sh**

![image](https://github.com/user-attachments/assets/be036ec7-0167-421e-a2bd-30d12566374f)

6. There was no visible action from the terminal after accepting the input.
7. The code was updated as follows:
    *read -p "Enter a number :" num*
    *echo "You have entered the number $num"*
   There was an output when the updated script was executed as shown:

   ![image](https://github.com/user-attachments/assets/dd8530e0-0cbb-41f4-a18a-93392ddf519f)


 # The "IF" statement

 It is used to introduce a condition that should be met before an event takes place.
 a condition was introduced to the preceeding lines of code by means of an if statement as shown:
     *read -p "Enter a number :" num*
    *echo "You have entered the number $num"*
    * if [$num -gt 0]; then
    *echo "The number is positive"*
    *fi*

    ![image](https://github.com/user-attachments/assets/c4c5068d-7764-4026-9ce7-edb3649c03a7)

  Again, the script was executed and worked as expected.  

  
