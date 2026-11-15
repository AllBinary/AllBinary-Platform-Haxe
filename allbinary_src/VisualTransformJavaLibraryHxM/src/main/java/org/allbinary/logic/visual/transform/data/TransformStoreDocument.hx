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
package org.allbinary.logic.visual.transform.data;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontViewFactory;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchRequest;

class TransformStoreDocument extends TransformHttpRequestDocument {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(pageContext : PageContext, weblisketSession : WeblisketSession) {
        super(pageContext, weblisketSession);
        try {
            var storeName : String = weblisketSession.getStoreName();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Using Session StoreName: " + storeName, this, this.commonStrings.CONSTRUCTOR);
            }
            this.getBaseNode().appendChild(StoreFrontViewFactory.getInstance(storeName).toXmlNode(this.getDoc()));
            this.getBaseNode().appendChild(new RequestParams((cast pageContext.getRequest() : HttpServletRequest)).toXmlNode(this.getDoc()));
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(searchRequest : SearchRequest) {
        super(searchRequest);
        try {
            this.getBaseNode().appendChild(StoreFrontViewFactory.getInstance(searchRequest.getStoreFront().getName()).toXmlNode(this.getDoc()));
            this.getBaseNode().appendChild(searchRequest.getParams().getParamsNode(this.getDoc()));
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

}

