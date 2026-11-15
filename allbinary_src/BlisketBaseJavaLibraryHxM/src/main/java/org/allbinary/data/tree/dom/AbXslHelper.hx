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
package org.allbinary.data.tree.dom;

//import java.io.ByteArrayOutputStream;
//import javax.xml.transform.stream.StreamResult;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;

class AbXslHelper {
    private static final instance : AbXslHelper = new AbXslHelper();
    public static function getInstance() : AbXslHelper {
        return AbXslHelper.instance;
    }

    // throws Exception
    public function translate(xslFile : AbFile, xmlFile : AbFile) : String {
        return this.translate(xslFile.getAbsolutePath(), xmlFile.getAbsolutePath());
    }

    // throws Exception
    public function translate(xslPath : AbPath, xmlPath : AbPath) : String {
        return this.translate(xslPath.getPath(), xmlPath.getPath());
    }

    // throws Exception
    public function translate(xsltFilePath : String, xmlFilePath : String) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return Std.string(XslHelper.getInstance().translate(new StreamSource(xsltFilePath), new StreamSource(xmlFilePath), new StreamResult(outputStream)));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    public function new() {
    }
}

