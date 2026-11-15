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

//import java.io.ByteArrayOutputStream;
//import java.io.StringReader;
//import java.io.StringWriter;
//import java.io.Writer;
//import javax.xml.parsers.DocumentBuilderFactory;
//import javax.xml.transform.OutputKeys;
//import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.dom.DOMSource;
//import javax.xml.transform.stream.StreamResult;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.java.characters.CharacterSetData;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

class XmlDocumentHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : XmlDocumentHelper = new XmlDocumentHelper();
    public static function getInstance() : XmlDocumentHelper {
        return XmlDocumentHelper.instance;
    }

    private final INDENT_NUMBER : String = "indent-number";
    private var transformer : Transformer = null;
    public function new() {
        this.init(4, true);
    }

    public function init(indent : Int, ignoreDeclaration : Bool) : Void {
        try {
            final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
            final transformerFactory : TransformerFactory = TransformerFactory.newInstance();
            transformerFactory.setAttribute(this.INDENT_NUMBER, indent);
            this.transformer = transformerFactory.newTransformer();
            this.transformer.setOutputProperty(OutputKeys.ENCODING, CharacterSetData.getInstance().UTF_8);
            this.transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, (ignoreDeclaration ? booleanFactory.YES : booleanFactory.NO));
            this.transformer.setOutputProperty(OutputKeys.INDENT, booleanFactory.YES);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.INIT, e);
        }
    }

    // throws Exception
    public function format(xmlString : String) : String {
        final src : InputSource = new InputSource(new StringReader(xmlString));
        final document : Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(src);
        final out : Writer = new StringWriter();
        this.transformer.transform(new DOMSource(document), new StreamResult(out));
        return out.toString();
    }

    // throws Exception
    public static function toString(document : Document) : String {
        try {
            var domSource : DOMSource = new DOMSource(document);
            var byteArrayOutputStream : ByteArrayOutputStream = new ByteArrayOutputStream();
            var streamResult : StreamResult = new StreamResult(byteArrayOutputStream);
            var copyTransformerFactory : TransformerFactory = TransformerFactory.newInstance();
            var copyTransformer : Transformer = copyTransformerFactory.newTransformer();
            copyTransformer.transform(domSource, streamResult);
            return byteArrayOutputStream.toString();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

