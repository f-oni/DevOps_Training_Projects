# A Script to Generate a Multiplication Table
The project aims to create a script that will generate a multiplication table based on user input. The script should prompt the user to enter a number and ask if they would like to see a full multiplication table from 1 to 10 or a partial multiplication table.

## Script Flow

The script flow is described below:

1. Prompt the user to enter a number for the multiplication table
2. Ask if they want a full multiplication table or partial. If partial, prompt for the start and end values of the range.
3. validate the range input and handle invalid range entries
4. Generate and display the multiplication table according to the specified range.
5. Enhance user interaction by repeating the program without restarting the script.


## Script Implementation

The script below was written to accomplish the tasks described in the project

```
#!/bin/bash

  multiplicand=(1 2 3 4 5 6 7 8 9 10)
  
  
 # User's interaction and exit loop starts
 
  while true;
  do

  # user inputs

  read -p "Enter a number for the multiplication table: " mul

  echo "Do you want a full table of partial? (Enter 'f' for full, 'p' for partial): "

  read user_input
 
 
 # function to generate the full multiplication of a number based on user input and already range
 
 # List Form for loop

  full_table() { echo "The full multiplication table for $mul: "
	 
	  for m in ${multiplicand[@]}

          do
                  res=$(($mul*$m))
                  echo "$mul x $m = $res"
          done
 }
 
 # C-style for loop function
 
  full_table2() { echo "The full multiplication table for $mul: "
	 
	  for ((j=1; j<=10; j++))

          do
                  res2=$(($mul*$j))
				  
                  echo "$mul x $j = $res2"
          done
 }
 
 # A function to generate the partial multiplication table of numbers based on user inputs of range of numbers 

  partial_table() { echo "The partial multiplication table for $mul from $min to $max: "
	 
	  for (( n=$min; n<=$max; n++ ))

          do
                  val=$(($mul*$n))

                  echo "$mul x $n = $val"
          done
 }

 # Testing user's selection between either full and partial table 

  if [[ "$user_input" == "f" ]]; then

	  full_table		  

  elif [[ "$user_input" == "p" ]]; then

	  echo "Enter the starting number(between 1 and 10):"
	  read min

	  echo "Enter the ending number (between 1 and 10):"
	  read max

	  if [ $max -lt $min ]; then

		  echo "Invalid range. Showing full table instead"

		  full_table
	  else
		  partial_table

	  fi	  

  else

	  echo "Invalid entry"
  fi
  # User's interaction and exit loop contd...

  echo "Do you want to get the multiplication table for another number?('y' for yes and 'n' for no)"
  read continuation
  if [ $continuation == "n" ]; then
  break
  fi
done

```


## Script Execution

1. **Full Multiplication Table**
   
   i. A prompt asks the user to enter a number for multiplication table.<br>
   ii. The user entered the number `6` <br>
   iii. Another prompt asks: `Do you want a full table of partial? (Enter 'f' for full, 'p' for partial):`<br>
   iv. The user chose `f` for full multiplication table.<br>
The output displayed the full multiplication table of 6 from 1 to 10 as shown below:

![image](https://github.com/user-attachments/assets/97f653d6-380a-468e-8b28-60c822111bdb)

2. **Partial Multiplication Table Display**

   i. A prompt asks the user to enter a number for multiplication table.<br>
   ii. The user entered the number `7` <br>
   iii. Another prompt asks: `Do you want a full table of partial? (Enter 'f' for full, 'p' for partial):`<br>
   iv. The user chose `p` for the partial multiplication table <br>
   v. further prompts asks the user to "Enter the starting number(between 1 and 10):" The user entered `3`.<br>
   vi. Again the user was asked to "Enter the ending number(between 1 and 10):" The user entered `7`<br>
The output displayed the partial multiplication table of 7 from 3 to 7 as shown below:

![image](https://github.com/user-attachments/assets/d1813f18-19af-4726-81cb-339b4afdbe2a)

3. **Invalid Input Range**
   i. A prompt asks the user to enter a number for multiplication table.<br>
   ii. The user entered the number `3` <br>
   iii. Another prompt asks: `Do you want a full table of partial? (Enter 'f' for full, 'p' for partial):`<br>
   iv. The user chose `p` for the partial multiplication table.<br>
   v. further prompts asks the user to "Enter the starting number(between 1 and 10):" The user entered `7`.<br>
   vi. Again the user was asked to "Enter the ending number(between 1 and 10):" The user entered `2`<br>
Because the range entered by the user was reversed, the following output was displayed: "Invalid range. Showing full table instead. The full multiplication table of 3"
see the screenshot below

![image](https://github.com/user-attachments/assets/cc4b60fd-ef98-4dfb-8a35-ad9bbee6cc3e)

4. **User Interaction and Program Exit**

   i. A prompt asks the user to enter a number for multiplication table.<br>
   ii. The user entered the number `9` <br>
   iii. Another prompt asks: `Do you want a full table of partial? (Enter 'f' for full, 'p' for partial):`<br>
   iv. The user chose `f` for full multiplication table.<br>
   v. The full multiplication table of `9` was displayed and followed with the prompt:
    "Do you want to get the multiplication table for another number?('y' for yes and 'n' for no)" <br>
    vi. The user entered `y` and the program started from the begining again by asking the user to enter another number for multiplication table<br>
    vii After the execution of the second round, the user entered `n` for  to terminate the program. And the program got terminated. The screenshot is shown below:

   ![image](https://github.com/user-attachments/assets/1e4f050b-0a3f-4140-aa65-db3604f636ee)

   ## Conclusion
   The project tested how to implement functions, list form for loop, c-style for loop, while loop, if-elif-else statements (conditionals), variables, arrays, user inputs and interation, input validation and error handling.   


   






