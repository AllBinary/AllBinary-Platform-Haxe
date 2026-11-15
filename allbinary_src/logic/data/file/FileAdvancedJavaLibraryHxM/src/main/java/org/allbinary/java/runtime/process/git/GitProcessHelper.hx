/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.java.runtime.process.git;

import jre.io.File;
import jre.io.IOException;
//import java.nio.charset.StandardCharsets;
import jre.util.ArrayList;
import jre.util.List;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;
import org.allbinary.logic.io.file.directory.TrackedStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

//Do not use this instead just skip target, build, Application paths.
class GitProcessHelper {
    private static final instance : GitProcessHelper = new GitProcessHelper();
    public static function getInstance() : GitProcessHelper {
        return GitProcessHelper.instance;
    }

    private final trackedStrings : TrackedStrings = TrackedStrings.getInstance();
    public function new() {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final THIS_IS_SLOW : String = "This is slow consider path exclusion instead";
        logUtil.putF(THIS_IS_SLOW, this, commonStrings.CONSTRUCTOR);
    }

    public function trackedFiles(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return this.trackedFiles_String_String(args[0], args[1]);
        }
        if (args.length == 3) {
            return this.trackedFiles_String_String_String(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: trackedFiles");
    }

    // throws IOException, InterruptedException
    public function trackedFiles_String_String(rootAsString : String, pathspec : String) : List<String> {
        return this.trackedFiles(rootAsString, pathspec, ".java");
    }

    // throws IOException, InterruptedException
    public function trackedFiles_String_String_String(rootAsString : String, pathspec : String, suffix : String) : List<String> {
        final process : Process = new ProcessBuilder(this.trackedStrings.GIT_COMMAND, this.trackedStrings.CHANGE_DIRECTORY_OPTION, rootAsString, this.trackedStrings.LIST_FILES_COMMAND, this.trackedStrings.SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE, this.trackedStrings.PATHSPEC_SEPARATOR, pathspec).redirectError(ProcessBuilder.Redirect.INHERIT).start();
        final output : haxe.ds.Vector<Int> = process.getInputStream().readAllBytes();
        final exitCode : Int = process.waitFor();
        if (exitCode != 0) {
            throw new IllegalStateException(Std.string(new StringMaker().append("git ls-files failed for ").append(rootAsString).append(" with exit code ").appendint(exitCode)));
        }
        final files : List<String> = new ArrayList<Dynamic>();
        var start : Int = 0;
        var relativePath : String = null;
        for (index in 0...output.length) {
            if (output[index] == 0) {
                relativePath = haxe.io.Bytes.ofData(output, start, index - start, StandardCharsets.UTF_8).toString();
                if (StringTools.endsWith(relativePath, suffix)) {
                    files.add(relativePath);
                }
                start = index + 1;
            }
        }
        return files;
    }

    public function isTracked(file : AbFile) : Bool {
        try {
            final nativeFile : File = AbFileNativeUtil.get(file);
            final parentFile : File = nativeFile.getParentFile();
            final process : Process = new ProcessBuilder(this.trackedStrings.GIT_COMMAND, this.trackedStrings.CHANGE_DIRECTORY_OPTION, parentFile.getPath(), this.trackedStrings.LIST_FILES_COMMAND, this.trackedStrings.ERROR_UNMATCH_OPTION, this.trackedStrings.PATHSPEC_SEPARATOR, nativeFile.getName()).redirectErrorStream(true).start();
            process.getInputStream().readAllBytes();
            return process.waitFor() == 0;
        } catch (e : haxe.Exception) {
            return false;
        }
    }

}

