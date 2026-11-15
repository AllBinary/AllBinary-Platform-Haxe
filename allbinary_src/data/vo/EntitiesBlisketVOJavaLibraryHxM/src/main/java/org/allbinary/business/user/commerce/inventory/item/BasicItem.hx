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
package org.allbinary.business.user.commerce.inventory.item;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.data.generator.ProductIdGenerator;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonStrings;

class BasicItem implements ItemInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    public var itemId : String;
    public var number : String;
    public var inBaskets : String;
    public var weight : String;
    public var enabled : String;
    public var newOrUsed : String;
    public var summary : String;
    public var distributor : String;
    public var idUsedByDistributor : String;
    public var producedBy : String;
    public var productionDate : String;
    public var startProductionDate : String;
    public var description : String;
    public var keywords : String;
    public var category : String;
    public var type : String;
    public var smallImage : String;
    public var mediumImage : String;
    public var largeImage : String;
    public var price : Money;
    public var comment : String;
    public var customs : String;
    private var downloads : String = null;
    public var groups : String;
    public var options : String;
    public var permissions : String;
    public var specials : String;
    private var downloadable : Bool = false;
    public var timeEntered : String;
    public var lastModified : String;
    public function new(itemHashMap : HashMap) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, "Constructor(HashMap)");
        }
        this.itemId = (cast itemHashMap.get(basicItemData.ID) : String);
        this.number = (cast itemHashMap.get(basicItemData.NUMBER) : String);
        this.inBaskets = (cast itemHashMap.get(basicItemData.INBASKETS) : String);
        this.weight = (cast itemHashMap.get(basicItemData.WEIGHT) : String);
        this.enabled = (cast itemHashMap.get(EntryData.getInstance().ENABLE) : String);
        this.newOrUsed = (cast itemHashMap.get(basicItemData.NEWORUSED) : String);
        this.summary = (cast itemHashMap.get(basicItemData.SUMMARY) : String);
        this.distributor = (cast itemHashMap.get(basicItemData.DISTRIBUTOR) : String);
        this.idUsedByDistributor = (cast itemHashMap.get(basicItemData.IDUSEDBYDISTRIBUTOR) : String);
        this.producedBy = (cast itemHashMap.get(basicItemData.PRODUCEDBY) : String);
        this.productionDate = (cast itemHashMap.get(basicItemData.PRODUCTIONDATE) : String);
        this.startProductionDate = (cast itemHashMap.get(basicItemData.STARTPRODUCTIONDATE) : String);
        this.description = (cast itemHashMap.get(basicItemData.DESCRIPTION) : String);
        this.keywords = (cast itemHashMap.get(basicItemData.KEYWORDS) : String);
        this.category = (cast itemHashMap.get(basicItemData.CATEGORY) : String);
        this.type = (cast itemHashMap.get(basicItemData.TYPE) : String);
        this.smallImage = (cast itemHashMap.get(basicItemData.SMALLIMAGE) : String);
        this.mediumImage = (cast itemHashMap.get(basicItemData.MEDIUMIMAGE) : String);
        this.largeImage = (cast itemHashMap.get(basicItemData.LARGEIMAGE) : String);
        this.timeEntered = (cast itemHashMap.get(EntryData.getInstance().TIMECREATED) : String);
        this.lastModified = (cast itemHashMap.get(EntryData.getInstance().LASTMODIFIED) : String);
        this.price = new Money((cast itemHashMap.get(basicItemData.PRICE) : String));
        this.comment = (cast itemHashMap.get(basicItemData.COMMENT) : String);
        this.customs = (cast itemHashMap.get(basicItemData.CUSTOMS) : String);
        this.setDownloads((cast itemHashMap.get(basicItemData.DOWNLOADS) : String));
        this.groups = (cast itemHashMap.get(basicItemData.GROUPS) : String);
        this.options = (cast itemHashMap.get(basicItemData.OPTIONS) : String);
        this.permissions = (cast itemHashMap.get(basicItemData.PERMISSIONS) : String);
        this.specials = (cast itemHashMap.get(basicItemData.SPECIALS) : String);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
        var EMPTY : String = StringUtil.getInstance().EMPTY_STRING;
        this.itemId = new ProductIdGenerator().getNext();
        this.number = CommonPhoneStrings.getInstance().ZERO;
        this.inBaskets = EMPTY;
        this.weight = EMPTY;
        this.enabled = EMPTY;
        this.newOrUsed = EMPTY;
        this.summary = EMPTY;
        this.distributor = EMPTY;
        this.idUsedByDistributor = EMPTY;
        this.producedBy = EMPTY;
        this.productionDate = EMPTY;
        this.startProductionDate = EMPTY;
        this.description = EMPTY;
        this.keywords = EMPTY;
        this.category = EMPTY;
        this.type = EMPTY;
        this.smallImage = EMPTY;
        this.mediumImage = EMPTY;
        this.largeImage = EMPTY;
        this.timeEntered = EMPTY;
        this.lastModified = EMPTY;
        this.price = new Money();
        this.comment = EMPTY;
        this.customs = EMPTY;
        this.setDownloads(EMPTY);
        this.groups = EMPTY;
        this.options = EMPTY;
        this.permissions = EMPTY;
        this.specials = EMPTY;
    }

    public function setId(itemId : String) : Void {
        this.itemId = itemId;
    }

    public function setNumber(number : String) : Void {
        this.number = number;
    }

    public function setInBaskets(value : String) : Void {
        this.inBaskets = value;
    }

    public function setWeight(value : String) : Void {
        this.weight = value;
    }

    public function setNewOrUsed(value : String) : Void {
        this.newOrUsed = value;
    }

    public function setSummary(value : String) : Void {
        this.summary = value;
    }

    public function setDistributor(value : String) : Void {
        this.distributor = value;
    }

    public function setIdUsedByDistributor(value : String) : Void {
        this.idUsedByDistributor = value;
    }

    public function setProducedBy(value : String) : Void {
        this.producedBy = value;
    }

    public function setProductionDate(value : String) : Void {
        this.productionDate = value;
    }

    public function setStartProductionDate(value : String) : Void {
        this.startProductionDate = value;
    }

    public function setDescription(value : String) : Void {
        this.description = value;
    }

    public function setKeywords(value : String) : Void {
        this.keywords = value;
    }

    public function setCategory(value : String) : Void {
        this.category = value;
    }

    public function setType(value : String) : Void {
        this.type = value;
    }

    public function setSmallImage(value : String) : Void {
        this.smallImage = value;
    }

    public function setMediumImage(value : String) : Void {
        this.mediumImage = value;
    }

    public function setLargeImage(value : String) : Void {
        this.largeImage = value;
    }

    public function setTimeEntered(value : String) : Void {
        this.timeEntered = value;
    }

    public function setLastModified(value : String) : Void {
        this.lastModified = value;
    }

    public function setPrice(value : Money) : Void {
        this.price = value;
    }

    public function setComment(value : String) : Void {
        this.comment = value;
    }

    public function setCustoms(value : String) : Void {
        this.customs = value;
    }

    public function setDownloads(value : String) : Void {
        this.downloads = value;
        if (!StringValidationUtil.getInstance().isEmpty(this.downloads)) {
            var downloadInteger : Null<Int> = Std.string(this.downloads);
            if (Std.int(downloadInteger) != 0) {
                this.setDownloadable(true);
            }
        }
    }

    public function setGroups(value : String) : Void {
        this.groups = value;
    }

    public function setOptions(value : String) : Void {
        this.options = value;
    }

    public function setPermissions(value : String) : Void {
        this.permissions = value;
    }

    public function setSpecials(value : String) : Void {
        this.specials = value;
    }

    public function setEnabled(value : String) : Void {
        this.enabled = value;
    }

    public function getId() : String {
        return this.itemId;
    }

    public function getNumber() : String {
        return this.number;
    }

    public function getInBaskets() : String {
        return this.inBaskets;
    }

    public function getWeight() : String {
        return this.weight;
    }

    public function getNewOrUsed() : String {
        return this.newOrUsed;
    }

    public function getSummary() : String {
        return this.summary;
    }

    public function getDistributor() : String {
        return this.distributor;
    }

    public function getIdUsedByDistributor() : String {
        return this.idUsedByDistributor;
    }

    public function getProducedBy() : String {
        return this.producedBy;
    }

    public function getProductionDate() : String {
        return this.productionDate;
    }

    public function getStartProductionDate() : String {
        return this.startProductionDate;
    }

    public function getDescription() : String {
        return this.description;
    }

    public function getKeywords() : String {
        return this.keywords;
    }

    public function getCategory() : String {
        return this.category;
    }

    public function getType() : String {
        return this.type;
    }

    public function getSmallImage() : String {
        return this.smallImage;
    }

    public function getMediumImage() : String {
        return this.mediumImage;
    }

    public function getLargeImage() : String {
        return this.largeImage;
    }

    public function getTimeEntered() : String {
        return this.timeEntered;
    }

    public function getLastModified() : String {
        return this.lastModified;
    }

    public function getPrice() : Money {
        return this.price;
    }

    public function getComment() : String {
        return this.comment;
    }

    public function getCustoms() : String {
        return this.customs;
    }

    public function getDownloads() : String {
        return this.downloads;
    }

    public function getGroups() : String {
        return this.groups;
    }

    public function getOptions() : String {
        return this.options;
    }

    public function getPermissions() : String {
        return this.permissions;
    }

    public function getSpecials() : String {
        return this.specials;
    }

    public function setDownloadable(downloadable : Bool) : Void {
        this.downloadable = downloadable;
    }

    public function isDownloadable() : Bool {
        return this.downloadable;
    }

    public function getEnabled() : String {
        return this.enabled;
    }

    public function getTotal() : Money {
        var itemTotal : Money = new Money(this.price);
        itemTotal.multiply(Std.int(this.number));
        return itemTotal;
    }

    public function toHashMap() : HashMap {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, "toHashMap");
        }
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(basicItemData.ID, this.itemId);
        hashMap.put(basicItemData.NUMBER, this.number);
        hashMap.put(basicItemData.INBASKETS, this.inBaskets);
        hashMap.put(basicItemData.WEIGHT, this.weight);
        hashMap.put(EntryData.getInstance().ENABLE, this.enabled);
        hashMap.put(basicItemData.NEWORUSED, this.newOrUsed);
        hashMap.put(basicItemData.SUMMARY, this.summary);
        hashMap.put(basicItemData.DISTRIBUTOR, this.distributor);
        hashMap.put(basicItemData.IDUSEDBYDISTRIBUTOR, this.idUsedByDistributor);
        hashMap.put(basicItemData.PRODUCEDBY, this.producedBy);
        hashMap.put(basicItemData.PRODUCTIONDATE, this.productionDate);
        hashMap.put(basicItemData.STARTPRODUCTIONDATE, this.startProductionDate);
        hashMap.put(basicItemData.DESCRIPTION, this.description);
        hashMap.put(basicItemData.KEYWORDS, this.keywords);
        hashMap.put(basicItemData.CATEGORY, this.category);
        hashMap.put(basicItemData.TYPE, this.type);
        hashMap.put(basicItemData.SMALLIMAGE, this.smallImage);
        hashMap.put(basicItemData.MEDIUMIMAGE, this.mediumImage);
        hashMap.put(basicItemData.LARGEIMAGE, this.largeImage);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        hashMap.put(EntryData.getInstance().LASTMODIFIED, time);
        hashMap.put(basicItemData.PRICE, Std.string(this.price));
        hashMap.put(basicItemData.COMMENT, this.comment);
        hashMap.put(basicItemData.CUSTOMS, this.customs);
        hashMap.put(basicItemData.DOWNLOADS, this.getDownloads());
        hashMap.put(basicItemData.GROUPS, this.groups);
        hashMap.put(basicItemData.OPTIONS, this.options);
        hashMap.put(basicItemData.PERMISSIONS, this.permissions);
        hashMap.put(basicItemData.SPECIALS, this.specials);
        return hashMap;
    }

    public function toVector() : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, "toVector");
        }
        var values : BasicArrayList = new BasicArrayListD();
        values.add(this.itemId);
        values.add(this.number);
        values.add(this.inBaskets);
        values.add(this.weight);
        values.add(this.enabled);
        values.add(this.newOrUsed);
        values.add(this.summary);
        values.add(this.distributor);
        values.add(this.idUsedByDistributor);
        values.add(this.producedBy);
        values.add(this.productionDate);
        values.add(this.startProductionDate);
        values.add(this.description);
        values.add(this.keywords);
        values.add(this.category);
        values.add(this.type);
        values.add(this.getSmallImage());
        values.add(this.getMediumImage());
        values.add(this.getLargeImage());
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        values.add(time);
        values.add(time);
        values.add(Std.string(this.price));
        values.add(this.comment);
        values.add(this.customs);
        values.add(this.getDownloads());
        values.add(this.groups);
        values.add(this.options);
        values.add(this.permissions);
        values.add(this.specials);
        return values;
    }

    // throws Exception
    public function getKey() : Any {
        return (cast this.getId() : Any);
    }

}

