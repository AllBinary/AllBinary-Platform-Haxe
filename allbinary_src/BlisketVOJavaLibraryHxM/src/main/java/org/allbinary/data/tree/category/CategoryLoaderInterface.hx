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
package org.allbinary.data.tree.category;

import org.allbinary.business.category.CategoryInterface;
import org.w3c.dom.Document;

interface CategoryLoaderInterface extends CategoryModifierTreeInterface {
    function getDoc(categoryInterface : CategoryInterface) : Document;

    function get(categoryInterface : CategoryInterface) : CategoryInterface;

    function getAll(categoryInterface : CategoryInterface) : CategoryInterface;

}

