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
package views.generic.advertisement.area;

import org.allbinary.business.advertisement.area.AdvertisementAreaData;
import org.allbinary.business.advertisement.area.AdvertisementAreaInterface;
import org.allbinary.data.tables.advertisement.areas.AdvertisementAreasEntityFactory;
import org.allbinary.data.tables.advertisement.areas.AdvertisementAreasEntityInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class AdvertisementAreaView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var advertisementAreaName : String;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.advertisementAreaName = (cast this.getPropertiesHashMap().get(AdvertisementAreaData.getInstance().NAME) : String);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            var advertisementAreasEntityInterface : AdvertisementAreasEntityInterface = AdvertisementAreasEntityFactory.getInstance();
            var advertisementAreaInterface : AdvertisementAreaInterface = advertisementAreasEntityInterface.get(this.getTransformInfoInterface().getStoreName(), this.advertisementAreaName);
            return null;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            throw e;
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

