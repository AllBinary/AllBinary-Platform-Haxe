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
package org.allbinary.data.tree.dom.document;

import jre.io.ByteArrayOutputStream;
import jre.io.StringReader;
import jre.io.StringWriter;
import jre.io.Writer;
//import javax.xml.parsers.DocumentBuilderFactory;
//import javax.xml.transform.OutputKeys;
//import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerConfigurationException;
//import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.dom.DOMSource;
//import javax.xml.transform.stream.StreamResult;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.java.characters.CharacterSetData;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

class XmlDocumentHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : XmlDocumentHelper = new XmlDocumentHelper();
    public static function getInstance() : XmlDocumentHelper {
        return XmlDocumentHelper.instance;
    }

    private final INDENT_NUMBER : String = "indent-number";
    private var indent : Int = 0;
    private var ignoreDeclaration : Bool = false;
    public function new() {
        this.init(4, true);
    }

    // synchronized
    public function init(indent : Int, ignoreDeclaration : Bool) : Void {
        this.indent = indent;
        this.ignoreDeclaration = ignoreDeclaration;
    }

    public function createTransformer(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return this.createTransformer_int_boolean(args[0], args[1]);
        }
        if (args.length == 0) {
            return this.createTransformer();
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createTransformer");
    }

    // throws TransformerConfigurationException
    private function createTransformer_int_boolean(indent : Int, ignoreDeclaration : Bool) : Transformer {
        final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
        final transformerFactory : TransformerFactory = TransformerFactory.newInstance();
        transformerFactory.setAttribute(this.INDENT_NUMBER, indent);
        final transformer : Transformer = transformerFactory.newTransformer();
        transformer.setOutputProperty(OutputKeys.ENCODING, CharacterSetData.getInstance().UTF_8);
        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, (ignoreDeclaration ? booleanFactory.YES : booleanFactory.NO));
        transformer.setOutputProperty(OutputKeys.INDENT, booleanFactory.YES);
        return transformer;
    }

    // throws TransformerConfigurationException
    public function createTransformer() : Transformer {
        final currentIndent : Int = 0;
        final currentIgnoreDeclaration : Bool = false;
        // synchronized (this)
        {
            currentIndent = this.indent;
            currentIgnoreDeclaration = this.ignoreDeclaration;
        }
        return this.createTransformer(currentIndent, currentIgnoreDeclaration);
    }

    // throws Exception
    public function format(xmlString : String) : String {
        return this.formatWithTransformer(xmlString, this.createTransformer());
    }

    // throws Exception
    public function formatWithTransformer(xmlString : String, transformer : Transformer) : String {
        final src : InputSource = new InputSource(new StringReader(xmlString));
        final document : Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(src);
        final out : Writer = new StringWriter();
        transformer.transform(new DOMSource(document), new StreamResult(out));
        return Std.string(out);
    }

    // throws Exception
    public static function toString(document : Document) : String {
        try {
            final domSource : DOMSource = new DOMSource(document);
            final byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            final streamResult : StreamResult = new StreamResult(byteArrayOutputStream);
            final copyTransformerFactory : TransformerFactory = TransformerFactory.newInstance();
            final copyTransformer : Transformer = copyTransformerFactory.newTransformer();
            copyTransformer.transform(domSource, streamResult);
            return Std.string(byteArrayOutputStream);
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

