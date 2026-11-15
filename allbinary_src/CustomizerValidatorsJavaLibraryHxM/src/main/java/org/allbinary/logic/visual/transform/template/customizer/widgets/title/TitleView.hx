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
package org.allbinary.logic.visual.transform.template.customizer.widgets.title;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class TitleView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var title : String;
    private static final NAME : String = "None";
    public function new() {
        this.title = TitleView.NAME;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        var titleTextNode : Node = DomSearchHelper.getNode(TitleData.getInstance().TEXT, node.getChildNodes());
        var valueNode : Node = DomSearchHelper.getNode(DomData.VALUE, titleTextNode.getChildNodes());
        this.title = DomNodeHelper.getTextNodeValue(valueNode);
        if (StringValidationUtil.getInstance().isEmpty(this.title)) {
            this.title = TitleView.NAME;
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Title: " + this.getTitle(), this, "Consructor()");
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("HashMap: " + Std.string(hashMap), this, this.commonStrings.CONSTRUCTOR);
        }
        this.getFormData(hashMap);
    }

    public function getTitle() : String {
        return this.title;
    }

    public function getFormData(hashMap : HashMap) : Void {
        this.title = (cast hashMap.get(TitleData.getInstance().TEXT) : String);
        if (StringValidationUtil.getInstance().isEmpty(this.title)) {
            this.title = TitleView.NAME;
        }
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(TitleData.getInstance().TEXT, this.getTitle());
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("TitleView HashMap: " + Std.string(hashMap), this, "toXmlNode()");
        }
        return ModDomHelper.createNameValueNodes(document, TitleData.getInstance().NAME, hashMap);
    }

}

