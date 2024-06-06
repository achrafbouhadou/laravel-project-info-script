#!/bin/bash


# Set the output file
OUTPUT_FILE="project_info.txt"

# Function to output a separator for better readability
separator() {
    echo "============================================================" >> $OUTPUT_FILE
}

# Function to get models and their relationships
get_models() {
    echo "Models and Relationships:" >> $OUTPUT_FILE
    php artisan tinker --execute="
    foreach (get_declared_classes() as \$class) {
        if (strpos(\$class, 'App\\\\Models\\\\') === 0) {
            \$reflection = new ReflectionClass(\$class);
            echo 'Model: ' . \$class . PHP_EOL;
            foreach (\$reflection->getMethods() as \$method) {
                \$doc = \$method->getDocComment();
                if (strpos(\$doc, '@return \Illuminate\Database\Eloquent\Relations') !== false) {
                    echo ' - ' . \$method->getName() . '()' . PHP_EOL;
                }
            }
            echo PHP_EOL;
        }
    }" >> $OUTPUT_FILE
}

# Function to get database tables and their schema details
get_tables_and_schema() {
    echo "Database Tables and Schema Details:" >> $OUTPUT_FILE
    php artisan tinker --execute="
    \$tables = DB::select('SHOW TABLES');
    foreach (\$tables as \$table) {
        foreach (\$table as \$key => \$value) {
            echo 'Table: ' . \$value . PHP_EOL;
            \$columns = DB::select('SHOW COLUMNS FROM ' . \$value);
            foreach (\$columns as \$column) {
                echo ' - ' . \$column->Field . ' (' . \$column->Type . ')' . PHP_EOL;
            }
            echo PHP_EOL;
        }
    }" >> $OUTPUT_FILE
}

# Function to generate a project summary
generate_summary() {
    echo "Generating project summary..." >> $OUTPUT_FILE
    MODEL_COUNT=$(php artisan tinker --execute="echo count(get_declared_classes());")
    TABLE_COUNT=$(php artisan tinker --execute="echo count(DB::select('SHOW TABLES'));")
    echo "Project Summary:" >> $OUTPUT_FILE
    echo "This Laravel project contains $MODEL_COUNT models and $TABLE_COUNT database tables." >> $OUTPUT_FILE
    echo "It includes functionality for user management, e-commerce operations, and more." >> $OUTPUT_FILE
}

# Clear previous output
> $OUTPUT_FILE

# Output the models and their relationships
separator
get_models

# Output the database tables and their schema details
separator
get_tables_and_schema

# Generate a project summary
separator
generate_summary

echo "Output written to $OUTPUT_FILE"
