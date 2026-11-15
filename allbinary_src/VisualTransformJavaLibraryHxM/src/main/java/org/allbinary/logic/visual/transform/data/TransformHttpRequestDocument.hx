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
package org.allbinary.logic.visual.transform.data;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.http.AcceptableResponseGenerator;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class TransformHttpRequestDocument implements TransformDocumentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var baseNode : Node = null;
    private var document : Document = null;
    private static final language : String = "en";
    private static final local : String = "US";
    public function new(pageContext : PageContext, weblisketSession : WeblisketSession) {
        try {
            var contentType : String = AcceptableResponseGenerator.getInstance().get((cast pageContext.getRequest() : HttpServletRequest));
            this.document = DomDocumentHelper.create();
            var contentTypeNode : Node = this.document.createElement(contentType);
            var languageTypeNode : Node = this.document.createElement(language);
            var localTypeNode : Node = this.document.createElement(local);
            this.baseNode = localTypeNode;
            languageTypeNode.appendChild(localTypeNode);
            contentTypeNode.appendChild(languageTypeNode);
            this.document.appendChild(contentTypeNode);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.putF(this.log(), this, this.commonStrings.CONSTRUCTOR);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(searchRequest : SearchRequest) {
        try {
            var contentType : String = searchRequest.getContentType();
            this.document = DomDocumentHelper.create();
            var contentTypeNode : Node = this.document.createElement(contentType);
            var languageTypeNode : Node = this.document.createElement(language);
            var localTypeNode : Node = this.document.createElement(local);
            this.baseNode = localTypeNode;
            languageTypeNode.appendChild(localTypeNode);
            contentTypeNode.appendChild(languageTypeNode);
            this.document.appendChild(contentTypeNode);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    public function getBaseNode() : Node {
        return this.baseNode;
    }

    public function getDoc() : Document {
        return this.document;
    }

    // throws Exception
    public function log() : String {
        var stringBuffer : StringMaker = new StringMaker();
        if (this.baseNode != null) {
            stringBuffer.append("BaseNode: ");
            stringBuffer.append(this.baseNode.getNodeName());
        } else {
            stringBuffer.append("Log-Error: BaseNode is Null");
        }
        stringBuffer.append("\nDocument: ");
        stringBuffer.append(XmlDocumentHelper.toString(this.document));
        return stringBuffer.toString();
    }

}

