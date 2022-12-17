# Empora Address Validation Command Line Interface

Welcome to the Empora Address Validation Command Line Interface. This program allows users to utilize the Smarty API to validate addresses from a given file. The validation will either return the formatted postal fields for the provided input, or simply return `Invalid Address`, if the provided input is invalid. The program will print both the input and the output to the console, in the following format:

`Street Input, City Input, Zip Code Input -> Street Output, City Output, Zip Code Output`

For example:

```
143 e Maine Street, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5207
1 Empora St, Title, 11111 -> Invalid Address
```

## How To Run The Program

To run the Empora Address Validation Command Line Interface first make sure you are in the root Empora Address Validation CLI directory. Once in this directory navigate to the .env file and replace the prompts (i.e. 'Please Enter Your Auth ID Here') by entering your Smarty Auth ID and Smarty Auth Token. These are environment variables to be used in the program, but protected from public consumption. After entering the corresponding credentials from your Smarty API account, you are now ready to run the program. Run the following command in the terminal to start the program:

`ruby program.rb file.csv`

with 'program.rb' being the top-level object main, and the 'file.csv' being an argument, and instruction as to which file to validate.

The program should validate the entries in the given file, and print the output to the console.

Additionally, you can run the program through the bin folder using the default addresses.csv file as an argument. To do so, run the following command from the root Empora Address Validation CLI directory:

`bin/run file.csv`

## How To Run The Tests

To test the Empora Address Validation Command Line Interface make sure you are in the root Empora Address Validation CLI directory, and run the following command in the terminal:

`rspec spec`

or

`bin/rspec`

These commands run the unit tests to ensure that each individual object is operating correctly, and as expected. The tests should display in the terminal.

## Thought Process

When designing the Empora Address Validation Command Line Interface, many descisions were made in regards to the overall configuration, design, and testability of the program.

### Separation Of Concerns And Reusability

Without making the program overly robust, I aimed to achieve a separation of concerns and SOLID Principles by implementing multiple classes, responsible for handling their own unique, designated tasks, to be used elsewhere in the program. For instance, the SmartyClient class contains an instance method that is soley responsible for building the client, to be used throughout the rest of the program. The FileFormatter class is responsible for reading the provided file and formatting the data to be validated. Lastly the SmartyValidation class handles the validation of the formatted list from the FileFormatter, using the client built from the SmartyClient class. This compartmentalization makes testing more efficient, and allows for better reusability, especially as the application scales.

### Security

Security was also a major consideration throughout the build of this program. By utilizing environment variables in the .env file, the program offers more protection to vulnerable user data, in this case the users Smarty API Auth ID, and Auth Token. The .gitignore file can also be leveraged to hide any necessary files from access by the public.

### Testing

Unit tests were created for each individual module to ensure that each module of functionality was in fact performing correctly, and as expected. This ensures quality and performance while mitigating any adverse effects, such as bugs in the program.

### Additional Considerations

While the primary functionality of this program has been described above, there were some additional design descions implemented.
