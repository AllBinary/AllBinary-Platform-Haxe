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
package admin.taghelpers;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.quoterequest.QuoteRequest;
import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;

//TWB - Am I missing the correct Quote Request? Probably not
class QuoteRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var storeFrontInterface : StoreFrontInterface = null;
    private var quoteRequest : QuoteRequest;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        var request : HttpServletRequest = (cast pageContext.getRequest() : HttpServletRequest);
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.quoteRequest = new QuoteRequest(this.weblisketSession.getUserName(), request);
        var storeName : String = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        }
    }

    public function isValid() : Null<Bool> {
        return this.quoteRequest.isValid();
    }

    public function validationInfo() : String {
        return this.quoteRequest.validationInfo();
    }

    public function insert() : String {
        try {
            var values : BasicArrayList = this.quoteRequest.toVector();
            QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance().insert(values);
            var success : String = "New QuoteRequest Successfully added to the QuoteRequest Table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "add()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add QuoteRequest";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "add()", e);
            }
            return error;
        }
    }

    public function update() : String {
        try {
            var values : HashMap = this.quoteRequest.toHashMap();
            QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance().update(this.quoteRequest.getUserName(), values);
            var success : String = "New QuoteRequest Successfully updated";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update QuoteRequest";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        return commonStrings.NOT_IMPLEMENTED;
    }

}

