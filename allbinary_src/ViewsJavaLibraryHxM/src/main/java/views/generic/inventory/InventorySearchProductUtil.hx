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

import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.inventory.item.BasicItemView;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.StoreTransformer;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;

class InventorySearchProductUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : InventorySearchProductUtil = new InventorySearchProductUtil();
    public static function getInstance() : InventorySearchProductUtil {
        return InventorySearchProductUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final ITEM_NOT_FOUND : String = "Item Not Found.";
    // throws Exception
    public function getProduct(abeClientInformation : AbeClientInformationInterface, searchRequest : SearchRequest, product : String) : String {
        try {
            var inventoryEntityInterface : InventoryEntity = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
            var itemInterface : ItemInterface = inventoryEntityInterface.getItem(product);
            if (itemInterface != null) {
                var viewDocumentInterface : TransformDocumentInterface = TransformStoreDocumentFactory.getInstance(searchRequest);
                viewDocumentInterface.getBaseNode().appendChild(new BasicItemView(itemInterface, new BasicArrayListD()).toXmlNode(viewDocumentInterface.getDoc()));
                var success : String = XmlDocumentHelper.toString(viewDocumentInterface.getDoc());
                var outputStr : String = new StoreTransformer(abeClientInformation, (cast new TransformInfoHttpSearch(searchRequest) : TransformInfoInterface)).translate(success);
                return outputStr;
            } else {
                return this.ITEM_NOT_FOUND;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "getProduct", e);
            }
            throw new haxe.Exception("Failed to getProduct");
        }
    }

    public function new() {
    }
}

