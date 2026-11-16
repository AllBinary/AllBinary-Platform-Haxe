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
package org.allbinary.business.init;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.SubDirectory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class WeblisketFinder {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : WeblisketFinder = new WeblisketFinder();
    public static function getInstance() : WeblisketFinder {
        return WeblisketFinder.instance;
    }

    private static final KEY : String = "installerdata.dat";
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final subDirectory : SubDirectory = SubDirectory.getInstance();
    public function new() {
    }

    public function findAll(path : String) : BasicArrayList {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "findAll");
            return this.subDirectory.search(WeblisketFinder.KEY, AbFile.createAbFile(path));
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "findAll", e);
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "findAll", e);
            }
            return null;
        }
    }

    public function getInstallationPath(file : AbFile) : String {
        try {
            var filePath : String = file.getPath();
            var end : Int = filePath.indexOf(KEY);
            if (end < 0) {
                return null;
            }
            return filePath.substring(0, end);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().PRELOADERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getInstallationPath", e);
            }
            return null;
        }
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        final stringUtil : StringUtil = StringUtil.getInstance();
        final vector : BasicArrayList = WeblisketFinder.getInstance().findAll(stringUtil.EMPTY_STRING);
        trace(vector.size());
    }

}

