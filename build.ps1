# Set variables
$MainClass = "main"  # Change this to match your main Java class name
$JarName = "main.jar"
$ManifestFile = "MANIFEST.MF"

# Step 1: Compile the Java file
Write-Host "Compiling $MainClass.java..."
javac "$MainClass.java"

# Check if compilation was successful
if ($LASTEXITCODE -ne 0) {
    Write-Host "Compilation failed!"
    exit 1
}

# Step 2: Create the Manifest file
Write-Host "Creating manifest file..."
Set-Content -Path $ManifestFile -Value "Main-Class: $MainClass`n"

# Step 3: Create the JAR file
Write-Host "Packaging into JAR..."
jar cfm "$JarName" "$ManifestFile" "$MainClass.class"

# Step 4: Clean up (optional)
# Remove-Item $ManifestFile -ErrorAction SilentlyContinue

# Step 5: Run the JAR file
Write-Host "Running the JAR file..."
java -jar "$JarName"
