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
package views.admin.customizers;

//import java.util.Arrays;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.sort.StringComparator;
import org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.customizer.TransformTemplateCustomizerData;
import org.allbinary.logic.visual.transform.template.customizer.TransformTemplateCustomizersData;
import org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData;
import org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class CustomizersView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final customizersVector : BasicArrayList;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.customizersVector = TransformInfoEntityBuilder.getInstance().getNames(this.getWeblisketSession().getStoreName());
    }

    public function toXmlNode(document : Document) : Node {
        try {
            final node : Node = document.createElement(TransformTemplateCustomizersData.NAME);
            final unsortedCustomizerViewVector : BasicArrayList = new BasicArrayListD();
            final size : Int = this.customizersVector.size();
            for (index in 0...size) {
                final viewName : String = (cast this.customizersVector.get(index) : String);
                if (viewName.indexOf(CustomizerTransformInfoData.NAME) > 0 && viewName.indexOf(GLOBALS2.EDIT) > 0 && viewName.indexOf(BodyData.getInstance().VIEWNAMEKEY) > 0 && viewName.indexOf(TitleData.getInstance().VIEWNAMEKEY) > 0) {
                    unsortedCustomizerViewVector.add(viewName);
                }
            }
            final objectArray : haxe.ds.Vector<Any> = (cast unsortedCustomizerViewVector.toArray() : haxe.ds.Vector<Any>);
            Arrays.sort(objectArray, new StringComparator());
            for (index in 0...objectArray.length) {
                final viewName : String = (cast objectArray[index] : String);
                final viewNameNode : Node = ModDomHelper.createNameValueNodes(document, TransformTemplateCustomizerData.NAME, viewName, TransformTemplateCustomizerUtil.getInstance().getPageNameHack(viewName, this.getWeblisketSession().getStoreName()));
                node.appendChild(viewNameNode);
            }
            return node;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            return null;
        }
    }

    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this : DomNodeInterface));
    }

    // throws Exception
    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

