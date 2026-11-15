/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.logic.io;

import jre.io.BufferedWriter;
import jre.io.FileWriter;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class BufferedWriterUtil {
    private static final instance : BufferedWriterUtil = new BufferedWriterUtil();
    public static function getInstance() : BufferedWriterUtil {
        return BufferedWriterUtil.instance;
    }

    private final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commonLabels : CommonLabels = CommonLabels.getInstance();
    private final REMOVING_OLD : String = "Remove old for overwriting: ";
    public function overwrite(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], String) && Std.isOfType(args[0], String)) {
            this.overwrite_String_String(args[0], args[1]);
            return null;
        }
        if (args.length == 2) {
            this.overwrite_AbFile_String(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: overwrite");
    }

    // throws Exception
    public function overwrite_String_String(path : String, data : String) : Void {
        final abFile : AbFile = AbFile.createAbFile(path);
        if (abFile.exists()) {
            this.logUtil.putF(this.REMOVING_OLD + path, this, this.commonStrings.CREATE);
            abFile.delete();
        } else {
            final name : String = AbPathData.getInstance().removeNameFromPath(path);
            final abFileDirectory : AbFile = AbFile.createAbFile(name);
            if (abFileDirectory.exists()) {
            } else {
                final stringBuilder : StringMaker = new StringMaker();
                this.logUtil.putF(Std.string(stringBuilder.append(this.commonStrings.CREATE).append(this.commonLabels.COLON_SEP).append(name)), this, this.commonStrings.CREATE);
                var result : Bool = abFileDirectory.mkdirs();
                stringBuilder.delete(0, stringBuilder.length());
                this.logUtil.putF(Std.string(stringBuilder.append(this.commonLabels.RESULT_).appendboolean(result)), this, this.commonStrings.CREATE);
            }
        }
        this.write(abFile, data);
    }

    // throws Exception
    public function overwrite_AbFile_String(abFile : AbFile, data : String) : Void {
        if (abFile.exists()) {
            this.logUtil.putF(this.REMOVING_OLD + abFile.getPath(), this, this.commonStrings.CREATE);
            abFile.delete();
        } else {
            final name : String = AbPathData.getInstance().removeNameFromPath(abFile.getAbsolutePath());
            final abFileDirectory : AbFile = AbFile.createAbFile(name);
            if (abFileDirectory.exists()) {
            } else {
                final stringBuilder : StringMaker = new StringMaker();
                this.logUtil.putF(Std.string(stringBuilder.append(this.commonStrings.CREATE).append(this.commonLabels.COLON_SEP).append(name)), this, this.commonStrings.CREATE);
                var result : Bool = abFileDirectory.mkdirs();
                stringBuilder.delete(0, stringBuilder.length());
                this.logUtil.putF(Std.string(stringBuilder.append(this.commonLabels.RESULT_).appendboolean(result)), this, this.commonStrings.CREATE);
            }
        }
        this.write(abFile, data);
    }

    // throws Exception
    public function write(abFile : AbFile, data : String) : Void {
        final fileOut : BufferedWriter = new BufferedWriter(new FileWriter(AbFileNativeUtil.get(abFile)));
        fileOut.write(data, 0, data.length);
        fileOut.newLine();
        fileOut.flush();
    }

    public function new() {
    }
}

