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
package org.allbinary.business.category.properties;

import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.io.path.AbPath;

interface CategoryPropertiesInterface extends TableMappingInterface extends ValidationInterface {
    function setValue(value : String) : Void;

    function getValue() : String;

    // throws Exception
    function getWebAppPath() : AbPath;

    // throws Exception
    function getPath(categoryHierarchyInterface : CategoryHierarchyInterface) : AbPath;

    // throws Exception
    function getFileName() : String;

    // throws Exception
    function isRoot() : Bool;

    // throws Exception
    function isRealRoot() : Bool;

}

