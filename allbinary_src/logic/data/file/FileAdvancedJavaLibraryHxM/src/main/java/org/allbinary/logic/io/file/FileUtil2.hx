/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class FileUtil2 {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : FileUtil2 = new FileUtil2();
    public static function getInstance() : FileUtil2 {
        return FileUtil2.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final streamUtil : StreamUtil = StreamUtil.getInstance();
    public function new() {
    }

    public function loadFileAsList(file : AbFile, max : Int, byteArray1 : haxe.ds.Vector<Int>) : BasicArrayList {
        var inputStream : AbFileInputStream = null;
        try {
            inputStream = AbFileInputStream.createFromAbFile(file);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
        }
        return SimpleFileUtil.getInstance().loadFileAsList(inputStream, max, byteArray1);
    }

}

