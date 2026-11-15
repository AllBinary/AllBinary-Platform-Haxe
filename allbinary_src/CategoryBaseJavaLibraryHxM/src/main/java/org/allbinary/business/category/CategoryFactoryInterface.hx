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

//import java.util.HashMap;
import org.allbinary.logic.io.path.AbPath;
import org.w3c.dom.Node;

interface CategoryFactoryInterface {
    function getRootInstance() : CategoryInterface;

    function getRootInstance(categoryPath : AbPath) : CategoryInterface;

    function getRootInstanceFromNode(node : Node) : CategoryInterface;

    function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, name : String) : CategoryInterface;

    function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, node : Node) : CategoryInterface;

    function getInstance(rootCategoryInterface : CategoryInterface, parentCategoryInterface : CategoryInterface, categoryPropertiesHashMap : HashMap) : CategoryInterface;

}

