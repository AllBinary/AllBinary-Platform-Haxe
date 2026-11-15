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
//import java.util.Set;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class DownloadableItemView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var downloadableItem : DownloadableItem;
    public function new(downloadableItem : DownloadableItem) {
        this.downloadableItem = downloadableItem;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRODUCTSEARCHLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, "toXmlNode");
        }
        var hashMap : HashMap = this.downloadableItem.toHashMap();
        var totalTime : haxe.Int64 = haxe.Int64.ofInt(this.downloadableItem.getValidTime());
        var calendar : Calendar = Calendar.getInstance();
        var year : Int = calendar.get(Calendar.YEAR);
        var month : Int = calendar.get(Calendar.MONTH);
        var day : Int = calendar.get(Calendar.DAY_OF_MONTH);
        var hour : Int = calendar.get(Calendar.HOUR);
        var minute : Int = calendar.get(Calendar.MINUTE);
        var second : Int = calendar.get(Calendar.SECOND);
        calendar.setTimeInMillis(calendar.getTimeInMillis() + totalTime);
        var yearDelta : Int = calendar.get(Calendar.YEAR);
        var monthDelta : Int = calendar.get(Calendar.MONTH);
        var dayDelta : Int = calendar.get(Calendar.DAY_OF_MONTH);
        var hourDelta : Int = calendar.get(Calendar.HOUR);
        var minuteDelta : Int = calendar.get(Calendar.MINUTE);
        var secondDelta : Int = calendar.get(Calendar.SECOND);
        hashMap.put(DownloadItemData.VALID_TIME_YEARS, Std.string(yearDelta - year));
        hashMap.put(DownloadItemData.VALID_TIME_MONTHS, Std.string(monthDelta - month));
        hashMap.put(DownloadItemData.VALID_TIME_DAYS, Std.string(dayDelta - day));
        hashMap.put(DownloadItemData.VALID_TIME_HOURS, Std.string(hourDelta - hour));
        hashMap.put(DownloadItemData.VALID_TIME_MINUTES, Std.string(minuteDelta - minute));
        hashMap.put(DownloadItemData.VALID_TIME_SECONDS, Std.string(secondDelta - second));
        var keySet : Set = hashMap.keySet();
        var node : Node = document.createElement(DownloadItemData.NAME);
        var stringUtil : StringUtil = StringUtil.getInstance();
        final nameArray : haxe.ds.Vector<Any> = keySet.toArray();
        final size : Int = nameArray.length;
        for (index in 0...size) {
            var name : String = (cast nameArray[index] : String);
            var value : String = (cast hashMap.get(name) : String);
            value = stringUtil.getNonNull(value);
            node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
        }
        return node;
    }

    public function toXmlDoc() : Document {
        return null;
    }

    public function view() : String {
        return null;
    }

}

