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
package org.allbinary.data.generator;

//import java.io.IOException;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.generator.IdGeneratorEntity;
import org.allbinary.data.tables.generator.IdGeneratorEntityFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;

class UniqueIdGenerator implements IdGeneratorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final EXT : String = ".unq";
    private final idGeneratorEntity : IdGeneratorEntity;
    private var name : String = null;
    public function new() {
        this.idGeneratorEntity = (cast IdGeneratorEntityFactory.getInstance() : IdGeneratorEntity);
    }

    public function initialize(value : Int) : Void {
        try {
            var vector : BasicArrayList = new BasicArrayListD();
            vector.add(this.name);
            vector.add(Std.string(value).toString());
            this.idGeneratorEntity.insert(vector);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().IDLOGGING)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "initialize", e);
            }
        }
    }

    // throws Exception
    // synchronized
    public function setFile(filePathName : String, name : String) : Void {
        this.name = name;
    }

    // throws IOException
    // synchronized
    public function getNext() : String {
        try {
            var idLong : Null<haxe.Int64> = this.idGeneratorEntity.get(this.name);
            var newValue : Null<haxe.Int64> = Std.string(haxe.Int64.ofInt(idLong) + 1);
            this.idGeneratorEntity.update(this.name, newValue);
            return idLong.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().IDLOGGING)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "getNext", e);
            }
            return "Error";
        }
    }

}

