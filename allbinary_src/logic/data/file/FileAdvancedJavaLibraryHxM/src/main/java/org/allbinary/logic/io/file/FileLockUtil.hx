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
package org.allbinary.logic.io.file;

//import java.nio.channels.FileChannel;
//import java.nio.channels.FileLock;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbFileOutputStream;
import org.allbinary.logic.io.StreamUtil;

class FileLockUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : FileLockUtil = new FileLockUtil();
    public static function getInstance() : FileLockUtil {
        return FileLockUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getAll(vector : BasicArrayList, isReturnOnFailure : Bool) : BasicArrayList {
        var fileLockVector : BasicArrayList = new BasicArrayListD();
        final size : Int = vector.size();
        for (index in 0...size) {
            var file : AbFile = (cast vector.get(index) : AbFile);
            var fileLock : FileLock = this.getLock(file);
            if (fileLock != null) {
                this.logUtil.putF("File Lock Obtained: " + file.getAbsolutePath(), this, "getAll");
                fileLockVector.add(fileLock);
            } else if (isReturnOnFailure) {
                this.logUtil.putF("Total Locks Obtained: " + fileLockVector.size(), this, "getAll");
                return fileLockVector;
            }
        }
        this.logUtil.putF("Total Locks Obtained: " + fileLockVector.size(), this, "getAll");
        return fileLockVector;
    }

    // throws Exception
    public function getAllPossible(vector : BasicArrayList) : BasicArrayList {
        return this.getAll(vector, false);
    }

    // throws Exception
    public function getAllOrNone(vector : BasicArrayList) : BasicArrayList {
        var fileLockVector : BasicArrayList = this.getAll(vector, true);
        if (vector.size() != fileLockVector.size()) {
            return new BasicArrayListD();
        } else {
            return fileLockVector;
        }
    }

    // throws Exception
    public function getLock(file : AbFile) : FileLock {
        try {
            return this.getLock(AbFileOutputStream.createFromAbFileAppend(file, true));
        } catch (e : haxe.Exception) {
            this.logUtil.put("Exception returns null", this, "getLock", e);
            return null;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
        }
    }

    // throws Exception
    public function getLock(fileOutputStream : AbFileOutputStream) : FileLock {
        try {
            var fileLock : FileLock = this.getLock(fileOutputStream.getChannel());
            return fileLock;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Exception returns null", this, "getLock", e);
            return null;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.logUtil.putF("Finally - Closing FileOutputStream", this, "getLock");
            StreamUtil.getInstance().close(fileOutputStream);
        }
    }

    // throws Exception
    public function getLock(fileChannel : FileChannel) : FileLock {
        try {
            var fileLock : FileLock = fileChannel.tryLock();
            return fileLock;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Exception returns null", this, "getLock", e);
            return null;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.logUtil.putF("Finally - Closing FileChannel", this, "getLock");
            fileChannel.close();
        }
    }

}

