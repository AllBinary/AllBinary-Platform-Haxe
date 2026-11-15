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

import org.allbinary.business.advertisement.image.AdvertisementImageInterface;
import org.allbinary.business.advertisement.product.AdvertisementProductInterface;
import org.allbinary.business.advertisement.thumbnail.AdvertisementThumbnailInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface;

interface AdvertisementInterface {
    function getArtist() : String;

    function getArtistLink() : String;

    function getTitle() : String;

    function getDateAdded() : String;

    function getDirectory() : String;

    function getFramedLink() : String;

    function getListPrice() : Money;

    function getOurPrice() : Money;

    function getRank() : Int;

    function getImage() : AdvertisementImageInterface;

    function getProduct() : AdvertisementProductInterface;

    function getThumbnail() : AdvertisementThumbnailInterface;

    function getDisplayInBrowserContraintsInterface() : DisplayInBrowserContraintsInterface;

    function setArtist(artist : String) : Void;

    function setArtistLink(artistLink : String) : Void;

    function setTitle(title : String) : Void;

    function setDateAdded(dateAdded : String) : Void;

    function setDirectory(directory : String) : Void;

    function setFramedLink(framedLink : String) : Void;

    function setRank(rank : Int) : Void;

    function setImage(AdvertisementImageInterface : AdvertisementImageInterface) : Void;

    function setProduct(AdvertisementProductInterface : AdvertisementProductInterface) : Void;

    function setThumbnail(AdvertisementThumbnailInterface : AdvertisementThumbnailInterface) : Void;

}

