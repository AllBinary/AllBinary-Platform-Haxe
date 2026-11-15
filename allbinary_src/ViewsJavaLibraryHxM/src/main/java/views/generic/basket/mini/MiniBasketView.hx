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
package views.generic.basket.mini;

import org.allbinary.business.user.commerce.inventory.basket.BasketData;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class MiniBasketView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            var basketInterface : BasketInterface = this.getWeblisketSession().getOrder().getBasket();
            var basketNode : Node = document.createElement(BasketData.BASKET);
            var totalNumberNode : Node = document.createElement(SearchData.TOTAL_NUMBER_ITEMS);
            var totalNumberTextNode : Node = document.createTextNode(basketInterface.getNumberOfItems().toString());
            totalNumberNode.appendChild(totalNumberTextNode);
            var totalWeightNode : Node = document.createElement(BasketData.TOTALWEIGHT);
            var totalWeightTextNode : Node = document.createTextNode(basketInterface.getTotalWeight().toString());
            totalWeightNode.appendChild(totalWeightTextNode);
            var subTotalNode : Node = document.createElement(BasketData.SUBTOTAL);
            var subTotalTextNode : Node = document.createTextNode(basketInterface.getSubTotal().toString());
            subTotalNode.appendChild(subTotalTextNode);
            basketNode.appendChild(totalNumberNode);
            basketNode.appendChild(totalWeightNode);
            basketNode.appendChild(subTotalNode);
            return basketNode;
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

