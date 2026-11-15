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
package org.allbinary.logic.io.file.filter;

//import java.io.FileFilter;
import org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicFileFilterUtil {
    public function new() {
    }

    public static function getInstance(extension : String) : FileFilter {
        final vector : BasicArrayList = new BasicArrayListD();
        vector.add(extension);
        final includeFileExtensionsBooleanFileVisitor : IncludeFileExtensionsBooleanFileVisitor = new IncludeFileExtensionsBooleanFileVisitor(vector);
        return (cast new VisitorFileFilter(includeFileExtensionsBooleanFileVisitor) : FileFilter);
    }

}

