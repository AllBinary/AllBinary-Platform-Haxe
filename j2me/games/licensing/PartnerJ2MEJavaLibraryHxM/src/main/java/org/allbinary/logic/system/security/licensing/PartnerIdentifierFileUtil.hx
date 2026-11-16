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
package org.allbinary.logic.system.security.licensing;

import jre.io.InputStream;
import jre.io.InputStreamReader;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class PartnerIdentifierFileUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : PartnerIdentifierFileUtil = new PartnerIdentifierFileUtil();
    public static function getInstance() : PartnerIdentifierFileUtil {
        return PartnerIdentifierFileUtil.instance;
    }

    public final FILE_NAME : String = "partner.txt";
    public function get() : String {
        try {
            final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
            final inputStream : InputStream = jre.lang.ClassLoader.getSystemResourceAsStream(this.FILE_NAME);
            final inputStreamReader : InputStreamReader = new InputStreamReader(inputStream);
            final chars : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...30) 0]);
            final size : Int = inputStreamReader.read(chars);
            var partnerString : String = StringUtil.getInstance().EMPTY_STRING;
            if (size > 0) {
                partnerString = jre.lang.JavaString.fromChars(chars, 0, size);
            }
            inputStreamReader.close();
            return partnerString;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET, e);
            return StringUtil.getInstance().NULL_STRING;
        }
    }

    public function new() {
    }
}

