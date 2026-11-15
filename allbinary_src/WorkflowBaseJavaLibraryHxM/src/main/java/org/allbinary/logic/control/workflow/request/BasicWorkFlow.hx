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
package org.allbinary.logic.control.workflow.request;

//import java.util.Calendar;
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.workflow.WorkFlowData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicWorkFlow {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var workFlowDoc : Document;
    private var workFlowName : String;
    private var storeName : String;
    public function new() {
        this.workFlowName = StringUtil.getInstance().EMPTY_STRING;
        this.workFlowDoc = DomDocumentHelper.create();
        var workFlowNode : Node = this.workFlowDoc.createElement(WorkFlowData.getInstance().WORKFLOW);
        this.workFlowDoc.appendChild(workFlowNode);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap, pageContext : PageContext) {
        var weblisketSession : WeblisketSession = new WeblisketSession(hashMap, pageContext);
        this.storeName = weblisketSession.getStoreName();
        var requestHashMap : HashMap = new RequestParams(pageContext).toHashMap();
        this.workFlowName = (cast requestHashMap.get(WorkFlowData.getInstance().NAME) : String);
        this.workFlowDoc = DomDocumentHelper.create((cast requestHashMap.get(WorkFlowData.getInstance().DATA) : String));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.workFlowName = (cast hashMap.get(WorkFlowData.getInstance().NAME) : String);
        this.storeName = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        this.workFlowDoc = DomDocumentHelper.create((cast hashMap.get(WorkFlowData.getInstance().DATA) : String));
    }

    public function getName() : String {
        return this.workFlowName;
    }

    public function getStoreName() : String {
        return this.storeName;
    }

    public function getKey() : Any {
        return (cast this.getName() : Any);
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var values : BasicArrayList = new BasicArrayListD();
        values.add(this.workFlowName);
        values.add(this.storeName);
        values.add(XmlDocumentHelper.toString(this.workFlowDoc));
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        values.add(time);
        values.add(time);
        return values;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(WorkFlowData.getInstance().NAME, this.workFlowName);
        hashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
        hashMap.put(WorkFlowData.getInstance().DATA, XmlDocumentHelper.toString(this.workFlowDoc));
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        hashMap.put(EntryData.getInstance().LASTMODIFIED, time);
        return hashMap;
    }

    public function toXmlNode(document : Document) : Node {
        try {
            var hashMap : HashMap = this.toHashMap();
            var keySet : Set = hashMap.keySet();
            var node : Node = document.createElement(WorkFlowData.getInstance().WORKFLOW);
            final nameArray : haxe.ds.Vector<Any> = keySet.toArray();
            final size : Int = nameArray.length;
            for (index in 0...size) {
                var name : String = (cast nameArray[index] : String);
                var value : String = (cast hashMap.get(name) : String);
                node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
            }
            return node;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlNode()", e);
            }
            return null;
        }
    }

    public function toXmlDoc() : Document {
        try {
            return this.workFlowDoc;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlDoc()", e);
            }
            return null;
        }
    }

    public function isValid() : Null<Bool> {
        try {
            var returnBoolean : Null<Bool> = true;
            if (this.workFlowName == null) {
                returnBoolean = false;
            }
            return returnBoolean;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.workFlowName == null) {
                stringBuffer.append("No WorkFlow name specified.");
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Getting Validation Info";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

}

