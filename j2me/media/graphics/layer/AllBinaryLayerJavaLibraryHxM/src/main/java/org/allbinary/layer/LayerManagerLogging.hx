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
package org.allbinary.layer;

import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class LayerManagerLogging extends LayerManagerLoggingBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : LayerManagerLogging = new LayerManagerLogging();
    public static function getInstance() : LayerManagerLogging {
        return LayerManagerLogging.instance;
    }

    private final stringBuilder : StringMaker = new StringMaker();
    private final APPEND : String = "append";
    private final APPEND_ : String = " append: ";
    private final _AT_ : String = " at: ";
    private final ATTEMPT_REMOVE_ : String = " Remove Attempt: ";
    private final REMOVE_ : String = " Remove: ";
    private final REMOVE : String = "remove";
    private final DID_NOT_REMOVE : String = " Did not remove: ";
    private final CLEAR : String = " Clear List";
    private static var removeFailed : Bool = false;
    // throws Exception
    public override function append(layerInterface : AllBinaryLayer) : Void {
        this.stringBuilder.delete(0, this.stringBuilder.length());
        this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.APPEND_).append(layerInterface.getName())), this, this.APPEND);
    }

    public override function appendAt(layerInterface : AllBinaryLayer, index : Int) : Void {
        this.stringBuilder.delete(0, this.stringBuilder.length());
        this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.APPEND_).append(layerInterface.getName()).append(this._AT_).appendint(index)), this, this.APPEND);
    }

    public override function remove(layerInterface : AllBinaryLayer) : Void {
        if (layerInterface == null) {
            this.stringBuilder.delete(0, this.stringBuilder.length());
            this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.ATTEMPT_REMOVE_).append(StringUtil.getInstance().toString(layerInterface))), this, this.REMOVE);
        } else {
            this.stringBuilder.delete(0, this.stringBuilder.length());
            this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.ATTEMPT_REMOVE_).append(layerInterface.getName())), this, this.REMOVE);
        }
    }

    public override function removeResult(layerManager : LayerManager, layerInterface : AllBinaryLayer, result : Bool) : Void {
        if (layerInterface == null) {
            this.stringBuilder.delete(0, this.stringBuilder.length());
            this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.REMOVE_).append(StringUtil.getInstance().toString(layerInterface))), this, this.REMOVE);
        } else if (result) {
            if (LayerManagerLogging.removeFailed) {
                this.stringBuilder.delete(0, this.stringBuilder.length());
                this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.REMOVE_).append(layerInterface.getName())), this, this.REMOVE);
            }
        } else {
            this.stringBuilder.delete(0, this.stringBuilder.length());
            this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.DID_NOT_REMOVE).append(layerInterface.getName())), this, this.REMOVE);
            LayerManagerLogging.removeFailed = true;
        }
    }

    private function log(layerManager : LayerManager) : Void {
        this.stringBuilder.delete(0, this.stringBuilder.length());
        final size : Int = layerManager.getSize();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        this.stringBuilder.append(StringTools.hex(TsUtil.getInstance().hashCode(layerManager))).append(commonSeps.COLON_SEP);
        this.stringBuilder.appendint(size).append(commonSeps.COLON_SEP);
        var allBinaryLayer : AllBinaryLayer = null;
        for (index in 0...size) {
            allBinaryLayer = ((cast layerManager.getLayerAt(index) : AllBinaryLayer));
            this.stringBuilder.append(allBinaryLayer.getName()).append(commonSeps.COMMA);
        }
        this.logUtil.putF(Std.string(this.stringBuilder), this, this.REMOVE);
    }

    public override function clear() : Void {
        this.stringBuilder.delete(0, this.stringBuilder.length());
        this.logUtil.putF(Std.string(this.stringBuilder.appendint(jre.lang.JavaNumber.toInt(TsUtil.getInstance().hashCode(this))).append(this.CLEAR)), this, this.CLEAR);
    }

    public function new() {
        super();
    }
}

