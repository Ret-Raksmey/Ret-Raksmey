<?php

// Define an array of fruits
$fruits = ['Apple', 'Banana', 'Orange', 'Grapes', 'Mango'];

// Print the entire array
echo "Original Array:\n";
print_r($fruits);

// Access and print the third element
echo "\nThird Element: " . $fruits[2] . "\n";

// Add two more fruits
$fruits[] = 'Pineapple';
$fruits[] = 'Strawberry';

// Print the modified array
echo "\nModified Array:\n";
print_r($fruits);

?>