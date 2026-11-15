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
package org.allbinary.business.user.modules.admin.configuration;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.configuration.ContextConfiguration;
import org.allbinary.business.context.configuration.ContextConfigurationData;
import org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping;
import org.allbinary.business.context.configuration.ContextConfigurationInterface;
import org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory;
import org.allbinary.business.context.configuration.ContextConfigurationPathUtil;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileWriter;
import org.allbinary.string.CommonStrings;

class AdminConfiguration implements AdminConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var contextConfigurationInterface : ContextConfigurationInterface;
    public function new() {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.contextConfigurationInterface = ContextConfigurationInterfaceFactory.getInstance().getInstance(AdminConfigurationData.CONTEXTNAME);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : HttpServletRequest) {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.getFormData(new RequestParams(request).toHashMap());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(storeHashMap : HashMap) {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.getFormData(storeHashMap);
    }

    // throws Exception
    private function getFormData(storeHashMap : HashMap) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "getFormData");
        this.setContextConfigurationInterface((cast new ContextConfiguration(storeHashMap) : ContextConfigurationInterface));
    }

    // throws Exception
    // synchronized
    public function write() : Void {
        var contextConfigurationDomDocumentMapping : ContextConfigurationDomDocumentMapping = new ContextConfigurationDomDocumentMapping(this.getContextConfigurationInterface());
        var cryptFileWriter : CryptFileWriter = new CryptFileWriter(ContextConfigurationData.getInstance().UNCRYPTED_EXTENSION, ContextConfigurationData.getInstance().ENCRYPTED_EXTENSION);
        cryptFileWriter.write(ContextConfigurationPathUtil.getAbPath(AdminConfigurationData.CONTEXTNAME), contextConfigurationDomDocumentMapping.toXmlDoc());
    }

    public function getContextConfigurationInterface() : ContextConfigurationInterface {
        return this.contextConfigurationInterface;
    }

    public function setContextConfigurationInterface(contextConfigurationInterface : ContextConfigurationInterface) : Void {
        this.contextConfigurationInterface = contextConfigurationInterface;
    }

}

