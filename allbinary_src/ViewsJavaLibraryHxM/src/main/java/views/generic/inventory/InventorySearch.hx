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

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.data.tables.staticpages.StaticPagesEntity;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchParams;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.logic.io.InputOutputTypeData;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import views.admin.inventory.listings.InventoryViewSearchInterface;

class InventorySearch implements InventoryViewSearchInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final searchRequest : SearchRequest;
    public function new(searchRequest : SearchRequest) {
        super();
        this.searchRequest = searchRequest;
    }

    // throws Exception
    public function searchSingleStaticPage() : String {
        try {
            var storeFront : StoreFrontInterface = this.searchRequest.getStoreFront();
            var searchParams : SearchParams = this.searchRequest.getParams();
            var columnValueHashMap : HashMap = searchParams.get();
            var file : String = new StaticPagesEntity().getFile(storeFront.getName(), new Replace("-", CommonSeps.getInstance().SPACE).all((cast columnValueHashMap.get(basicItemData.KEYWORDS) : String)));
            if (StringValidationUtil.getInstance().isEmpty(file)) {
                return null;
            } else {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append(storeFront.getCurrentHostName());
                stringBuffer.append(storeFront.getCurrentHostNamePath());
                stringBuffer.append(storeFront.getStaticPath());
                stringBuffer.append(file);
                stringBuffer.append(this.searchRequest.getParams().getEndPage());
                stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
                stringBuffer.append(InputOutputTypeData.getInstance().DEFAULT);
                var filePath : String = new Replace(CommonSeps.getInstance().SPACE, "%20").all(stringBuffer.toString());
                return filePath;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "searchSingleStaticPage", e);
            }
            throw new haxe.Exception("Failed retrieve Single Product Page Static");
        }
    }

    // throws Exception
    public function searchSingleDynamicPage() : String {
        try {
            var str : haxe.ds.Vector<String> = this.search();
            return str[Std.int(this.searchRequest.getParams().getStartPageInt())];
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "searchSingleDynamicPage", e);
            }
            throw new haxe.Exception("Failed retrieve Single Product Page Dynamically");
        }
    }

    // throws Exception
    public function search() : haxe.ds.Vector<String> {
        final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
        final inventorySearchUtil : InventorySearchUtil = InventorySearchUtil.getInstance();
        final vector : BasicArrayList = inventorySearchUtil.getBasicItemIdColumn(this.searchRequest);
        return inventorySearchUtil.search(abeClientInformation, searchRequest, vector);
    }

    // throws Exception
    public function getProduct(product : String) : String {
        final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
        return InventorySearchProductUtil.getInstance().getProduct(abeClientInformation, this.searchRequest, product);
    }

}

