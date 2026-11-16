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

import jre.io.InputStream;
import jre.io.StringBufferInputStream;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
import org.allbinary.string.CommonPhoneStrings;
import org.w3c.dom.Document;

class DomDocumentHelper {
    public function new() {
    }

    public static function init() : Void {
        final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
        System.setProperty("jdk.xml.maxElementDepth", commonPhoneStrings.ZERO);
        System.setProperty("jdk.xml.xpathExprOpLimit", commonPhoneStrings.ZERO);
        System.setProperty("jdk.xml.xpathTotalOpLimit", commonPhoneStrings.ZERO);
        final LIMIT : String = "500000";
        System.setProperty("jdk.xml.maxGeneralEntitySizeLimit", LIMIT);
        System.setProperty("jdk.xml.totalEntitySizeLimit", LIMIT);
    }

    public static function create(...args : Dynamic) : Dynamic {
        if (args.length == 0) {
            return DomDocumentHelper.create_();
        }
        if (args.length == 1 && Std.isOfType(args[0], InputStream)) {
            return DomDocumentHelper.create_InputStream(args[0]);
        }
        if (args.length == 1) {
            return DomDocumentHelper.create_String(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: create");
    }

    public static function create_() : Document {
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
    public static function create_InputStream(inputStream : InputStream) : Document {
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
    public static function create_String(xmlString : String) : Document {
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

