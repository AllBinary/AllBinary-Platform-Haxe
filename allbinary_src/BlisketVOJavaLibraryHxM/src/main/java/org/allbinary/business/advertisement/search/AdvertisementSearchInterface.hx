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
package org.allbinary.business.advertisement.search;

//import java.util.HashMap;
import org.allbinary.business.advertisement.search.category.AdvertisementCategoryInterface;
import org.allbinary.business.advertisement.search.website.AdvertisementWebsiteInterface;
import org.allbinary.logic.control.contraints.price.PriceConstraintInterface;
import org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface;

interface AdvertisementSearchInterface {
    function getWebSite() : AdvertisementWebsiteInterface;

    function getCategory() : AdvertisementCategoryInterface;

    function getSizeConstraints() : TwoDimensionalConstraintInterface;

    function getPricingConstraints() : PriceConstraintInterface;

    function getPageNumber() : Int;

    function getProductsPerPage() : Int;

    function getSearchParams() : HashMap;

    function setCategory(advertisementCategoryInterface : AdvertisementCategoryInterface) : Void;

    function setSizeConstraints(twoDimensionConstraintsInterface : TwoDimensionalConstraintInterface) : Void;

    function setPricingConstraints(priceConstraintInterface : PriceConstraintInterface) : Void;

    function setPageNumber(pageNumber : Int) : Void;

    function setProductsPerPage(productsPerPage : Int) : Void;

    function setSearchParams(columnAndKeywordHashMap : HashMap) : Void;

}

