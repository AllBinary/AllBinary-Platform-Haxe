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
package org.allbinary.graphics.j2me.workarea.tools;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel;
import org.allbinary.graphics.j2me.workarea.canvas.CanvasDom;
import org.allbinary.math.PositionStrings;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Node;

class PointsDomUtil {
    private static final instance : PointsDomUtil = new PointsDomUtil();
    public static function getInstance() : PointsDomUtil {
        return PointsDomUtil.instance;
    }

    public final LINES : String = "lines";
    public final POINTONE : String = "pointOne";
    public final POINTTWO : String = "pointTwo";
    private final ROTATEDPOINTONE : String = "rotatedPointOne";
    private final ROTATEDPOINTTWO : String = "rotatedPointTwo";
    private final LINE : String = "line";
    // throws Exception
    public function toDom(canvasDom : CanvasDom, pointVector : BasicArrayList) : Node {
        var tempPointVector : BasicArrayList = PointsUtil.getInstance().doTransforms(pointVector, canvasDom.getAngle(), PointFactory.getInstance().createXY(canvasDom.getDimension().getWidth(), canvasDom.getDimension().getHeight()));
        var document : org.w3c.dom.Document = WorkAreaJPanel.getDocument();
        var linesNode : Node = (cast document.createElement(this.LINES) : Node);
        var size2 : Int = tempPointVector.size();
        var size : Int = pointVector.size();
        var firstPoint : GPoint = null;
        var rotatedFirstPoint : GPoint = null;
        var index : Int = 0;
        if (index < size && index < size2) {
            rotatedFirstPoint = (cast tempPointVector.get(index) : GPoint);
            firstPoint = (cast pointVector.get(index) : GPoint);
            index++;
        }
        while (index < size && index < size2) {
            var lineNode : Node = (cast document.createElement(this.LINE) : Node);
            var rotatedSecondPoint : GPoint = (cast tempPointVector.get(index) : GPoint);
            var secondPoint : GPoint = (cast pointVector.get(index) : GPoint);
            var pointOneNode : Node = this.getPointNode(firstPoint, this.POINTONE);
            var pointTwoNode : Node = this.getPointNode(secondPoint, this.POINTTWO);
            var rotatedPointOneNode : Node = this.getPointNode(rotatedFirstPoint, this.ROTATEDPOINTONE);
            var rotatedPointTwoNode : Node = this.getPointNode(rotatedSecondPoint, this.ROTATEDPOINTTWO);
            lineNode.appendChild(pointOneNode);
            lineNode.appendChild(pointTwoNode);
            lineNode.appendChild(rotatedPointOneNode);
            lineNode.appendChild(rotatedPointTwoNode);
            firstPoint = secondPoint;
            rotatedFirstPoint = rotatedSecondPoint;
            linesNode.appendChild(lineNode);
            index++;
        }
        return linesNode;
    }

    private function getPointNode(point : GPoint, pointName : String) : Node {
        var document : org.w3c.dom.Document = WorkAreaJPanel.getDocument();
        var pointNode : Node = (cast document.createElement(pointName) : Node);
        var xNode : Node = (cast document.createElement(PositionStrings.getInstance().X) : Node);
        var xTextNode : Node = (cast document.createTextNode(Std.string(point.getX())) : Node);
        xNode.appendChild(xTextNode);
        var yNode : Node = (cast document.createElement(PositionStrings.getInstance().Y) : Node);
        var yTextNode : Node = (cast document.createTextNode(Std.string(point.getY())) : Node);
        yNode.appendChild(yTextNode);
        pointNode.appendChild(xNode);
        pointNode.appendChild(yNode);
        return pointNode;
    }

    public function new() {
    }
}

