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
package views.generic.inventory;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.user.commerce.inventory.InventoryData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemView;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
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

class InventoryView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Starting", this, "toXmlNode");
            }
            var inventoryEntityInterface : InventoryEntity = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
            var inventoryNode : Node = document.createElement(InventoryData.INVENTORY);
            var itemVector : BasicArrayList = inventoryEntityInterface.getItems(StoreFrontFactory.getInstance(this.getTransformInfoInterface().getStoreName()));
            inventoryNode.appendChild(ModDomHelper.createNameValueNodes(document, SearchData.TOTAL_NUMBER_ITEMS_ON_THIS_PAGE, itemVector.size().toString()));
            final size : Int = itemVector.size();
            for (index in 0...size) {
                var itemInterface : ItemInterface = (cast itemVector.get(index) : ItemInterface);
                if (itemInterface != null) {
                    var node : Node = new BasicItemView(itemInterface, new BasicArrayListD()).toXmlNode(document);
                    inventoryNode.appendChild(node);
                } else {
                    this.logUtil.putF("Inventory", this, "toXmlNode");
                }
            }
            return inventoryNode;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            throw e;
        }
    }

    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this : DomNodeInterface));
    }

    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view Inventory";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            return error;
        }
    }

}

