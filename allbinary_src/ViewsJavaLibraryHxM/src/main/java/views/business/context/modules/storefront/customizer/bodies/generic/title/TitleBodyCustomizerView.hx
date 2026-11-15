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
package views.business.context.modules.storefront.customizer.bodies.generic.title;

import org.allbinary.business.page.PageData;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.StoreTransformer;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.customizer.bodies.title.TitleBodyValidation;
import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil;
import org.apache.commons.lang3.StringEscapeUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class TitleBodyCustomizerView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var titleBody : TitleBodyValidation = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this.titleBody : DomNodeInterface));
        this.addDomNodeInterface((cast this : DomNodeInterface));
    }

    private static final NAME : String = "None";
    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var pageName : String = TransformTemplateCustomizerUtil.getInstance().getPageNameHack(this.getTransformInfoInterface().getName(), this.getWeblisketSession().getStoreName());
        if (StringValidationUtil.getInstance().isEmpty(pageName)) {
            pageName = TitleBodyCustomizerView.NAME;
        }
        return ModDomHelper.createNameValueNodes(document, PageData.getInstance().NAME, pageName);
    }

    // throws Exception
    public function view() : String {
        try {
            var success : String = XmlDocumentHelper.toString(this.getDoc());
            var result : String = new StoreTransformer(this.abeClientInformation, this.getTransformInfoInterface()).translate(success);
            return StringEscapeUtils.unescapeHtml3(result);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

