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
package org.allbinary.graphics.displayable;

//import javax.microedition.lcdui.Displayable;
import org.allbinary.AndroidUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.LastDisplayChangeEventHandler;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.threed.SWTJOGLProcessor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DisplayInfoSingleton {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : DisplayInfoSingleton = new DisplayInfoSingleton();
    public static function getInstance() : DisplayInfoSingleton {
        return DisplayInfoSingleton.SINGLETON;
    }

    private final commonLabels : CommonLabels = CommonLabels.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final ORIENTATION : String = "ORIENTATION";
    public final ADJUSTING_FOR_SCALING_IN_PORTRAIT : String = "Adjusting for Scaling in portrait display ratio: ";
    public final ADJUSTING_FOR_SCALING_IN_LANDSCAPE : String = "Adjusting for Scaling in landscape display ratio: ";
    private var last : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...4) 0]);
    private var lastHalf : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...4) 0]);
    private var full : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...4) 0]);
    private var top : Int = 0;
    private var left : Int = 0;
    private var xOffset : Int = 0;
    private var yOffset : Int = 0;
    private var scaleLargestTo : Float = 0.0;
    public final WIDTH : Int = 0;
    public final HEIGHT : Int = 1;
    public final CUSTOM_WIDTH : Int = 2;
    public final CUSTOM_HEIGHT : Int = 3;
    private var scalableListener : BaseScalable = new BaseScalable();
    private var displayRatio : Float = 0.0;
    private var ratio : Float = 1.0;
    public function new() {
        final size : Int = this.last.length;
        for (index in 0...size) {
            this.last[index] = 0;
            this.lastHalf[index] = 0;
            this.full[index] = 0;
        }
        if (AndroidUtil.isAndroid()) {
            this.scaleLargestTo = 640.0;
        } else {
            this.scaleLargestTo = 1080.0;
        }
    }

    public function getLastHalf() : haxe.ds.Vector<Int> {
        return this.lastHalf;
    }

    public function getLast() : haxe.ds.Vector<Int> {
        return this.last;
    }

    public function getFull() : haxe.ds.Vector<Int> {
        return this.full;
    }

    public function getScaleLargestTo() : Float {
        return this.scaleLargestTo;
    }

    public function setScaleLargestTo(scaleLargestTo : Int) : Void {
        this.scaleLargestTo = scaleLargestTo;
    }

    private final SET_LAST_SIZE_METHOD_NAME : String = "setLastSize";
    private final FULL_WIDTH : String = " FullWidth: ";
    private final FULL_HEIGHT : String = " FullHeight: ";
    private final LAST_WIDTH : String = "LastWidth: ";
    private final LAST_HEIGHT : String = " LastHeight: ";
    private final PORTRAIT : String = "Portrait";
    private final LANDSCAPE : String = "Landscape";
    public function setLastSize(aLastWidth : Int, aLastHeight : Int, reason : String) : Void {
        if (this.full[this.WIDTH] != aLastWidth || this.full[this.HEIGHT] != aLastHeight) {
            this.setLastSizeForce(aLastWidth, aLastHeight, reason);
        }
    }

    private function setLastSizeForce(aLastWidth : Int, aLastHeight : Int, reason : String) : Void {
        final stringMaker : StringMaker = new StringMaker();
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().START_LABEL).append(reason).toString(), this, this.SET_LAST_SIZE_METHOD_NAME);
        final aFullWidth : Int = aLastWidth;
        final aFullHeight : Int = aLastHeight;
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.FULL_WIDTH).appendint(aFullWidth).append(this.FULL_HEIGHT).appendint(aFullHeight).append(this.toString()).toString(), this, this.SET_LAST_SIZE_METHOD_NAME);
        final operatingSystemInterface : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
        if (operatingSystemInterface.isOverScan()) {
            aLastWidth = aLastWidth * operatingSystemInterface.getOverScanXPercent() / 100;
            aLastHeight = aLastHeight * operatingSystemInterface.getOverScanYPercent() / 100;
        }
        if (operatingSystemInterface.isScalable()) {
            if (this.isPortraitWH(aLastWidth, aLastHeight)) {
                if (aLastHeight > this.scaleLargestTo) {
                    this.displayRatio = this.scaleLargestTo / aLastHeight;
                    this.ratio = aLastHeight / this.scaleLargestTo;
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.ADJUSTING_FOR_SCALING_IN_PORTRAIT).appendfloat(this.displayRatio).toString(), this, this.SET_LAST_SIZE_METHOD_NAME);
                    aLastWidth = Std.int((aLastWidth * this.displayRatio));
                    aLastHeight = Std.int((aLastHeight * this.displayRatio));
                    this.scalableListener.scale(this.ratio);
                } else {
                    this.ratio = 1.0;
                    this.scalableListener.scale(this.ratio);
                }
            } else {
                if (aLastWidth > this.scaleLargestTo) {
                    this.displayRatio = this.scaleLargestTo / aLastWidth;
                    this.ratio = aLastWidth / this.scaleLargestTo;
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.ADJUSTING_FOR_SCALING_IN_LANDSCAPE).appendfloat(this.displayRatio).toString(), this, this.SET_LAST_SIZE_METHOD_NAME);
                    aLastWidth = Std.int((aLastWidth * this.displayRatio));
                    aLastHeight = Std.int((aLastHeight * this.displayRatio));
                    this.scalableListener.scale(this.ratio);
                } else {
                    this.ratio = 1.0;
                    this.scalableListener.scale(this.ratio);
                }
            }
        }
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.LAST_WIDTH).appendint(aLastWidth).append(this.LAST_HEIGHT).appendint(aLastHeight).toString(), this, this.SET_LAST_SIZE_METHOD_NAME);
        this.xOffset = aFullWidth - aLastWidth;
        this.yOffset = aFullHeight - aLastHeight;
        this.left = this.scalableListener.getLeft(this.xOffset);
        this.top = this.scalableListener.getTop(this.yOffset);
        this.full[this.WIDTH] = aFullWidth;
        this.full[this.HEIGHT] = aFullHeight;
        this.last[this.WIDTH] = aLastWidth;
        this.lastHalf[this.WIDTH] = (this.last[this.WIDTH] >> 1);
        this.last[this.HEIGHT] = aLastHeight;
        this.lastHalf[this.HEIGHT] = (this.last[this.HEIGHT] >> 1);
        SWTJOGLProcessor.getInstance().setCustom(aLastWidth, aLastHeight, this.ratio);
        this.add(this.SET_LAST_SIZE_METHOD_NAME);
    }

    public function isPortraitWH(lastWidth : Int, lastHeight : Int) : Bool {
        if (lastHeight > lastWidth) {
            return true;
        } else {
            return false;
        }
    }

    public function isPortrait() : Bool {
        return this.isPortraitWH(this.last[this.WIDTH], this.last[this.HEIGHT]);
    }

    public final displayChangeEvent : DisplayChangeEvent = new DisplayChangeEvent(this);
    private final FIRE_METHOD_NAME : String = "fire";
    private final REASON : String = "reason: ";
    private final UPDATE_FROM_ORIENTATION_CHANGE : String = "Updating from Orientation Change ";
    private final list : BasicArrayList = new BasicArrayListD();
    public function add(reason : String) : Void {
        final stringMaker : StringMaker = new StringMaker();
        this.logUtil.putF(stringMaker.append(this.REASON).append(reason).toString(), this, this.FIRE_METHOD_NAME);
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(this.toStringAppend(stringMaker), this, this.FIRE_METHOD_NAME);
        this.list.add(reason);
    }

    public function process() : Void {
        try {
            if (this.list.size() > 0) {
                this.processForced();
            }
            this.list.clear();
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, this.FIRE_METHOD_NAME, e);
        }
    }

    public function processForced() : Void {
        try {
            final swtJOGLProcessor : SWTJOGLProcessor = SWTJOGLProcessor.getInstance();
            swtJOGLProcessor.clear();
            DisplayChangeEventHandler.getInstance().fireEvent(this.displayChangeEvent);
            LastDisplayChangeEventHandler.getInstance().fireEvent(this.displayChangeEvent);
            swtJOGLProcessor.onSurfaceChanged();
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, this.FIRE_METHOD_NAME, e);
        }
    }

    public function update(displayable : Displayable, reason : String) : Void {
        var aLastWidth : Int = displayable.getWidth();
        var aLastHeight : Int = displayable.getHeight();
        final aFullWidth : Int = aLastWidth;
        final aFullHeight : Int = aLastHeight;
        final stringMaker : StringMaker = new StringMaker();
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().START_LABEL).append(reason).append(this.LAST_WIDTH).appendint(aLastWidth).append(this.LAST_HEIGHT).appendint(aLastHeight).append(this.commonSeps.SPACE).append(this.toString()).toString(), this, this.commonStrings.UPDATE);
        if (aLastWidth > 0 && aLastHeight > 0) {
            final features : Features = Features.getInstance();
            final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
            if (!features.isDefault(openGLFeatureFactory.OPENGL) || this.last[this.WIDTH] != aLastWidth || this.last[this.HEIGHT] != aLastHeight) {
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.UPDATE_FROM_ORIENTATION_CHANGE).toString(), this, this.commonStrings.UPDATE);
                final operatingSystemInterface : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
                if (operatingSystemInterface.isOverScan()) {
                    aLastWidth = aLastWidth * operatingSystemInterface.getOverScanXPercent() / 100;
                    aLastHeight = aLastHeight * operatingSystemInterface.getOverScanYPercent() / 100;
                }
                if (operatingSystemInterface.isScalable()) {
                    if (this.isPortraitWH(aLastWidth, aLastHeight)) {
                        if (aLastHeight > this.scaleLargestTo) {
                            this.displayRatio = this.scaleLargestTo / aLastHeight;
                            this.ratio = aLastHeight / this.scaleLargestTo;
                            stringMaker.delete(0, stringMaker.length());
                            this.logUtil.putF(stringMaker.append(this.ADJUSTING_FOR_SCALING_IN_PORTRAIT).appendfloat(this.displayRatio).toString(), this, this.commonStrings.UPDATE);
                            aLastWidth = Std.int((aLastWidth * this.displayRatio));
                            aLastHeight = Std.int((aLastHeight * this.displayRatio));
                            this.scalableListener.scale(this.ratio);
                        } else {
                            this.ratio = 1.0;
                            this.scalableListener.scale(this.ratio);
                        }
                    } else {
                        if (aLastWidth > this.scaleLargestTo) {
                            this.displayRatio = this.scaleLargestTo / aLastWidth;
                            this.ratio = aLastWidth / this.scaleLargestTo;
                            stringMaker.delete(0, stringMaker.length());
                            this.logUtil.putF(stringMaker.append(this.ADJUSTING_FOR_SCALING_IN_LANDSCAPE).appendfloat(this.displayRatio).toString(), this, this.commonStrings.UPDATE);
                            aLastWidth = Std.int((aLastWidth * this.displayRatio));
                            aLastHeight = Std.int((aLastHeight * this.displayRatio));
                            this.scalableListener.scale(this.ratio);
                        } else {
                            this.ratio = 1.0;
                            this.scalableListener.scale(this.ratio);
                        }
                    }
                }
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.UPDATE_FROM_ORIENTATION_CHANGE).append(this.LAST_WIDTH).appendint(aLastWidth).append(this.LAST_HEIGHT).appendint(aLastHeight).toString(), this, this.commonStrings.UPDATE);
                this.xOffset = aFullWidth - aLastWidth;
                this.yOffset = aFullHeight - aLastHeight;
                this.left = this.scalableListener.getLeft(this.xOffset);
                this.top = this.scalableListener.getTop(this.yOffset);
                this.full[this.WIDTH] = aFullWidth;
                this.full[this.HEIGHT] = aFullHeight;
                this.last[this.WIDTH] = aLastWidth;
                this.lastHalf[this.WIDTH] = (this.last[this.WIDTH] >> 1);
                this.last[this.HEIGHT] = aLastHeight;
                this.lastHalf[this.HEIGHT] = (this.last[this.HEIGHT] >> 1);
                SWTJOGLProcessor.getInstance().setCustom(aLastWidth, aLastHeight, this.ratio);
                this.add(this.commonStrings.UPDATE);
            }
        }
    }

    private final DISPLAY_INFO : String = "Display Info: ";
    private final FULL : String = "full";
    private final LAST : String = "last";
    private final LAST_HALF : String = "lastHalf";
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        return this.toStringAppend(stringBuffer);
    }

    public function toStringAppend(stringBuffer : StringMaker) : String {
        stringBuffer.append(this.DISPLAY_INFO);
        stringBuffer.append(this.FULL);
        stringBuffer.append(this.commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(this.full[this.WIDTH]);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.FULL);
        stringBuffer.append(this.commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(this.full[this.HEIGHT]);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.LAST);
        stringBuffer.append(this.commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(this.last[this.WIDTH]);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.LAST);
        stringBuffer.append(this.commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(this.last[this.HEIGHT]);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.LAST_HALF);
        stringBuffer.append(this.commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(this.lastHalf[this.WIDTH]);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.LAST_HALF);
        stringBuffer.append(this.commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(this.lastHalf[this.HEIGHT]);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append((this.isPortrait() ? this.PORTRAIT : this.LANDSCAPE));
        return stringBuffer.toString();
    }

    public function getTop() : Int {
        return this.top;
    }

    public function getLeft() : Int {
        return this.left;
    }

    public function getLastWidth() : Int {
        return this.last[this.WIDTH];
    }

    public function getLastHeight() : Int {
        return this.last[this.HEIGHT];
    }

    public function getLastHalfWidth() : Int {
        return this.lastHalf[this.WIDTH];
    }

    public function getLastHalfHeight() : Int {
        return this.lastHalf[this.HEIGHT];
    }

    public function getCustomLastWidth() : Int {
        return this.last[this.CUSTOM_WIDTH];
    }

    public function getCustomLastHeight() : Int {
        return this.last[this.CUSTOM_HEIGHT];
    }

    public function getRawLastWidth() : Int {
        return this.last[this.WIDTH];
    }

    public function getRawLastHeight() : Int {
        return this.last[this.HEIGHT];
    }

    public function setCustom(width : Int, height : Int) : Void {
        this.last[this.CUSTOM_WIDTH] = width;
        this.lastHalf[this.CUSTOM_WIDTH] = (this.last[this.CUSTOM_WIDTH] >> 1);
        this.last[this.CUSTOM_HEIGHT] = height;
        this.lastHalf[this.CUSTOM_HEIGHT] = (this.last[this.CUSTOM_HEIGHT] >> 1);
    }

    public function setScalableListener(scalableListener : BaseScalable) : Void {
        this.scalableListener = scalableListener;
    }

    public function getScalableListener() : ScalableListener {
        return this.scalableListener;
    }

    public function getRatio() : Float {
        return this.ratio;
    }

    public function getDisplayRatio() : Float {
        return this.displayRatio;
    }

    public function setOffset(left : Int, top : Int) : Void {
        this.left = left;
    }

    public function getxOffset() : Int {
        return this.xOffset;
    }

    public function getyOffset() : Int {
        return this.yOffset;
    }

}

