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
package org.allbinary.business.context.modules.storefront;

import org.allbinary.business.context.configuration.ContextConfigurationInterface;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.util.BasicArrayList;

interface StoreFrontInterface extends TableMappingInterface {
    function isNameValid() : Null<Bool>;

    function isValid() : Null<Bool>;

    function nameValidationInfo() : String;

    function validationInfo() : String;

    function getTestHtmlPath() : String;

    function getCurrentHostName() : String;

    function getCurrentHostNamePath() : String;

    function getCurrentHomeHostName() : String;

    function getCurrentHomeHostNamePath() : String;

    function getName() : String;

    function getBasketName() : String;

    function getHomeHostName() : String;

    function getHomeHostNamePath() : String;

    function getHostName() : String;

    function getHostNamePath() : String;

    function getTestHomeHostName() : String;

    function getTestHomeHostNamePath() : String;

    function getTestHostName() : String;

    function getTestHostNamePath() : String;

    function getStaticPath() : String;

    function getCategoryPath() : String;

    // throws Exception
    function getSubStores() : BasicArrayList;

    function getTagLocation() : String;

    function getPackageLocation() : String;

    function getInventoryControl() : String;

    function getContextConfigurationInterface() : ContextConfigurationInterface;

    function setContextConfigurationInterface(contextConfigurationInterface : ContextConfigurationInterface) : Void;

    function getFtp() : String;

    function getFtpPath() : String;

    function getFtpUserName() : String;

    function getFtpPassword() : String;

    function getTestFtp() : String;

    function getTestFtpPath() : String;

    function getTestFtpUserName() : String;

    function getTestFtpPassword() : String;

    function getTimeCreated() : String;

    function getLastModified() : String;

    function setName(value : String) : Void;

    function setBasketName(value : String) : Void;

    function setHomeHostName(value : String) : Void;

    // throws Exception
    function setHomeHostNamePath(value : String) : Void;

    function setHostName(value : String) : Void;

    // throws Exception
    function setHostNamePath(value : String) : Void;

    function setTestHomeHostName(value : String) : Void;

    // throws Exception
    function setTestHomeHostNamePath(value : String) : Void;

    function setTestHostName(value : String) : Void;

    // throws Exception
    function setTestHostNamePath(value : String) : Void;

    // throws Exception
    function setImagePath(value : String) : Void;

    // throws Exception
    function setStaticPath(value : String) : Void;

    // throws Exception
    function setCategoryPath(value : String) : Void;

    function setPackageLocation(value : String) : Void;

    function setInventoryControl(value : String) : Void;

    function setFtp(value : String) : Void;

    // throws Exception
    function setFtpPath(value : String) : Void;

    function setFtpUserName(value : String) : Void;

    function setFtpPassword(value : String) : Void;

    function setTestFtp(value : String) : Void;

    // throws Exception
    function setTestFtpPath(value : String) : Void;

    function setTestFtpUserName(value : String) : Void;

    function setTestFtpPassword(value : String) : Void;

    function setTimeCreated(value : String) : Void;

    function setLastModified(value : String) : Void;

    // throws Exception
    function install(current : Int, total : Int) : Void;

}

