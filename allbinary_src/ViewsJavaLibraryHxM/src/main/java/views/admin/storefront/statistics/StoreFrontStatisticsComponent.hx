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
package views.admin.storefront.statistics;

import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.context.modules.storefront.statistics.RealTimeStoreFrontStatistics;
import org.allbinary.business.context.modules.storefront.statistics.RealTimeStoreFrontStatisticsView;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import views.business.context.modules.storefront.HttpStoreComponentView;

class StoreFrontStatisticsComponent extends HttpStoreComponentView {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var newStoreFrontInterface : StoreFrontInterface;
    private var domNodeInterface : DomNodeInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.newStoreFrontInterface = (cast StoreFrontFactory.getInstance(transformInfoInterface.getStoreName()) : StoreFrontInterface);
        this.domNodeInterface = new RealTimeStoreFrontStatisticsView(new RealTimeStoreFrontStatistics(this.newStoreFrontInterface), this.getWeblisketSession().getRole());
    }

    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this.domNodeInterface : DomNodeInterface));
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

