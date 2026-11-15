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
package taghelpers;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.jsp.PageContext;
import admin.taghelpers.TagHelper;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.logic.communication.http.AcceptableResponseGenerator;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchParams;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import views.admin.inventory.listings.InventoryViewFactory;
import views.admin.inventory.listings.InventoryViewSearchInterface;

class InventoryHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private var weblisketSession : WeblisketSession = null;
    private var response : HttpServletResponse;
    private var request : HttpServletRequest;
    private var streetAddress : StreetAddress = null;
    private var id : String = null;
    private var searchRequest : SearchRequest = null;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.response = (cast pageContext.getResponse() : HttpServletResponse);
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        var storeName : String = (cast propertiesHashMap.get(StoreFrontData.getInstance().NAME) : String);
        var xslFile : String = (cast propertiesHashMap.get(TransformInfoData.getInstance().TEMPLATEFILENAME) : String);
        if (storeName != null) {
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(storeName);
            var contentType : String = AcceptableResponseGenerator.getInstance().get(this.request);
            var searchParams : SearchParams = new SearchParams(this.request);
            this.searchRequest = new SearchRequest(storeFrontInterface, searchParams, xslFile, contentType, propertiesHashMap, pageContext);
        }
        this.getFormData();
    }

    private function getFormData() : Void {
        this.id = this.request.getParameter(basicItemData.ID);
    }

    public function viewSummary() : String {
        try {
            var inventoryViewSearchInterface : InventoryViewSearchInterface = InventoryViewFactory.getInstance(this.searchRequest);
            var result : String = inventoryViewSearchInterface.getProduct(this.id);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successfull Inventory View Summary", this, "viewSummary()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to View Summary";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "viewSummary()", e);
            }
            return error + "<br>" + "Exception: " + e + "<br>";
        }
    }

    public function search() : String {
        try {
            final stringUtil : StringUtil = StringUtil.getInstance();
            var keywords : String = (cast this.searchRequest.getParams().get().get(basicItemData.KEYWORDS) : String);
            if (keywords == null || Reflect.compare(keywords, stringUtil.EMPTY_STRING) == 0) {
                return "Please enter a keyword in the search field above the Search button.";
            }
            var inventoryViewSearchInterface : InventoryViewSearchInterface = InventoryViewFactory.getInstance(this.searchRequest);
            var result : String = inventoryViewSearchInterface.searchSingleDynamicPage();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successful Inventory Dynamic Search", this, "searchSingleDynamicPage()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to search Inventory by keyword";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "searchSingleDynamicPage()", e);
            }
            return error + "<br>" + "Exception: " + e + "<br>";
        }
    }

}

