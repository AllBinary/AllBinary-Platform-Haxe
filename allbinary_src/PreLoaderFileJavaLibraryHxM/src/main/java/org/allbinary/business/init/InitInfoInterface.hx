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
package org.allbinary.business.init;

import org.allbinary.logic.io.path.AbPath;

interface InitInfoInterface {
    function isTesting() : Bool;

    function getTesting() : String;

    function getTestHtmlPath() : String;

    function getMainPath() : String;

    function setTesting(value : String) : Void;

    function setTestHtmlPath(value : AbPath) : Void;

    function setMainPath(value : AbPath) : Void;

    // throws Exception
    function isTestingValid(testing : String) : Bool;

    function isTestHtmlPathValid(value : AbPath) : Bool;

    function isMainPathValid(value : AbPath) : Bool;

}

