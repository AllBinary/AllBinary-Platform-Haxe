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
package org.allbinary.business.installer;

import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.file.upload.FileUploadData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbIOSystem;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

class DeleteCloud {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    public function delete(prePath : String, current : Int, total : Int) : Bool {
        try {
            if (AbIOSystem.getInstance().isType("com.vobject.appengine.java.io")) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append(URLGLOBALS.getWebappPath());
                stringBuffer.append(prePath);
                final path : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
                final file : AbFile = AbFile.createAbFileFromAbPath(path);
                final fileBasicArrayList : BasicArrayList = Directory.getInstance().search(file, true);
                var size : Int = fileBasicArrayList.size();
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append("Searched: ");
                stringBuffer.append(path.toFileSystemString());
                stringBuffer.append(" BasicArrayList: ");
                stringBuffer.appendint(size);
                var portion : Int = Std.int(size / total) + 1;
                var start : Int = portion * current;
                var end : Int = start + portion;
                if (end > size) {
                    end = size;
                }
                stringBuffer.append(" Section: ");
                stringBuffer.appendint(start);
                stringBuffer.append(" - ");
                stringBuffer.appendint(end);
                this.logUtil.putF(Std.string(stringBuffer), this, "initialize()");
                var nextFile : AbFile = null;
                for (index in start...end) {
                    nextFile = (cast fileBasicArrayList.get(index) : AbFile);
                    try {
                        if (nextFile.getPath().indexOf(FileUploadData.getInstance().FILE) < 0) {
                            nextFile.delete();
                        }
                    } catch (e : haxe.Exception) {
                    }
                }
                this.logUtil.putF("Deleted Files From Cloud", this, "initialize()");
            }
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Unable to copy installer files into cloud", this, "initialize()", e);
            return false;
        }
    }

}

