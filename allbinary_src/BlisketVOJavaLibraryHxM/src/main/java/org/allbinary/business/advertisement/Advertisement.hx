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

class Advertisement implements AdvertisementInterface {
    private var artist : String = null;
    private var artistLink : String = null;
    private var title : String = null;
    private var dateAdded : String = null;
    private var directory : String = null;
    private var framedLink : String = null;
    private var rank : Int = 0;
    private var listPrice : Money = null;
    private var ourPrice : Money = null;
    private var image : AdvertisementImageInterface = null;
    private var product : AdvertisementProductInterface = null;
    private var thumbnail : AdvertisementThumbnailInterface = null;
    private final displayInBrowserContraintsInterface : DisplayInBrowserContraintsInterface;
    public function new() {
        this.displayInBrowserContraintsInterface = null;
    }

    public function getArtist() : String {
        return this.artist;
    }

    public function setArtist(artist : String) : Void {
        this.artist = artist;
    }

    public function getArtistLink() : String {
        return this.artistLink;
    }

    public function setArtistLink(artistLink : String) : Void {
        this.artistLink = artistLink;
    }

    public function getTitle() : String {
        return this.title;
    }

    public function setTitle(title : String) : Void {
        this.title = title;
    }

    public function getDateAdded() : String {
        return this.dateAdded;
    }

    public function setDateAdded(dateAdded : String) : Void {
        this.dateAdded = dateAdded;
    }

    public function getDirectory() : String {
        return this.directory;
    }

    public function setDirectory(directory : String) : Void {
        this.directory = directory;
    }

    public function getFramedLink() : String {
        return this.framedLink;
    }

    public function setFramedLink(framedLink : String) : Void {
        this.framedLink = framedLink;
    }

    public function getListPrice() : Money {
        return this.listPrice;
    }

    public function setListPrice(listPrice : Money) : Void {
        this.listPrice = listPrice;
    }

    public function getOurPrice() : Money {
        return this.ourPrice;
    }

    public function setOurPrice(ourPrice : Money) : Void {
        this.ourPrice = ourPrice;
    }

    public function getRank() : Int {
        return this.rank;
    }

    public function setRank(rank : Int) : Void {
        this.rank = rank;
    }

    public function getImage() : AdvertisementImageInterface {
        return this.image;
    }

    public function setImage(image : AdvertisementImageInterface) : Void {
        this.image = image;
    }

    public function getProduct() : AdvertisementProductInterface {
        return this.product;
    }

    public function setProduct(product : AdvertisementProductInterface) : Void {
        this.product = product;
    }

    public function getThumbnail() : AdvertisementThumbnailInterface {
        return this.thumbnail;
    }

    public function setThumbnail(thumbnail : AdvertisementThumbnailInterface) : Void {
        this.thumbnail = thumbnail;
    }

    public function getDisplayInBrowserContraintsInterface() : DisplayInBrowserContraintsInterface {
        return this.displayInBrowserContraintsInterface;
    }

}

