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
package org.allbinary.logic.communication.http.request;

//import java.util.HashMap;
//import java.util.Map;
//import java.util.Set;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

//Note: if request is destroyed or messed up this will not work. Use fileRequestParams
class RequestParams {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var map : Map;
    public function new() {
        this.logUtil.putF("New RequestParams Size: 0", this, this.commonStrings.CONSTRUCTOR);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : HttpServletRequest) {
        this.map = request.getParameterMap();
        this.logUtil.putF("RequestParams Size: " + this.getMap().keySet().size(), this, this.commonStrings.CONSTRUCTOR);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(pageContext : PageContext) {
        this.map = pageContext.getRequest().getParameterMap();
        this.logUtil.putF("Request Params Size: " + this.getMap().keySet().size(), this, this.commonStrings.CONSTRUCTOR);
    }

    public function setMap(map : Map) : Void {
        this.map = map;
    }

    public function getMap() : Map {
        return this.map;
    }

    private final KEY : String = "Key: ";
    private final VALUE : String = " Value: ";
    public function toXmlNode(document : Document) : Node {
        try {
            final node : Node = document.createElement(RequestData.REQUEST);
            final stringBuffer : StringMaker = new StringMaker();
            final keys : Set = this.map.keySet();
            final keyArray : haxe.ds.Vector<Any> = keys.toArray();
            final size : Int = keyArray.length;
            for (i in 0...size) {
                var key : String = (cast keyArray[i] : String);
                var values : haxe.ds.Vector<String> = (cast this.map.get(key) : haxe.ds.Vector<String>);
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(this.KEY);
                stringBuffer.append(key);
                stringBuffer.append(this.VALUE);
                stringBuffer.append(values[0]);
                this.logUtil.putF(Std.string(stringBuffer), this, "toXmlNode(document)");
                node.appendChild(ModDomHelper.createNameValueNodes(document, RequestData.PARAMETER, key, values[0]));
            }
            return node;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlNode(document)", e);
            return null;
        }
    }

    // throws Exception
    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        var keys : Set = this.map.keySet();
        var keyArray : haxe.ds.Vector<Any> = keys.toArray();
        var size : Int = keyArray.length;
        var stringBuffer : StringMaker = new StringMaker();
        for (i in 0...size) {
            var key : String = (cast keyArray[i] : String);
            var values : haxe.ds.Vector<String> = (cast this.map.get(key) : haxe.ds.Vector<String>);
            hashMap.put(key, values[0]);
        }
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append("RequestParams: ");
        stringBuffer.append(Std.string(this.map));
        stringBuffer.append("\ntoHashMap: ");
        stringBuffer.append(Std.string(hashMap));
        this.logUtil.putF(Std.string(stringBuffer), this, "toHashMap()");
        return hashMap;
    }

}

