package com.github.meettak;

import io.micronaut.configuration.picocli.PicocliRunner;
import com.github.meettak.commands.searchOperation;
import com.github.meettak.commands.removeOperations;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "rmtrix", description = "...",
        mixinStandardHelpOptions = true,
        subcommands = {searchOperation.class, removeOperations.class})
public class RmtrixCommand implements Runnable {

    @Option(names = {"-v", "--verbose"}, description = "...")
    boolean verbose;

    public static void main(String[] args) throws Exception {
        PicocliRunner.run(RmtrixCommand.class, args);
    }

    public void run() {
        // business logic here
        if (verbose) {
            System.out.println("Hi!");
        }
    }
}
