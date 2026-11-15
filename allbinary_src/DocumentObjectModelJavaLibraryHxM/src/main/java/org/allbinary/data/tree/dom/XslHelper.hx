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

//import java.io.ByteArrayOutputStream;
//import java.io.File;
//import java.io.OutputStream;
//import java.io.StringBufferInputStream;
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

    // throws Exception
    public function translate(xsltStreamSource : StreamSource, xmlStreamSource : StreamSource, streamResult : StreamResult) : OutputStream {
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
    public function translate(resolver : URIResolver, xsltStreamSource : StreamSource, xmlStreamSource : StreamSource, streamResult : StreamResult) : OutputStream {
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
    public function translate(xsltStreamSource : StreamSource, xmlDocument : Document) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return this.translate(xsltStreamSource, new StreamSource(new StringBufferInputStream(XmlDocumentHelper.toString(xmlDocument))), new StreamResult(outputStream)).toString();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translate(xsltStreamSource : StreamSource, xmlStreamSource : StreamSource) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return this.translate(xsltStreamSource, xmlStreamSource, new StreamResult(outputStream)).toString();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function translate(resolver : URIResolver, xsltStreamSource : StreamSource, xmlStreamSource : StreamSource) : String {
        try {
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            return this.translate(resolver, xsltStreamSource, xmlStreamSource, new StreamResult(outputStream)).toString();
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

