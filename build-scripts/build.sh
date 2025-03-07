#!/bin/bash

# Set variables
MAIN_CLASS="main"   # Change this to match your main Java class name
JAR_NAME="main.jar"
MANIFEST_FILE="MANIFEST.MF"

# Step 1: Compile the Java file
echo "Compiling $MAIN_CLASS.java..."
javac ../"$MAIN_CLASS.java"

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    exit 1
fi

# Step 2: Create the Manifest file
echo "Creating manifest file..."
echo -e "Main-Class: $MAIN_CLASS\n" > ../$MANIFEST_FILE

# Step 3: Create the JAR file
echo "Packaging into JAR..."
jar cfm ../"$JAR_NAME" ../"$MANIFEST_FILE" ../"$MAIN_CLASS.class"

# Step 4: Clean up (optional)
# rm "$MANIFEST_FILE"

# Step 5: Run the JAR file
echo "Running the JAR file..."
java -jar ../"$JAR_NAME"
