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
package org.allbinary.business.advertisement;


interface AdvertisementsInterface {
    function add(advertisementInterface : AdvertisementInterface) : Void;

    function get(index : Int) : AdvertisementInterface;

    function getCurrentPageNum() : Int;

    function getErrorDescription() : String;

    function getErrorNum() : String;

    function getNumberOfPosters() : Int;

    function getNumberOfProductsInPage() : Int;

    function getStatusCode() : Int;

    function getTotalNumberOfProducts() : Int;

    function isSearchValid() : Bool;

    function setCurrentPageNum(currentPageNum : Int) : Void;

    function setErrorDescription(errorDescription : String) : Void;

    function setErrorNum(errorNum : String) : Void;

    function setNumberOfProductsInPage(numberOfProductsInPage : Int) : Void;

    function setStatusCode(statusCode : Int) : Void;

    function setTotalNumberOfProducts(totalNumberOfProducts : Int) : Void;

    function toString() : String;

}

