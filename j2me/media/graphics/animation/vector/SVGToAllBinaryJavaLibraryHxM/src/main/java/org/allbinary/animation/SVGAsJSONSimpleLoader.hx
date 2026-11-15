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
package org.allbinary.animation;

//import java.util.Enumeration;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.json.me.JSONArray;
import org.json.me.JSONException;
import org.json.me.JSONObject;

class SVGAsJSONSimpleLoader {
    private static final instance : SVGAsJSONSimpleLoader = new SVGAsJSONSimpleLoader();
    public static function getInstance() : SVGAsJSONSimpleLoader {
        return SVGAsJSONSimpleLoader.instance;
    }

    private final graphicsStrings : GraphicsStrings = GraphicsStrings.getInstance();
    private final shapeTypeFactory : ShapeTypeFactory = ShapeTypeFactory.getInstance();
    private final KEY_SVG : String = "svg";
    private final KEY_X1 : String = "x1";
    private final KEY_Y1 : String = "y1";
    private final KEY_X2 : String = "x2";
    private final KEY_Y2 : String = "y2";
    private final KEY_CX : String = "cx";
    private final KEY_CY : String = "cy";
    private final KEY_R : String = "r";
    private final KEY_X : String = PositionStrings.getInstance().X;
    private final KEY_Y : String = PositionStrings.getInstance().Y;
    private final ERROR_PARSE_SVG_JSON : String = "Unable to parse SVG JSON";
    private final ERROR_MISSING_KEY_PREFIX : String = "Missing key: ";
    private final ERROR_INVALID_NUMBER_PREFIX : String = "Invalid number for key: ";
    private final ERROR_EXPECTED_OBJECT_PREFIX : String = "Expected object for: ";
    private final EMPTY_POINTS : haxe.ds.Vector<haxe.ds.Vector<Int>> = PrimitiveIntUtil.getTwoDimensionalArrayInstance();
    private final SHAPE_SEPARATOR : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([1000, 1000]);
    private final CIRCLE_SEGMENTS : Int = 16;
    // throws Exception
    public function load(svgAsJson : String) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        if (svgAsJson == null) {
            return EMPTY_POINTS;
        }
        try {
            final root : JSONObject = new JSONObject(svgAsJson);
            final svgValue : Any = root.opt(KEY_SVG);
            final svg : JSONObject = (svgValue == null ? root : this.asObject(svgValue, KEY_SVG));
            final pointVector : BasicArrayList = new BasicArrayListD();
            final keys : Enumeration = svg.keys();
            while (keys.hasMoreElements()) {
                final key : String = (cast keys.nextElement() : String);
                final value : Any = svg.opt(key);
                if (this.shapeTypeFactory.KEY_LINE.equals(key)) {
                    this.addShapes(pointVector, value, this.shapeTypeFactory.LINE);
                } else if (this.shapeTypeFactory.equals(key)) {
                    this.addShapes(pointVector, value, this.shapeTypeFactory.CIRCLE);
                } else if (this.shapeTypeFactory.KEY_RECT.equals(key) || this.shapeTypeFactory.KEY_RECTANGLE.equals(key)) {
                    this.addShapes(pointVector, value, this.shapeTypeFactory.RECTANGLE);
                }
            }
            return this.toPoints(pointVector);
        } catch (e : JSONException) {
            throw new IllegalArgumentException(ERROR_PARSE_SVG_JSON, e);
        }
    }

    // throws Exception
    private function addShapes(pointVector : BasicArrayList, value : Any, shapeType : ShapeType) : Void {
        if (Std.isOfType(value, JSONArray)) {
            final array : JSONArray = (cast value : JSONArray);
            final size : Int = array.length();
            for (index in 0...size) {
                this.addShape(pointVector, array.opt(index), shapeType);
            }
        } else {
            this.addShape(pointVector, value, shapeType);
        }
    }

    // throws Exception
    private function addShape(pointVector : BasicArrayList, value : Any, shapeType : ShapeType) : Void {
        final shape : JSONObject = this.asObject(value, shapeType.getName());
        if (shapeType == this.shapeTypeFactory.LINE) {
            this.addLine(pointVector, shape);
        } else if (shapeType == this.shapeTypeFactory.CIRCLE) {
            this.addCircle(pointVector, shape);
        } else {
            this.addRectangle(pointVector, shape);
        }
    }

    // throws Exception
    private function addLine(pointVector : BasicArrayList, line : JSONObject) : Void {
        this.addPoint(pointVector, this.readInt(line, KEY_X1), this.readInt(line, KEY_Y1));
        this.addPoint(pointVector, this.readInt(line, KEY_X2), this.readInt(line, KEY_Y2));
        this.addSeparator(pointVector);
    }

    // throws Exception
    private function addCircle(pointVector : BasicArrayList, circle : JSONObject) : Void {
        final cx : Int = this.readInt(circle, KEY_CX);
        final cy : Int = this.readInt(circle, KEY_CY);
        final radius : Int = this.readInt(circle, KEY_R);
        for (index in 0...CIRCLE_SEGMENTS + 1) {
            final angle : Float = (Math.PI * 2.0 * index) / CIRCLE_SEGMENTS;
            final x : Int = Std.int(Math.round(cx + (Math.cos(angle) * radius)));
            final y : Int = Std.int(Math.round(cy + (Math.sin(angle) * radius)));
            this.addPoint(pointVector, x, y);
        }
        this.addSeparator(pointVector);
    }

    // throws Exception
    private function addRectangle(pointVector : BasicArrayList, rectangle : JSONObject) : Void {
        final x : Int = this.readInt(rectangle, KEY_X, 0);
        final y : Int = this.readInt(rectangle, KEY_Y, 0);
        final width : Int = this.readInt(rectangle, graphicsStrings.WIDTH);
        final height : Int = this.readInt(rectangle, graphicsStrings.HEIGHT);
        this.addPoint(pointVector, x, y);
        this.addPoint(pointVector, x + width, y);
        this.addPoint(pointVector, x + width, y + height);
        this.addPoint(pointVector, x, y + height);
        this.addPoint(pointVector, x, y);
        this.addSeparator(pointVector);
    }

    private function addPoint(pointVector : BasicArrayList, x : Int, y : Int) : Void {
        pointVector.add(haxe.ds.Vector.fromArrayCopy([x, y]));
    }

    private function addSeparator(pointVector : BasicArrayList) : Void {
        pointVector.add(haxe.ds.Vector.fromArrayCopy([SHAPE_SEPARATOR[0], SHAPE_SEPARATOR[1]]));
    }

    // throws Exception
    private function readInt(anyType : JSONObject, key : String) : Int {
        final value : Any = anyType.get(key);
        if (value == null) {
            throw new IllegalArgumentException(ERROR_MISSING_KEY_PREFIX + key);
        }
        return this.toInt(value, key);
    }

    private function readInt(anyType : JSONObject, key : String, defaultValue : Int) : Int {
        try {
            if (anyType.has(key)) {
                final value : Any = anyType.get(key);
                return this.toInt(value, key);
            }
        } catch (e : haxe.Exception) {
            trace(e.details());
        }
        return defaultValue;
    }

    private function toInt(value : Any, key : String) : Int {
        if (Std.isOfType(value, Number)) {
            return Std.int(Math.round(((cast value : Number))));
        }
        if (Std.isOfType(value, String)) {
            return Std.int(Math.round(Std.parseFloat((cast value : String))));
        }
        throw new IllegalArgumentException(ERROR_INVALID_NUMBER_PREFIX + key);
    }

    private function asObject(value : Any, name : String) : JSONObject {
        if (Std.isOfType(value, JSONObject)) {
            return (cast value : JSONObject);
        }
        throw new IllegalArgumentException(ERROR_EXPECTED_OBJECT_PREFIX + name);
    }

    private function toPoints(pointVector : BasicArrayList) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        if (pointVector.size() == 0) {
            return EMPTY_POINTS;
        }
        final points : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...pointVector.size()) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
        for (index in 0...pointVector.size()) {
            final point : haxe.ds.Vector<Int> = (cast pointVector.get(index) : haxe.ds.Vector<Int>);
            points[index] = point;
        }
        return points;
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        final svgAsJson : String = "{\"svg\": {\n" + "    \"rect\": {\n" + "        \"width\": 20,\n" + "        \"fill\": \"#008c00\",\n" + "        \"height\": 20\n" + "    },\n" + "    \"xmlns\": \"http://www.w3.org/2000/svg\",\n" + "    \"width\": 20,\n" + "    \"height\": 20\n" + "}}\n";
        final points : haxe.ds.Vector<haxe.ds.Vector<Int>> = SVGAsJSONSimpleLoader.getInstance().load(svgAsJson);
        final stringBuilder : StringMaker = new StringMaker();
        final size : Int = points.length;
        for (index in 0...size) {
            final size2 : Int = points[index].length;
            for (index2 in 0...size2) {
                stringBuilder.appendint(Std.int(points[index][index2]));
                stringBuilder.append(CommonSeps.getInstance().COMMA);
            }
        }
        trace(stringBuilder.toString());
    }

    public function new() {
    }
}

