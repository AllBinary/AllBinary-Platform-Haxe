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
package org.allbinary.business.category;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface;
import org.allbinary.business.category.properties.CategoryPropertiesInterface;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.io.path.AbPath;

interface CategoryInterface extends TableMappingInterface extends ValidationInterface {
    function getChildNodes() : BasicArrayList;

    function addChildProperty(categoryPropertiesInterface : CategoryPropertiesInterface) : Bool;

    function addChild(categoryInterface : CategoryInterface) : Bool;

    function removeChild(categoryInterface : CategoryInterface) : Bool;

    // throws Exception
    function isLeaf() : Bool;

    function getProperties() : CategoryPropertiesInterface;

    function setProperties(categoryPropertiesInterface : CategoryPropertiesInterface) : Void;

    function getHierarchy() : CategoryHierarchyInterface;

    function setHierarchy(categoryHierarchyInterface : CategoryHierarchyInterface) : Void;

    // throws Exception
    function getPath() : AbPath;

    // throws Exception
    function getFilePath() : AbPath;

    // throws Exception
    function getWebAppPath() : AbPath;

    // throws Exception
    function getRootFilePath() : AbPath;

    // throws Exception
    function log() : Void;

}

