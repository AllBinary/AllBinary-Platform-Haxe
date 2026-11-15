/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.logic.communication.log.config.type;

import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class LogConfigTypeFactory {
    private static final instance : LogConfigTypeFactory = new LogConfigTypeFactory();
    public static function getInstance() : LogConfigTypeFactory {
        return LogConfigTypeFactory.instance;
    }

    private final NO_DESCRIPTION : String = "No Description";
    public final AUTHENTICATION : LogConfigType = new LogConfigType("Authentication", this.NO_DESCRIPTION);
    public final AUTHENTICATIONERROR : LogConfigType = new LogConfigType("Authentication Error", this.NO_DESCRIPTION);
    public final CATEGORY : LogConfigType = new LogConfigType("Category", this.NO_DESCRIPTION);
    public final CATEGORYERROR : LogConfigType = new LogConfigType("Category Error", this.NO_DESCRIPTION);
    public final CRYPT : LogConfigType = new LogConfigType("Crypt", this.NO_DESCRIPTION);
    public final CRYPTERROR : LogConfigType = new LogConfigType("Crypt Error", this.NO_DESCRIPTION);
    public final EMAILLOGGING : LogConfigType = new LogConfigType("Email", this.NO_DESCRIPTION);
    public final EMAILLOGGINGERROR : LogConfigType = new LogConfigType("Email Error", this.NO_DESCRIPTION);
    public final ENTITYFACTORYERROR : LogConfigType = new LogConfigType("Entity Factory Error", this.NO_DESCRIPTION);
    public final NETBEANS_MODULE : LogConfigType = new LogConfigType("NetBeans Module", this.NO_DESCRIPTION);
    public final NETBEANS_MODULE_ERROR : LogConfigType = new LogConfigType("NetBeans Module Error", this.NO_DESCRIPTION);
    public final FACTORYERROR : LogConfigType = new LogConfigType("General Factory Error", this.NO_DESCRIPTION);
    public final FILE : LogConfigType = new LogConfigType("File", this.NO_DESCRIPTION);
    public final FILEERROR : LogConfigType = new LogConfigType("File Error", this.NO_DESCRIPTION);
    public final HTTP : LogConfigType = new LogConfigType("HTTP", this.NO_DESCRIPTION);
    public final HTTPERROR : LogConfigType = new LogConfigType("HTTP Error", this.NO_DESCRIPTION);
    public final HTTPREQUEST : LogConfigType = new LogConfigType("Http Request", this.NO_DESCRIPTION);
    public final HTTPREQUESTERROR : LogConfigType = new LogConfigType("Http Request Error", this.NO_DESCRIPTION);
    public final IDLOGGING : LogConfigType = new LogConfigType("ID Logging", this.NO_DESCRIPTION);
    public final JSPEXTRAOUTPUT : LogConfigType = new LogConfigType("JSP Extra Output", this.NO_DESCRIPTION);
    public final JSPTAGEXTRAOUTPUT : LogConfigType = new LogConfigType("JSP Tag Extra Output", this.NO_DESCRIPTION);
    public final JSPTAG : LogConfigType = new LogConfigType("JSP Tag", this.NO_DESCRIPTION);
    public final JSPTAGERROR : LogConfigType = new LogConfigType("JSP Tag Error", this.NO_DESCRIPTION);
    public final LICENSING : LogConfigType = new LogConfigType("Licensing", this.NO_DESCRIPTION);
    public final LICENSINGERROR : LogConfigType = new LogConfigType("Licensing Error", this.NO_DESCRIPTION);
    public final LOADER : LogConfigType = new LogConfigType("Loader", this.NO_DESCRIPTION);
    public final LOADERERROR : LogConfigType = new LogConfigType("Loader Error", this.NO_DESCRIPTION);
    public final OS : LogConfigType = new LogConfigType("OS", this.NO_DESCRIPTION);
    public final OSERROR : LogConfigType = new LogConfigType("OS Error", this.NO_DESCRIPTION);
    public final PAYMENT : LogConfigType = new LogConfigType("Payment", this.NO_DESCRIPTION);
    public final PAYMENTERROR : LogConfigType = new LogConfigType("Payment Error", this.NO_DESCRIPTION);
    public final PRELOADER : LogConfigType = new LogConfigType("PreLoader", this.NO_DESCRIPTION);
    public final PRELOADERERROR : LogConfigType = new LogConfigType("PreLoader Error", this.NO_DESCRIPTION);
    public final PRODUCTSEARCHLOGGING : LogConfigType = new LogConfigType("Product Search Logging", this.NO_DESCRIPTION);
    public final PRODUCTSEARCHLOGGINGERROR : LogConfigType = new LogConfigType("Product Search Logging Error", this.NO_DESCRIPTION);
    public final SERVLET : LogConfigType = new LogConfigType("Servlet", this.NO_DESCRIPTION);
    public final SERVLETERROR : LogConfigType = new LogConfigType("Servlet Error", this.NO_DESCRIPTION);
    public final SHIPPINGERROR : LogConfigType = new LogConfigType("Shipping Error", this.NO_DESCRIPTION);
    public final SQLLOGGINGERROR : LogConfigType = new LogConfigType("SQL Error", this.NO_DESCRIPTION);
    public final SQLLOGGING : LogConfigType = new LogConfigType("SQL Logging", this.NO_DESCRIPTION);
    public final SQLTAGS : LogConfigType = new LogConfigType("SQL Tag Logging", this.NO_DESCRIPTION);
    public final SQLTAGSERROR : LogConfigType = new LogConfigType("SQL Tag Error", this.NO_DESCRIPTION);
    public final STYLE : LogConfigType = new LogConfigType("Style", this.NO_DESCRIPTION);
    public final STYLEERROR : LogConfigType = new LogConfigType("Style Error", this.NO_DESCRIPTION);
    public final TAGHELPER : LogConfigType = new LogConfigType("Tag Helper", this.NO_DESCRIPTION);
    public final TAGHELPERERROR : LogConfigType = new LogConfigType("Tag Helper Error", this.NO_DESCRIPTION);
    public final TAGHELPERFACTORY : LogConfigType = new LogConfigType("Tag Helper Factory", this.NO_DESCRIPTION);
    public final TAGHELPERFACTORYERROR : LogConfigType = new LogConfigType("Tag Helper Factory Error", this.NO_DESCRIPTION);
    public final TAX : LogConfigType = new LogConfigType("Tax", this.NO_DESCRIPTION);
    public final TAXERROR : LogConfigType = new LogConfigType("Tax Error", this.NO_DESCRIPTION);
    public final VALIDATION : LogConfigType = new LogConfigType("Validation", this.NO_DESCRIPTION);
    public final VALIDATIONERROR : LogConfigType = new LogConfigType("Validation Error", this.NO_DESCRIPTION);
    public final VIEW : LogConfigType = new LogConfigType("View", this.NO_DESCRIPTION);
    public final VIEWERROR : LogConfigType = new LogConfigType("View Error", this.NO_DESCRIPTION);
    public final VIEWFACTORYERROR : LogConfigType = new LogConfigType("View Factory Error", this.NO_DESCRIPTION);
    public final WORKFLOW : LogConfigType = new LogConfigType("Workflow", this.NO_DESCRIPTION);
    public final WORKFLOWERROR : LogConfigType = new LogConfigType("Workflow Error", this.NO_DESCRIPTION);
    public final XMLLOGGING : LogConfigType = new LogConfigType("XML Logging", this.NO_DESCRIPTION);
    public final XMLLOGGINGERROR : LogConfigType = new LogConfigType("XML Logging Error", this.NO_DESCRIPTION);
    public final XSLLOGGING : LogConfigType = new LogConfigType("XSL Logging", this.NO_DESCRIPTION);
    public final XSLLOGGINGERROR : LogConfigType = new LogConfigType("XSL Logging Error", this.NO_DESCRIPTION);
    public final REPLACE : LogConfigType = new LogConfigType("Replace", this.NO_DESCRIPTION);
    public final REPLACE_INFO : LogConfigType = new LogConfigType("Replace Info", this.NO_DESCRIPTION);
    public final REPLACEERROR : LogConfigType = new LogConfigType("Replace Error", this.NO_DESCRIPTION);
    public final SQLLOGGINGPOOL : LogConfigType = new LogConfigType("SQL Pool", this.NO_DESCRIPTION);
    public final SQLLOGGINGPOOLERROR : LogConfigType = new LogConfigType("SQL Pool Error", this.NO_DESCRIPTION);
    public final STATICPAGEGENERATIONLOGGING : LogConfigType = new LogConfigType("Static Page Generation Logging", this.NO_DESCRIPTION);
    public final STATICPAGEGENERATIONLOGGINGERROR : LogConfigType = new LogConfigType("Static Page Generation Logging Error", this.NO_DESCRIPTION);
    public function new() {
        PreLogUtil.put("FreeBlisket", this, CommonStrings.getInstance().CONSTRUCTOR);
    }

}

