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
package org.allbinary.animation.vector;

//import java.util.HashMap;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.j2me.workarea.tools.GraphicItemInterface;
import org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem;
import org.allbinary.graphics.j2me.workarea.tools.Points;
import org.allbinary.graphics.pipeline.BasicGraphicsPipeline;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class VectorCenterGenerator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var minX : Int = Integer.MAX_VALUE;
    public var minY : Int = Integer.MAX_VALUE;
    public var maxX : Int = Integer.MIN_VALUE;
    public var maxY : Int = Integer.MIN_VALUE;
    private var dx : Int = 0;
    private var dy : Int = 0;
    private var width : Int = 0;
    private var height : Int = 0;
    public function new() {
    }

    // throws Exception
    public function calculate(hashMap : HashMap) : Void {
        final graphicItemArray : haxe.ds.Vector<Any> = hashMap.keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast hashMap.get(graphicItemArray[index]) : GraphicItemInterface);
            if (item.getName() == LinesGraphicItem.getStaticName()) {
                this.getInstance(item.getPointsInterface().getPoints());
            }
        }
        this.logUtil.putF("minX: " + this.minX + " minY: " + this.minY + " maxX: " + this.maxX + " maxY: " + this.maxY, this, this.commonStrings.GET_INSTANCE);
        this.setWidth(this.maxX - this.minX);
        this.setHeight(this.maxY - this.minY);
        var max : Int = this.getWidth();
        if (getHeight() > max) {
            max = this.getHeight();
        }
        var middle : Int = Std.int(max / 2);
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final s : String = Std.string(new StringMaker().append(commonLabels.WIDTH_LABEL).appendint(getWidth()).append(commonLabels.HEIGHT_LABEL).appendint(getHeight()).append(" max: ").appendint(max).append(" middle: ").appendint(middle));
        this.logUtil.putF(s, this, this.commonStrings.GET_INSTANCE);
        var currentMiddleX : Int = this.minX + Std.int(this.getWidth() / 2);
        var currentMiddleY : Int = this.minY + Std.int(this.getHeight() / 2);
        this.dx = middle - currentMiddleX;
        this.dy = middle - currentMiddleY;
    }

    // throws Exception
    public function transform(hashMap : HashMap) : Void {
        this.calculate(hashMap);
        this.logUtil.putF(Std.string(new StringMaker().append(" dx: ").appendint(this.dx).append(" dy: ").appendint(this.dy)), this, this.commonStrings.GET_INSTANCE);
        final graphicItemArray : haxe.ds.Vector<Any> = hashMap.keySet().toArray();
        final size : Int = graphicItemArray.length;
        for (index in 0...size) {
            var item : GraphicItemInterface = (cast hashMap.get(graphicItemArray[index]) : GraphicItemInterface);
            var list : BasicArrayList = VectorCenterGenerator.translate(item.getPointsInterface().getPoints(), dx, dy);
            var newPoints : Points = new Points();
            newPoints.addPoints(list);
            item.setPointsInterface(newPoints);
        }
    }

    // throws Exception
    private function getInstance(pointVector : BasicArrayList) : Void {
        try {
            final size : Int = pointVector.size();
            for (index in 0...size) {
                var point : GPoint = (cast pointVector.get(index) : GPoint);
                if (point.getX() < this.minX) {
                    this.minX = point.getX();
                }
                if (point.getX() > this.maxX) {
                    this.maxX = point.getX();
                }
                if (point.getY() < this.minY) {
                    this.minY = point.getY();
                }
                if (point.getY() > this.maxY) {
                    this.maxY = point.getY();
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.GET_INSTANCE, e);
            throw e;
        }
    }

    // throws Exception
    public static function translate(list : BasicArrayList, x : Int, y : Int) : BasicArrayList {
        var graphicsPipe : BasicGraphicsPipeline = new BasicGraphicsPipeline(list);
        graphicsPipe.createMatrix();
        graphicsPipe.translate(x, y);
        return graphicsPipe.getMatrix();
    }

    public function getWidth() : Int {
        return this.width;
    }

    public function setWidth(width : Int) : Void {
        this.width = width;
    }

    public function getHeight() : Int {
        return this.height;
    }

    public function setHeight(height : Int) : Void {
        this.height = height;
    }

}

