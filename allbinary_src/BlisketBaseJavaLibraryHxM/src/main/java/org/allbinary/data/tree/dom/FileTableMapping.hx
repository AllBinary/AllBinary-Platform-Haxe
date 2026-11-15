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
package org.allbinary.data.tree.dom;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileData;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.io.path.PathUtil;

class FileTableMapping implements TableMappingInterface {
    private var file : AbFile;
    public function new(file : AbFile) {
        this.file = file;
    }

    // throws Exception
    public function getKey() : Any {
        return (cast this.file.getPath() : Any);
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        final filePropertyVector : BasicArrayList = new BasicArrayListD();
        filePropertyVector.add(this.file.getAbsolutePath());
        filePropertyVector.add(this.file.getCanonicalPath());
        filePropertyVector.add(this.file.getName());
        filePropertyVector.add(this.file.getParent());
        filePropertyVector.add(this.file.getPath());
        return filePropertyVector;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        final filePropertyHashMap : HashMap = StdUtil.getInstance().createHashMap();
        final pathData : AbPathData = AbPathData.getInstance();
        final pathUtil : PathUtil = PathUtil.getInstance();
        final rootFileName : String = pathData.getNameFromPath(pathUtil.getWithoutExtension(this.file.getPath()));
        final fileData : FileData = FileData.getInstance();
        filePropertyHashMap.put(fileData.ROOT_NAME, rootFileName);
        filePropertyHashMap.put(fileData.ISFILE, Std.string(Std.string(this.file.isFile())));
        filePropertyHashMap.put(fileData.ISDIRECTORY, Std.string(Std.string(this.file.isDirectory())));
        filePropertyHashMap.put(fileData.ISHIDDEN, Std.string(Std.string(this.file.isHidden())));
        filePropertyHashMap.put(fileData.ISABSOLUTE, Std.string(Std.string(this.file.isAbsolute())));
        filePropertyHashMap.put(fileData.ABSOLUTE_PATH, file.getAbsolutePath());
        filePropertyHashMap.put(fileData.CANONICAL_PATH, file.getCanonicalPath());
        filePropertyHashMap.put(fileData.NAME, file.getName());
        filePropertyHashMap.put(fileData.PARENT, file.getParent());
        filePropertyHashMap.put(fileData.PATH, file.getPath());
        return filePropertyHashMap;
    }

}

