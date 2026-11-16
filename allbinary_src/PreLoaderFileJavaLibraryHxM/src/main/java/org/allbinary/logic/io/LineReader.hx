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

import jre.io.DataInputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class LineReader {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var fileName : String = null;
    private var string : String = null;
    private var index : Int = 0;
    private var idFile : AbFileInputStream = null;
    private var idData : DataInputStream = null;
    public function new(fileName : String) {
        try {
            var bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...100000) 0]);
            this.fileName = fileName;
            this.idFile = new AbFileInputStream(fileName);
            this.idFile.read(bytes);
            this.string = haxe.io.Bytes.ofData(bytes).toString();
        } catch (e : haxe.Exception) {
            this.logUtil.put("File: " + fileName, this, "LineReader", e);
            {
            }
        }
    }

    public function hasNext() : Bool {
        try {
            final nextIndex : Int = this.string.indexOf(jre.lang.JavaString.text(CommonSeps.getInstance().NEW_LINE), index);
            if (nextIndex == -1) {
                return false;
            }
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, "hasNext", e);
            {
            }
            return false;
        }
    }

    // throws Exception
    public function next() : String {
        try {
            final nextIndex : Int = this.string.indexOf(jre.lang.JavaString.text(CommonSeps.getInstance().NEW_LINE), index);
            if (nextIndex == -1) {
                throw new jre.lang.JavaException("next() should have been called first");
            }
            final temp : String = this.string.substring(index, nextIndex);
            index = nextIndex + 1;
            return temp;
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, "next", e);
            {
            }
            throw e;
        }
    }

}

