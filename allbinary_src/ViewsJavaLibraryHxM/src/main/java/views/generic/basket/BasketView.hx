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
package views.generic.basket;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.commerce.inventory.basket.BasketData;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemView;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class BasketView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final request : HttpServletRequest;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.request = (cast this.getPageContext().getRequest() : HttpServletRequest);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            var inventoryEntity : InventoryEntity = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
            var basketInterface : BasketInterface = this.getWeblisketSession().getOrder().getBasket();
            var basketNode : Node = document.createElement(BasketData.BASKET);
            var itemsAndNumberInBasket : HashMap = basketInterface.getItems();
            var numberOfResults : Int = 1;
            var items : Set = itemsAndNumberInBasket.keySet();
            final productArray : haxe.ds.Vector<Any> = items.toArray();
            final size : Int = productArray.length;
            for (index in 0...size) {
                var product : String = (cast productArray[index] : String);
                var itemInterface : ItemInterface = inventoryEntity.getItem(product);
                if (itemInterface != null) {
                    var basicItemView : BasicItemView = new BasicItemView(itemInterface, new BasicArrayListD());
                    var node : Node = basicItemView.toXmlNode(document);
                    var numberInBasket : String = basketInterface.getNumberOf(product).toString();
                    node.appendChild(ModDomHelper.createNameValueNodes(document, BasketData.ITEMTOTALINBASKET, numberInBasket));
                    var itemPrice : Money = itemInterface.getPrice();
                    var itemTotal : Money = new Money(itemPrice);
                    itemTotal.multiply(Std.int(basketInterface.getNumberOf(product)));
                    node.appendChild(ModDomHelper.createNameValueNodes(document, BasketData.ITEMTOTAL, itemTotal.toString()));
                    basketNode.appendChild(node);
                } else {
                    this.logUtil.putF("Product Failed: " + product, this, "toXmlNode");
                }
                numberOfResults++;
            }
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

