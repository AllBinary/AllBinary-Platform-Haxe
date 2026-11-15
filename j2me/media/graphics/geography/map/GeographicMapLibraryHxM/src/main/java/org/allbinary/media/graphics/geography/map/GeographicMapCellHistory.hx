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
package org.allbinary.media.graphics.geography.map;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.text.TextAnimation;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.logic.math.BasicDecimal;

class GeographicMapCellHistory implements UpdateMyFontInterface {
    public static final NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY : haxe.ds.Vector<GeographicMapCellHistory> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
    private final list : BasicArrayList;
    private final visitedList : BasicArrayList;
    private final MISSED_INFO : String = "Missed";
    private final animation : Animation = new TextAnimation(this.MISSED_INFO, AnimationBehavior.getInstance());
    private var myFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    private var totalVisited : Int = 0;
    private var halfWidth : Int = 0;
    private var fontHeight : Int = 0;
    public function new() {
        this.list = new BasicArrayListD();
        this.visitedList = new BasicArrayListD();
        this.init();
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function getTotalVisited() : Int {
        return this.totalVisited;
    }

    public function getTotalNotVisited() : Int {
        return this.getSize() - this.totalVisited;
    }

    public function getSize() : Int {
        return this.list.size();
    }

    public function trackAll(list : BasicArrayList) : Void {
        final size : Int = list.size();
        this.list.ensureCapacity(size);
        this.visitedList.ensureCapacity(size);
        var geographicMapCellPosition : GeographicMapCellPosition = null;
        for (index in 0...size) {
            geographicMapCellPosition = (cast list.get(index) : GeographicMapCellPosition);
            this.track(geographicMapCellPosition);
        }
    }

    public function track(geographicMapCellPosition : GeographicMapCellPosition) : Void {
        if (!this.list.contains(geographicMapCellPosition)) {
            this.list.add(geographicMapCellPosition);
            this.visitedList.add(this.booleanFactory.FALSE);
        }
    }

    public function getTracked() : BasicArrayList {
        return this.list;
    }

    public function getVisited() : BasicArrayList {
        return this.visitedList;
    }

    public function getAfterIfNotLast(geographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellPosition {
        final localList : BasicArrayList = this.list;
        final index : Int = localList.indexOf(geographicMapCellPosition);
        if (localList.size() > index + 1) {
            return (cast localList.get(index + 1) : GeographicMapCellPosition);
        }
        return geographicMapCellPosition;
    }

    public function getFirstUnvisited() : GeographicMapCellPosition {
        final localList : BasicArrayList = this.list;
        final localVisitedList : BasicArrayList = this.visitedList;
        final size : Int = localVisitedList.size();
        var value : Null<Bool> = null;
        for (index in 0...size) {
            value = (cast this.visitedList.get(index) : Null<Bool>);
            if (value == this.booleanFactory.FALSE) {
                return (cast localList.get(index) : GeographicMapCellPosition);
            }
        }
        return (cast localList.get(0) : GeographicMapCellPosition);
    }

    public function getFirstUnvisitedIndex() : Int {
        var localVisitedList : BasicArrayList = this.visitedList;
        var size : Int = localVisitedList.size();
        var value : Null<Bool> = null;
        for (index in 0...size) {
            value = (cast this.visitedList.get(index) : Null<Bool>);
            if (value == this.booleanFactory.FALSE) {
                return index;
            }
        }
        return 0;
    }

    public function getInPathButNotTracked(pathList : BasicArrayList) : BasicArrayList {
        final inPathButNotTrackedList : BasicArrayList = new BasicArrayListD();
        final localList : BasicArrayList = this.list;
        final size : Int = pathList.size();
        var geographicMapCellPosition : GeographicMapCellPosition = null;
        for (index in 0...size) {
            geographicMapCellPosition = (cast pathList.get(index) : GeographicMapCellPosition);
            if (!localList.contains(geographicMapCellPosition)) {
                inPathButNotTrackedList.add(geographicMapCellPosition);
            }
        }
        return inPathButNotTrackedList;
    }

    public function isVisited(geographicMapCellPosition : GeographicMapCellPosition) : Bool {
        var index : Int = this.list.indexOf(geographicMapCellPosition);
        if (index != -1) {
            var value : Null<Bool> = (cast this.visitedList.get(index) : Null<Bool>);
            if (value == this.booleanFactory.TRUE) {
                return true;
            }
        } else {
        }
        return false;
    }

    public function visit(geographicMapCellPosition : GeographicMapCellPosition) : Bool {
        final index : Int = this.list.indexOf(geographicMapCellPosition);
        var value : Null<Bool> = null;
        if (index != -1) {
            value = (cast this.visitedList.get(index) : Null<Bool>);
            var TRUE : Null<Bool> = this.booleanFactory.TRUE;
            if (value != TRUE) {
                this.visitedList.set(index, TRUE);
                this.totalVisited++;
                return true;
            }
        } else {
        }
        return false;
    }

    // throws Exception
    public function isAllVisited() : Bool {
        if (this.totalVisited == this.getSize() - 1) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function isAllVisited2() : Bool {
        if (this.totalVisited == this.getSize()) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function isPortionVisited(basicDecimal : BasicDecimal) : Bool {
        final size : Int = this.getSize();
        final numberRequired : Int = Std.int((size << basicDecimal.getScaledFactor()) / Std.int(basicDecimal.getUnscaled()));
        final numberNotVisited : Int = this.getSize() - 1 - this.totalVisited;
        if (size - numberNotVisited > numberRequired) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function reset() : Void {
        final localVisitedList : BasicArrayList = this.visitedList;
        final localFalseBoolean : Null<Bool> = this.booleanFactory.FALSE;
        var size : Int = localVisitedList.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            localVisitedList.set(index, localFalseBoolean);
                index--;
            }
        }
        this.totalVisited = 0;
    }

    private function paintNotVisitedRelativeToPoint(graphics : Graphics, tiledLayer : AllBinaryTiledLayer, point : GPoint) : Void {
        final x : Int = point.getX() - tiledLayer.getXP();
        final y : Int = point.getY() - tiledLayer.getYP();
        if (this.halfWidth == 0) {
            this.halfWidth = (graphics.getFont().stringWidth(this.MISSED_INFO) >> 1);
        }
        final height : Int = 2 * this.fontHeight;
        this.animation.paintXY(graphics, x + this.halfWidth, y + (height));
    }

    private final RED : Int = Std.int(BasicColorFactory.getInstance().RED);
    public function paintNotVisited(graphics : Graphics, geographicMapInterface : BasicGeographicMap) : Void {
        try {
            this.myFontProcessor.process(graphics);
            graphics.setColor(this.RED);
            final localVisitedList : BasicArrayList = this.visitedList;
            final size : Int = localVisitedList.size();
            var geographicMapCellPosition : GeographicMapCellPosition = null;
            var isCellVisitedBoolean : Null<Bool> = null;
            {
                var index : Int = size;
                while (--index >= 0) {
                geographicMapCellPosition = (cast this.list.get(index) : GeographicMapCellPosition);
                isCellVisitedBoolean = (cast localVisitedList.get(index) : Null<Bool>);
                if (!isCellVisitedBoolean) {
                    this.paintNotVisitedRelativeToPoint(graphics, geographicMapInterface.getAllBinaryTiledLayer(), geographicMapCellPosition.getPoint());
                }
                }
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "paintNotVisited", e);
        }
    }

    public function init() : Void {
        this.list.clear();
        this.visitedList.clear();
        this.totalVisited = 0;
    }

}

