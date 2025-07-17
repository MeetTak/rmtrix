package com.github.meettak.commands;

import picocli.CommandLine;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFilePermission;
import java.util.Set;

@CommandLine.Command(name = "Search", description = "Search for the files.",
    mixinStandardHelpOptions = true)
public class searchOperation implements Runnable {

    @CommandLine.Option(names = {"-s", "--searchFiles"}, description = "Search files.")
    public String searchFiles;

    @Override
    public void run() {
        try {
            // Extract script from resources to a temporary file
            InputStream scriptStream = getClass().getResourceAsStream("/scripts/search.sh");
            if (scriptStream == null) {
                System.err.println("Error: search.sh script not found in resources");
                return;
            }
            
            // Create temporary file
            Path tempScript = Files.createTempFile("search", ".sh");
            Files.copy(scriptStream, tempScript, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            
            // Make it executable
            Set<PosixFilePermission> perms = Files.getPosixFilePermissions(tempScript);
            perms.add(PosixFilePermission.OWNER_EXECUTE);
            Files.setPosixFilePermissions(tempScript, perms);
            
            // Execute the script
            String[] cmd = new String[] {tempScript.toString(), searchFiles};
            ProcessBuilder pb = new ProcessBuilder(cmd);
            Process p = pb.start();
            
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String s = null;
            while((s = reader.readLine()) != null) {
                System.out.println(s);
            }
            System.out.println();
            
            // Clean up temporary file
            Files.deleteIfExists(tempScript);
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
