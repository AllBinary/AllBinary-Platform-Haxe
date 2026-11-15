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
package org.allbinary.data.tree.dom.document;

//import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.dom.DOMSource;
//import javax.xml.transform.stream.StreamResult;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.w3c.dom.Document;

class DomDocumentFileHelper {
    public function new() {
    }

    // throws Exception
    public static function createDocument(xmlFile : AbFile) : Document {
        try {
            return DomDocumentHelper.create(AbFileInputStream.createFromAbFile(xmlFile));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public static function save(file : AbFile, document : Document) : Void {
        var dataOutputStream : AbDataOutputStream = null;
        try {
            var copyTransformerFactory : TransformerFactory = TransformerFactory.newInstance();
            var copyTransformer : Transformer = copyTransformerFactory.newTransformer();
            var domSource : DOMSource = new DOMSource(document);
            if (file.isFile()) {
                file.delete();
            }
            file.createNewFile();
            dataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(file);
            var streamResult : StreamResult = new StreamResult(dataOutputStream);
            copyTransformer.transform(domSource, streamResult);
            dataOutputStream.flush();
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(dataOutputStream);
        }
    }

}

