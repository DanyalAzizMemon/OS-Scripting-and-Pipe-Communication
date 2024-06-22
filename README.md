
# OS-Scripting-and-Pipe-Communication

This repository contains a comprehensive set of Bash scripts and C programs developed for an Operating Systems course assignment. The tasks include pattern generation, file permissions manipulation, string searching, directory management, and inter-process communication using ordinary pipes.

## Repository Contents

- `Assignment-1.pdf`: The assignment document detailing the tasks and requirements.
- `consumerProducer.c`: C program that reads data from a pipe, processes it, and writes the output to a file and another pipe.
- `producerConsumer.c`: C program that reads a text file, writes the data to a pipe, and then reads the processed output from another pipe to display it.
- `task1.sh`: Bash script for pattern generation based on input parameters.
- `task2.sh`: Bash script that performs various file manipulation tasks based on user input.

## Bash Scripts

### `task1.sh`
- Takes two parametric variables: `pattern_option` and `number`.
- Generates a pattern based on the `pattern_option` (`left`, `right`, `full`) and the provided number.
- Outputs error messages for invalid input parameters.

### `task2.sh`
- Displays a main menu with options `{1, 2, 3, 4, exit}`.
- Performs different tasks based on user input:
  - **Option 1**: Input a filename, display and invert file permissions.
  - **Option 2**: Input a filename and a string, search the string in the file with support for wildcard dot (.) characters.
  - **Option 3**: Create a `dummy.txt` file combining contents from files in the current directory, based on user-specified line count.
  - **Option 4**: Input a filename, check its modified date, and update it if it exceeds 24 hours from the current time. Also, logs this information.

## C Programs

### `producerConsumer.c`
- Opens a text file `editSource.txt`.
- Writes all sentences from the file to a pipe to be read by `consumerProducer`.

### `consumerProducer.c`
- Reads from the pipe, counts the number of characters, words, and lines.
- Creates a file `theCount.txt` and writes the counted data.
- Sends the content of `theCount.txt` back to `producerConsumer` via a second pipe.
- `producerConsumer` displays the received content.

## How to Run

1. Ensure you have a Linux environment set up.
2. Compile the C programs using `gcc`:
   ```bash
   gcc -o producerConsumer producerConsumer.c
   gcc -o consumerProducer consumerProducer.c
   ```
3. Run the Bash scripts with appropriate parameters:
   ```bash
   ./task1.sh [pattern_option] [number]
   ./task2.sh
   ```
4. Run the C programs (ensure `editSource.txt` is in the same directory):
   ```bash
   ./producerConsumer
   ./consumerProducer
   ```

## Note

- The source code for both Bash scripts and C programs should be run in a Unix-based environment.
- Ensure all necessary permissions are set for executing the scripts and programs.

---
