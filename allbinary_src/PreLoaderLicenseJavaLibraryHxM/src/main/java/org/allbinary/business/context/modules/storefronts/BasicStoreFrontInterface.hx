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
package org.allbinary.business.context.modules.storefronts;

import org.allbinary.util.BasicArrayList;

interface BasicStoreFrontInterface {
    function getTestHtmlPath() : String;

    function getCurrentHostName() : String;

    function getCurrentHostNamePath() : String;

    function getCurrentHomeHostName() : String;

    function getCurrentHomeHostNamePath() : String;

    function getName() : String;

    function getUserName() : String;

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

}

