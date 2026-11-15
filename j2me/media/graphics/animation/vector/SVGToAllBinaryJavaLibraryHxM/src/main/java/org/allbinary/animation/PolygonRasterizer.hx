// Generated Code Do Not Modify
package org.allbinary.animation;


class PolygonRasterizer {
    private static final instance : PolygonRasterizer = new PolygonRasterizer();
    public static function getInstance() : PolygonRasterizer {
        return PolygonRasterizer.instance;
    }

    public function getPixelBuffer(svgPath : String, pathX : haxe.ds.Vector<Int>, pathY : haxe.ds.Vector<Int>, pixelBuffer : haxe.ds.Vector<Int>, width : Int, height : Int) : haxe.ds.Vector<Int> {
        final pointCount : Int = PathParser.parsePath(svgPath, pathX, pathY, pathX.length);
        for (i in 0...pixelBuffer.length) {
            pixelBuffer[i] = 0xFFFFFFFF;
        }
        PolygonRasterizer.getInstance().fillPolygon(pathX, pathY, pointCount, pixelBuffer, width, height, 0xFFFF00FF);
        return pixelBuffer;
    }

    public function fillPolygon(polyX : haxe.ds.Vector<Int>, polyY : haxe.ds.Vector<Int>, numPoints : Int, buffer : haxe.ds.Vector<Int>, width : Int, height : Int, colorRGB : Int) : Void {
        if (numPoints < 3) {
            return;
        }
        final fixedPoint : FixedPoint = FixedPoint.getInstance();
        var x : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...numPoints) 0]);
        var y : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...numPoints) 0]);
        var minY : Int = height;
        var maxY : Int = 0;
        for (i in 0...numPoints) {
            x[i] = fixedPoint.toInt(polyX[i]);
            y[i] = fixedPoint.toInt(polyY[i]);
            if (y[i] < minY) {
                minY = y[i];
            }
            if (y[i] > maxY) {
                maxY = y[i];
            }
        }
        if (minY < 0) {
            minY = 0;
        }
        if (maxY >= height) {
            maxY = height - 1;
        }
        var scanlineX : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...numPoints) 0]);
        for (scanY in minY...maxY + 1) {
            var intersectCount : Int = 0;
            for (i in 0...numPoints) {
                var next : Int = (i + 1) % numPoints;
                var x1 : Int = x[i];
                var y1 : Int = y[i];
                var x2 : Int = x[next];
                var y2 : Int = y[next];
                if ((y1 < scanY && y2 >= scanY) || (y2 < scanY && y1 >= scanY)) {
                    if (y2 != y1) {
                        var interX : Int = x1 + Std.int((scanY - y1) * (x2 - x1) / (y2 - y1));
                        scanlineX[intersectCount++] = interX;
                    }
                }
            }
            for (i in 0...intersectCount - 1) {
                for (j in i + 1...intersectCount) {
                    if (scanlineX[i] > scanlineX[j]) {
                        var temp : Int = scanlineX[i];
                        scanlineX[i] = scanlineX[j];
                        scanlineX[j] = temp;
                    }
                }
            }
            {
                var i : Int = 0;
                while (i < intersectCount) {
                if (i + 1 >= intersectCount) {
                    break;
                }
                var startX : Int = scanlineX[i];
                var endX : Int = scanlineX[i + 1];
                if (startX < 0) {
                    startX = 0;
                }
                if (endX >= width) {
                    endX = width - 1;
                }
                var rowOffset : Int = scanY * width;
                for (pixelX in startX...endX + 1) {
                    buffer[rowOffset + pixelX] = colorRGB;
                }
                    i += 2;
                }
            }
        }
    }

    public function main(args : haxe.ds.Vector<String>) : Void {
        final width : Int = 100;
        final height : Int = 100;
        final pathX : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...200) 0]);
        final pathY : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...200) 0]);
        final pixelBuffer : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...width * height) 0]);
        final svgPath : String = "M 32.139812,81.554575 14.450128,74.294372 V 50.000034 25.705697 l 17.73231,-7.268329 C 41.935209,14.439788 49.953112,11.168898 50,11.168723 c 0.04689,-1.74e-4 8.064791,3.270238 17.817562,7.267583 l 17.73231,7.267899 V 50 74.295795 l -17.73231,7.2679 c -9.752771,3.997344 -17.789855,7.264116 -17.860188,7.259492 -0.07033,-0.0046 -8.088235,-3.275499 -17.817562,-7.268612 z";
        PolygonRasterizer.getInstance().getPixelBuffer(svgPath, pathX, pathY, pixelBuffer, width, height);
    }

    public function new() {
    }
}

