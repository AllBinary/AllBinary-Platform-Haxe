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
package org.allbinary.business.user.commerce.inventory.item.download;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.data.generator.ProductIdGenerator;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.time.TimeUtil;

class DownloadableItem {
    private final id : String;
    private final basicItemId : String;
    private final enabled : String;
    private final system : String;
    private final platform : String;
    private final specialName : String;
    private final version : String;
    private final changes : String;
    private final licenseFile : String;
    private final file : String;
    private final size : Null<haxe.Int64>;
    private final validTime : Null<haxe.Int64>;
    private final retries : String;
    public function new(id : String) {
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        this.id = new ProductIdGenerator().getNext();
        this.basicItemId = id;
        this.enabled = EntryData.getInstance().YES;
        this.system = "Java";
        this.platform = "Android";
        this.specialName = EMPTY_STRING;
        this.version = EMPTY_STRING;
        this.changes = EMPTY_STRING;
        this.licenseFile = EMPTY_STRING;
        this.file = EMPTY_STRING;
        this.size = Std.string(0);
        this.validTime = Std.string(0);
        this.retries = EMPTY_STRING;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.id = (cast hashMap.get(DownloadItemData.ID) : String);
        this.basicItemId = (cast hashMap.get(BasicItemData.getInstance().ID) : String);
        this.enabled = (cast hashMap.get(EntryData.getInstance().ENABLE) : String);
        this.system = (cast hashMap.get(DownloadItemData.SYSTEM) : String);
        this.platform = (cast hashMap.get(DownloadItemData.PLATFORM) : String);
        this.specialName = (cast hashMap.get(DownloadItemData.SPECIAL_NAME) : String);
        this.version = (cast hashMap.get(DownloadItemData.VERSION) : String);
        this.changes = (cast hashMap.get(DownloadItemData.CHANGES) : String);
        this.licenseFile = (cast hashMap.get(DownloadItemData.LICENSE_FILE) : String);
        this.file = (cast hashMap.get(DownloadItemData.FILE) : String);
        var value : String = (cast hashMap.get(DownloadItemData.SIZE) : String);
        if (!StringValidationUtil.getInstance().isEmpty(value)) {
            this.size = Std.string(value);
        } else {
            this.size = 0;
        }
        var validTime : String = (cast hashMap.get(DownloadItemData.VALID_TIME) : String);
        if (!StringValidationUtil.getInstance().isEmpty(validTime)) {
            this.validTime = Std.string(validTime);
        } else {
            var totalYears : String = (cast hashMap.get(DownloadItemData.VALID_TIME_YEARS) : String);
            var totalMonths : String = (cast hashMap.get(DownloadItemData.VALID_TIME_MONTHS) : String);
            var totalDays : String = (cast hashMap.get(DownloadItemData.VALID_TIME_DAYS) : String);
            var totalHours : String = (cast hashMap.get(DownloadItemData.VALID_TIME_HOURS) : String);
            var totalMinutes : String = (cast hashMap.get(DownloadItemData.VALID_TIME_MINUTES) : String);
            var totalSeconds : String = (cast hashMap.get(DownloadItemData.VALID_TIME_SECONDS) : String);
            var totalTime : haxe.Int64 = TimeUtil.getInstance().getTotalTime(totalYears, totalMonths, totalDays, totalHours, totalMinutes, totalSeconds);
            this.validTime = totalTime;
        }
        this.retries = (cast hashMap.get(DownloadItemData.RETRIES) : String);
    }

    public function toVector() : BasicArrayList {
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        var values : BasicArrayList = new BasicArrayListD();
        values.add(getId());
        values.add(this.basicItemId);
        values.add(this.enabled);
        values.add(this.getSpecialName());
        values.add(this.getVersion());
        values.add(this.getChanges());
        values.add(this.getSystem());
        values.add(this.getPlatform());
        values.add(this.getLicenseFile());
        values.add(this.getFile());
        values.add(Std.string(this.getSize()));
        values.add(Std.string(this.getValidTime()));
        values.add(this.getRetries());
        values.add(time);
        values.add(time);
        return values;
    }

    public function toHashMap() : HashMap {
        var values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(DownloadItemData.ID, this.getId());
        values.put(BasicItemData.getInstance().ID, this.basicItemId);
        values.put(EntryData.getInstance().ENABLE, this.enabled);
        values.put(DownloadItemData.SYSTEM, this.getSystem());
        values.put(DownloadItemData.PLATFORM, this.getPlatform());
        values.put(DownloadItemData.SPECIAL_NAME, this.getSpecialName());
        values.put(DownloadItemData.VERSION, this.getVersion());
        values.put(DownloadItemData.CHANGES, this.getChanges());
        values.put(DownloadItemData.LICENSE_FILE, this.getLicenseFile());
        values.put(DownloadItemData.FILE, this.getFile());
        values.put(DownloadItemData.SIZE, Std.string(this.getSize()));
        values.put(DownloadItemData.VALID_TIME, Std.string(this.getValidTime()));
        values.put(DownloadItemData.RETRIES, this.getRetries());
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        values.put(EntryData.getInstance().LASTMODIFIED, time);
        return values;
    }

    public function getId() : String {
        return this.id;
    }

    public function getSystem() : String {
        return this.system;
    }

    public function getPlatform() : String {
        return this.platform;
    }

    public function getSpecialName() : String {
        return this.specialName;
    }

    public function getVersion() : String {
        return this.version;
    }

    public function getChanges() : String {
        return this.changes;
    }

    public function getLicenseFile() : String {
        return this.licenseFile;
    }

    public function getFile() : String {
        return this.file;
    }

    public function getSize() : Null<haxe.Int64> {
        return this.size;
    }

    public function getValidTime() : Null<haxe.Int64> {
        return this.validTime;
    }

    public function getRetries() : String {
        return this.retries;
    }

}

