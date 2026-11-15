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

//import java.io.StringBufferInputStream;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.io.AbFileLocalInputStream;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;
import org.w3c.dom.Document;

class SimpleTransform {
    private final xsltFilePath : AbPath;
    private final dataFilePath : AbPath;
    public function new(xsltFilePath : AbPath, dataFilePath : AbPath) {
        this.xsltFilePath = xsltFilePath;
        this.dataFilePath = dataFilePath;
    }

    // throws Exception
    public function transform() : String {
        final inputStream : AbFileLocalInputStream = new AbFileLocalInputStream(AbFile.createAbFileFromAbPath(this.xsltFilePath));
        final document : Document = DomDocumentHelper.create(new AbFileLocalInputStream(AbFile.createAbFileFromAbPath(this.dataFilePath)));
        final result : String = XslHelper.getInstance().translate(new StreamSource(inputStream), new StreamSource(new StringBufferInputStream(XmlDocumentHelper.toString(document))));
        return result;
    }

}

