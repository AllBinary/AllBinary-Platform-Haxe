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
package org.allbinary.logic.visual.dhtml.style;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.http.request.NameSpaceRequestParamData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.dhtml.style.css.CssElementData;
import org.allbinary.logic.visual.dhtml.style.css.CssElementsValidationFactory;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class StylesValidationFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : StylesValidationFactory = new StylesValidationFactory();
    public static function getInstance() : StylesValidationFactory {
        return StylesValidationFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(document : Document) : BasicArrayList {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        var nodeList : NodeList = document.getElementsByTagName(StylesData.getInstance().NAME);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Style Present: " + XmlDocumentHelper.toString(document), this, commonStrings.GET_INSTANCE);
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Styles Present: " + nodeList.getLength(), this, commonStrings.GET_INSTANCE);
        }
        for (index in 0...nodeList.getLength()) {
            var stylesNode : Node = nodeList.item(index);
            var styleNodeList : BasicArrayList = DomSearchHelper.getAllNodes(StyleData.getInstance().NAME, stylesNode.getChildNodes());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Number Of Style Nodes Present: " + styleNodeList.size(), this, commonStrings.GET_INSTANCE);
            }
            for (styleNodesIndex in 0...styleNodeList.size()) {
                var styleNode : Node = (cast styleNodeList.get(styleNodesIndex) : Node);
                var cssElementStyleNodeList : BasicArrayList = DomSearchHelper.getAllNodes(CssElementData.getInstance().NAME, styleNode.getChildNodes());
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("Number Of Element Nodes Present: " + cssElementStyleNodeList.size(), this, commonStrings.GET_INSTANCE);
                }
                return CssElementsValidationFactory.getInstance(cssElementStyleNodeList);
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("No Style Present", this, commonStrings.GET_INSTANCE);
        }
        return new BasicArrayListD();
    }

    // throws Exception
    public static function getInstance(hashMap : HashMap) : BasicArrayList {
        var stylesDocument : Document = (cast hashMap.get(NameSpaceRequestParamData.DOCUMENT) : Document);
        return StylesValidationFactory.getInstance().getInstance(stylesDocument);
    }

}

