# clean out anything unwanted
bash clean.sh

# builds the needed java source for compilation
java -jar libs/antlr-4.6-complete.jar code/LoremIpsum.g4 -no-listener

# now compile all of the classes
javac -cp .:libs/antlr-4.6-complete.jar code/*.java

# put everything into file structure needed for a jar, and jar it up
mkdir -p src/demo/noast/META-INF
mv code/*.class src/demo/noast
touch src/demo/noast/META-INF/MANIFEST.MF
printf "Manifest-Version: 1.0\nClass-Path: .\nMain-Class: src.demo.noast.Driver" >> src/demo/noast/META-INF/MANIFEST.MF
jar cmf src/demo/noast/META-INF/MANIFEST.MF run.jar src/demo/noast/*.class

# remove any staging
bash clean.sh
