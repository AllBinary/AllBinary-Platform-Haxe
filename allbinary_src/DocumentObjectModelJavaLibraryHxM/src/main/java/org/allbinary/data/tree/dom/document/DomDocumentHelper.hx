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

//import java.io.InputStream;
//import java.io.StringBufferInputStream;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;

class DomDocumentHelper {
    public function new() {
    }

    public static function init() : Void {
        System.setProperty("jdk.xml.maxElementDepth", "0");
        System.setProperty("jdk.xml.xpathExprOpLimit", "0");
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0");
        final LIMIT : String = "500000";
        System.setProperty("jdk.xml.maxGeneralEntitySizeLimit", LIMIT);
        System.setProperty("jdk.xml.totalEntitySizeLimit", LIMIT);
    }

    public static function create() : Document {
        try {
            var factory : DocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            var builder : DocumentBuilder = factory.newDocumentBuilder();
            var document : Document = builder.newDocument();
            return document;
        } catch (e : haxe.Exception) {
            return null;
        }
    }

    // throws Exception
    public static function create(inputStream : InputStream) : Document {
        try {
            var factory : DocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            var builder : DocumentBuilder = factory.newDocumentBuilder();
            var document : Document = builder.parse(inputStream);
            return document;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public static function create(xmlString : String) : Document {
        try {
            var factory : DocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            var builder : DocumentBuilder = factory.newDocumentBuilder();
            var document : Document = builder.parse(new StringBufferInputStream(xmlString));
            return document;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

