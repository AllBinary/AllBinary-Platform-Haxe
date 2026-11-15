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

import jre.io.ByteArrayOutputStream;
import jre.io.File;
import jre.io.OutputStream;
import jre.io.StringBufferInputStream;
//import javax.xml.transform.Templates;
//import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.URIResolver;
//import javax.xml.transform.stream.StreamResult;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.w3c.dom.Document;

//import org.allbinary.data.tree.dom.document.DomDocumentHelper;
class XslHelper {
    private static final instance : XslHelper = new XslHelper();
    public static function getInstance() : XslHelper {
        return XslHelper.instance;
    }

    public function new() {
    }

    public function translate(...args : Dynamic) : Dynamic {
        if (args.length == 3 && Std.isOfType(args[0], StreamSource) && Std.isOfType(args[0], StreamSource) && Std.isOfType(args[0], StreamResult)) {
            return this.translate_StreamSource_StreamSource_StreamResult(args[0], args[1], args[2]);
        }
        if (args.length == 4) {
            return this.translate_URIResolver_StreamSource_StreamSource_StreamResult(args[0], args[1], args[2], args[3]);
        }
        if (args.length == 2 && Std.isOfType(args[0], StreamSource) && Std.isOfType(args[0], Document)) {
            return this.translate_StreamSource_Document(args[0], args[1]);
        }
        if (args.length == 2) {
            return this.translate_StreamSource_StreamSource(args[0], args[1]);
        }
        if (args.length == 3) {
            return this.translate_URIResolver_StreamSource_StreamSource(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: translate");
    }

    // throws Exception
    public function translate_StreamSource_StreamSource_StreamResult(xsltStreamSource : StreamSource, xmlStreamSource : StreamSource, streamResult : StreamResult) : OutputStream {
        try {
            final transformerFactory : TransformerFactory = TransformerFactory.newInstance();
            final transformer : Transformer = transformerFactory.newTransformer(xsltStreamSource);
            transformer.transform(xmlStreamSource, streamResult);
            return streamResult.getOutputStream();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translate_URIResolver_StreamSource_StreamSource_StreamResult(resolver : URIResolver, xsltStreamSource : StreamSource, xmlStreamSource : StreamSource, streamResult : StreamResult) : OutputStream {
        try {
            final tFactory : TransformerFactory = TransformerFactory.newInstance();
            tFactory.setURIResolver(resolver);
            final transformer : Transformer = tFactory.newTransformer(xsltStreamSource);
            transformer.transform(xmlStreamSource, streamResult);
            return streamResult.getOutputStream();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translateTemplate(templates : Templates, xmlStreamSource : StreamSource) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            final streamResult : StreamResult = new StreamResult(outputStream);
            templates.newTransformer().transform(xmlStreamSource, streamResult);
            return Std.string(streamResult.getOutputStream());
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translate_StreamSource_Document(xsltStreamSource : StreamSource, xmlDocument : Document) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return Std.string(this.translate(xsltStreamSource, new StreamSource(new StringBufferInputStream(XmlDocumentHelper.toString(xmlDocument))), new StreamResult(outputStream)));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translate_StreamSource_StreamSource(xsltStreamSource : StreamSource, xmlStreamSource : StreamSource) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return Std.string(this.translate(xsltStreamSource, xmlStreamSource, new StreamResult(outputStream)));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translate_URIResolver_StreamSource_StreamSource(resolver : URIResolver, xsltStreamSource : StreamSource, xmlStreamSource : StreamSource) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return Std.string(this.translate(resolver, xsltStreamSource, xmlStreamSource, new StreamResult(outputStream)));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function export(outputFile : File, xsltFilePath : String, xmlDocument : Document) : Void {
        try {
            outputFile.createNewFile();
            this.translate(new StreamSource(xsltFilePath), new StreamSource(new StringBufferInputStream(XmlDocumentHelper.toString(xmlDocument))), new StreamResult(outputFile));
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

