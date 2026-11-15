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
package views.admin.inventory.listings;


interface InventoryViewSearchInterface {
    // throws Exception
    function searchSingleStaticPage() : String;

    // throws Exception
    function searchSingleDynamicPage() : String;

    // throws Exception
    function search() : haxe.ds.Vector<String>;

    // throws Exception
    function getProduct(product : String) : String;

}

