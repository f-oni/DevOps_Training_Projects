# Shell Scripting - Control Flow

The project is about how to navigate through decision points while writing codes. It also helps to manage the flow or sequence of instruction execution. The following were demonstrated:

- **if**
- **if-else**
- **for loops**

# Task

1. A file named **cotrol_flow.sh** was created using the *vim* editor. The command was **vim control_flow.sh**
2. After entering the *insert mode* with the letter *i* on the keyboard, the shebang (#!/bin/bash) was typed to the file.
3. The following line of code was entered into the script:
 *read -p "Enter a number :" num* 
 **read** is meant to get input from the user while "num" is a variable.
4. The file was saved (:wq) and the execute permission was granted to the user owner with the command: **sudo chmod u+x control_flow.sh**
5. It was executed with the command: **./control_flow.sh**

![image](https://github.com/user-attachments/assets/be036ec7-0167-421e-a2bd-30d12566374f)

6. There was no visible action from the terminal after accepting the input.
7. The code was updated as follows:
   
        read -p "Enter a number :" num
        echo "You have entered the number $num"
   
   The output of the updated script was executed as shown:

   ![image](https://github.com/user-attachments/assets/dd8530e0-0cbb-41f4-a18a-93392ddf519f)


 ## The "IF" statement

 It is used to introduce a condition that should be met before an event takes place.
 a condition was introduced to the preceeding lines of code by means of an if statement as shown:
 
     read -p "Enter a number :" num
     echo "You have entered the number $num"
     if [$num -gt 0]; then
     echo "The number is positive"
     fi

The **-gt** (greater than) is a comparison operator in the conditional block
Again, the script was executed and it worked as expected

    ![image](https://github.com/user-attachments/assets/c4c5068d-7764-4026-9ce7-edb3649c03a7)

## The "IF-Else" Statement  

By means of another block, an **elif** (else if) statement was added to the code in order to introduce another test condition if the previous condition was not met. The latest code is shown below:

     read -p "Enter a number :" num
     echo "You have entered the number $num"
     if [$num -gt 0]; then
     echo "The number is positive"
     elif [$num -lt 0]; then
     echo "The number is negative"
     fi
    
The **-gt** (greater than), is a comparison operator in the conditional block

 ![image](https://github.com/user-attachments/assets/913ba454-193c-4abe-93a0-4c175d0a867d)
    
The latest script was saved and executed: **./control_flow.sh**. It was succesful with the following output:

![image](https://github.com/user-attachments/assets/882d128a-5218-4e96-a3a3-a689332b5780)

# The loops 

Amongst others, the **for** loop was used for the project demonstration and two forms of the **for** loops were considered:

- The list form **for** loop
- The c-style form **for** loop

## The list form "for" loop

Another file was created and the following lines of code were entered in order to illustrate the basic syntax of the **for** loop

      for i in 1 2 3 4 5
      do
           echo "Hello, world!, this is message $i"
      done

   ![image](https://github.com/user-attachments/assets/a2a14915-07f0-4dbe-a06b-30613d2151ff)

    After granting the "execute" permission to the user owner, the file was executed with the following output.

    ![image](https://github.com/user-attachments/assets/de2e2971-fc27-4715-aa24-35bbe3d79b72)

    A second example was demonstrated by creating another file and entering the following lines of code:

         for i in {"1..5"}
         do
              echo "Counting ... $i
         done
     
The appropriate permission was granted to the user owner and the file was executed sucessfully. The output is shown below:

![image](https://github.com/user-attachments/assets/f729ed99-6471-43b9-b1f9-056033bc4132)


## The c-style form "for" loop

The basic syntax is illustrated below:

          for ((i=0; 1<5; i++)); do
                echo "Number $i"
          done

where "i=0" is the start of the loop, which in this case, initializes to 0. The "1<5" is the condition for the loop to continue running or to terminate and "i++" is the incremental. The code is illustrated below:

![image](https://github.com/user-attachments/assets/aa5c14db-d08e-446c-a010-8723d1ad75b7)

The required permission was granted to the user owner and the file was executed successfully. The output is shown below:

![image](https://github.com/user-attachments/assets/482542ab-ca22-4101-9194-f8e056e636f2)

## Conclusion

The project introduces conditionals and loops which are very essential for decisions and iterations in scripting.









  
