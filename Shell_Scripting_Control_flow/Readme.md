# Shell Scripting - Control Flow

The project is about how to navigate through decision points while writing codes. It also helps to manage the flow or sequence of instruction execution. The following were demonstrated:

- **if**
- **if-else-else**
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
   
   The output of the updated script when executed displayed the number inputed by the user as shown:

   ![image](https://github.com/user-attachments/assets/dd8530e0-0cbb-41f4-a18a-93392ddf519f)


 ## The "IF" statement

 It is used to introduce a condition that should be met before an event takes place. A script with the name "check_number.sh" was created and the following lines of codes were entered in order to demonstrate the **if** statement. The condition checks if the user input was positive by including a comparison operator **-gt**. If the the user input is greater zero the output would be "The number is positive"   
 
     read -p "Enter a number :" num
     echo "You have entered the number $num"
     if [$num -gt 0]; then
     echo "The number is positive"
     fi

![image](https://github.com/user-attachments/assets/00b9fd34-d514-4bd4-b16e-c7e2b85ec01a)

Appropriate permission was granted to the user owner and the script was executed. The user responded by inputing number 8. The displayed output is shown below:
      "You have entered the number 8."
       "The number is positive"

![image](https://github.com/user-attachments/assets/c8d01f95-35e8-461f-8153-0c844a1d253d)




## The "IF-elif-else" Statement  

By means of two additional blocks, **elif** (else if) and **else** statements were added to the code in order to introduce another test condition if the previous condition was not met. The The **-lt** (less than) comparator was introduced as chwck if the user input was less than zero. If the input was less than 0, then the output would be "The number is negative". The last block (else) was the is the final decision if the user input was neither positive nor negative. In that case, it would display "The number is zero" 

     read -p "Enter a number :" num
         echo "You have entered the number $num"
     if [$num -gt 0]; then
         echo "The number is positive"
     elif [$num -lt 0]; then
         echo "The number is negative"
     else 
         echo "The number is zero"
     fi
    
![image](https://github.com/user-attachments/assets/28f5c32c-97cd-47d6-81f7-160a8238b6a5)

    
The latest script was saved and executed to test the three coditions: **./check_number.sh**. It was succesful with the following output:


          - First execution output:
            "You have entered the number 6"
             "The number is positive"
          - Second execution output:
             "You have entered the number -3"
              "The number is negative"
          - Third execution output:
               "You have entered the number 0"
                "The number is zero"
  
The execution output for each of the conditions is shown below:

![image](https://github.com/user-attachments/assets/35df9479-7b0d-4fd3-91ba-6cdd4a112186)



# The loops 

Amongst others, the **for** loop was used for the project demonstration and three forms of the **for** loops were considered:

- The list form **for** loop
- The range-based **for**loop
- The c-style form **for** loop

## The list form "for" loop

Another file with the name "loop_list.sh"  was created and the following lines of code were entered in order to illustrate the basic syntax of the list form **for** loop

      for i in 1 2 3 4 5
      do
           echo "Hello, world!, this is message $i"
      done

   ![image](https://github.com/user-attachments/assets/28a82fbc-d64e-4f35-a724-369ac431931b)


    After granting the "execute" permission to the user owner, the file was executed with the following output.
            
            Hello, world!, this is message 1
            Hello, world!, this is message 2
            Hello, world!, this is message 3
            Hello, world!, this is message 4
            Hello, world!, this is message 5


 
 ![image](https://github.com/user-attachments/assets/0e2d0f17-a367-45ba-99df-d4a97325291a)


   ## The range-based **for**loop
   
A file was created with the name "loop_range.sh" to demonstrate the range-based **for** loop. The lines of code was entered

         for i in {1..5}
         do
              echo "Counting ... $i
         done

![image](https://github.com/user-attachments/assets/d4b52360-4d54-4267-b1b0-83d00b2bf632)
     
The appropriate permission was granted to the user owner and the file was executed sucessfully. The output is shown below:

           Counting ... 1
           Counting ... 2
           Counting ... 3
           Counting ... 4
           Counting ... 5

![image](https://github.com/user-attachments/assets/b343edb7-6f41-4b14-88fd-bd34582eadfa)
         

## The c-style form "for" loop

A file to demonstrate the c-style for loop was created and named "loop_cstyle.sh". The basic syntax is illustrated below:

          for ((i=0; 1<5; i++)); do
          
                echo "Number $i"
          done

where "i=0" is the start of the loop, which in this case, initializes to 0. The "1<5" is the condition for the loop to continue running or to terminate and "i++" is the incremental. The code is shown below:

![image](https://github.com/user-attachments/assets/ac67ab9d-3a6d-41f3-82a6-f5f311a80ffc)


The required permission was granted to the user owner and the file was executed successfully. The output is shown below:

              Number 0
              Number 1
              Number 2
              Number 3
              Number 4

![image](https://github.com/user-attachments/assets/974dbd99-71c2-4b8b-a495-347f36cbe2cc)


## Conclusion

The project introduces conditionals and loops which are very essential for decisions and iterations in scripting.









  
