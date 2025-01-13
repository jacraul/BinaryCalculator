# Binary to Decimal Converter in EMU8086

## Description

This project is an assembly language program written for the EMU8086 microprocessor emulator. It converts a binary number entered by the user into its decimal equivalent and displays the result.

## Features

- Accepts binary input from the user.
- Validates the input to ensure only `0` and `1` are entered.
- Converts the binary number to its decimal equivalent.
- Displays the result in a user-friendly format.

## Files

- `CAProject.asm`: The source code for the binary to decimal conversion program.

## How It Works

1. **Input**:
   - The program prompts the user to enter a binary number.
   - The user inputs a series of `0` and `1` characters.
   - Input ends when the user presses Enter.

2. **Conversion**:
   - The binary number is processed bit by bit to calculate its decimal equivalent.

3. **Output**:
   - The program prints the decimal equivalent of the entered binary number.

## Instructions to Run

1. Open EMU8086 and load the `CAProject.asm` file.
2. Assemble the code.
3. Run the program using the emulator.
4. Enter a binary number when prompted.
5. View the decimal output displayed on the screen.

## Code Highlights

### Input Handling
```assembly
MOV AH, 1      
INT 21h
CMP AL, 13        
JE CONVERT
```

### Conversion Logic
```assembly
MOV AX, BX   
MOV BX, 0      
MOV SI, 1   

CONVERT_LOOP: 
TEST AX, 1   
JZ SKIP_ADD
ADD BX, SI
```

### Output
```assembly
PRINT_LOOP: 
XOR DX, DX     
DIV CX         
ADD DL, '0'    
PUSH DX       
```

## Requirements

- EMU8086 emulator.

## Example

### Input:
```
Enter your binary number:
1011
```

### Output:
```
DECIMAL NUMBER:
11
```

## License

This project is open-source and free to use for educational purposes.
