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
package org.allbinary.graphics.pipeline;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.math.Angle;
import org.allbinary.math.NoDecimalTrigTable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicGraphicsPipeline {
    public var pointBasicArrayList : BasicArrayList;
    public function new(points : BasicArrayList) {
        this.pointBasicArrayList = points;
    }

    public function setInitMatrix(points : BasicArrayList) : Void {
        this.pointBasicArrayList = points;
    }

    public function createMatrix() : Void {
    }

    // throws Exception
    public function translate(x : Int, y : Int) : Void {
        var newBasicArrayList : BasicArrayList = new BasicArrayListD();
        var size : Int = this.pointBasicArrayList.size();
        var pointFactory : PointFactory = PointFactory.getInstance();
        var secondPoint : GPoint = null;
        for (index in 0...size) {
            secondPoint = (cast this.pointBasicArrayList.objectArray[index] : GPoint);
            if (secondPoint.getX() != 1000) {
                newBasicArrayList.add(pointFactory.createXY(secondPoint.getX() + x, secondPoint.getY() + y));
            } else {
                newBasicArrayList.add(secondPoint);
            }
        }
        this.pointBasicArrayList = newBasicArrayList;
    }

    // throws Exception
    public function rotateToAngle(angle : Angle) : Void {
        this.rotate(Std.int(angle.getValue()));
    }

    private final noDecimalTrigTable : NoDecimalTrigTable = NoDecimalTrigTable.getInstance();
    // throws Exception
    private function rotate(angle : Int) : Void {
        var newBasicArrayList : BasicArrayList = new BasicArrayListD();
        var secondPoint : GPoint = null;
        var y : haxe.Int64 = haxe.Int64.ofInt(0);
        var secondX : haxe.Int64 = haxe.Int64.ofInt(0);
        var secondY : haxe.Int64 = haxe.Int64.ofInt(0);
        var point : GPoint = null;
        var pointFactory : PointFactory = PointFactory.getInstance();
        var size : Int = this.pointBasicArrayList.size();
        var sin : haxe.Int64 = haxe.Int64.ofInt(0);
        var cos : haxe.Int64 = haxe.Int64.ofInt(0);
        for (index in 0...size) {
            secondPoint = (cast this.pointBasicArrayList.objectArray[index] : GPoint);
            if (secondPoint.getX() != 1000) {
                sin = this.noDecimalTrigTable.sin(angle);
                cos = this.noDecimalTrigTable.cos(angle);
                y = secondPoint.getY() * sin;
                secondX = (secondPoint.getX() * cos) - y;
                secondY = (secondPoint.getX() * sin) + (secondPoint.getY() * cos);
                point = pointFactory.createXY(Std.int(haxe.Int64.toInt(secondX) / 10000), Std.int(haxe.Int64.toInt(secondY) / 10000));
                newBasicArrayList.add(point);
            } else {
                newBasicArrayList.add(secondPoint);
            }
        }
        this.pointBasicArrayList = newBasicArrayList;
    }

    // throws Exception
    public function mirror(width : Int) : Void {
        final pointFactory : PointFactory = PointFactory.getInstance();
        final halfWidth : Int = (width >> 1);
        final newBasicArrayList : BasicArrayList = new BasicArrayListD();
        var secondPoint : GPoint = null;
        var newX : Int = 0;
        var point : GPoint = null;
        final size : Int = this.pointBasicArrayList.size();
        for (index in 0...size) {
            secondPoint = (cast this.pointBasicArrayList.objectArray[index] : GPoint);
            if (secondPoint.getX() != 1000) {
                newX = 0;
                if (secondPoint.getX() > halfWidth) {
                    newX = halfWidth - (secondPoint.getX() - halfWidth);
                } else {
                    newX = halfWidth + (halfWidth - secondPoint.getX());
                }
                point = pointFactory.createXY(newX, secondPoint.getY());
                newBasicArrayList.add(point);
            } else {
                newBasicArrayList.add(secondPoint);
            }
        }
        this.pointBasicArrayList = newBasicArrayList;
    }

    public function getMatrix() : BasicArrayList {
        return this.pointBasicArrayList;
    }

}

