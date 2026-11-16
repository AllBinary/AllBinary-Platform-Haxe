// Generated Code Do Not Modify
package org.allbinary.logic.string;

//import jsinterop.annotations.JsType;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;

class StringMaker {
    private var charArray : haxe.ds.Vector<Int>;
    private var currentLength : Int = 0;
    public function new() {
        this.charArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...20) 0]);
    }

    public function append(string : String) : StringMaker {
        final stringLength : Int = string.length;
        this.ensureCapacity(this.currentLength + stringLength);
        jre.lang.JavaString.getChars(string, 0, stringLength, this.charArray, this.currentLength);
        this.currentLength += stringLength;
        return this;
    }

    public function appendchar(c : Int) : StringMaker {
        this.ensureCapacity(this.currentLength + 1);
        this.charArray[this.currentLength++] = c;
        return this;
    }

    public function appendCharArray(charArray : haxe.ds.Vector<Int>, start : Int, end : Int) : StringMaker {
        this.ensureCapacity(this.currentLength + (end - start));
        for (index in start...end) {
            this.charArray[this.currentLength++] = charArray[index];
        }
        return this;
    }

    public function appendbyte(b : Int) : StringMaker {
        this.append(Std.string(b));
        return this;
    }

    public function appendshort(b : Int) : StringMaker {
        this.append(Std.string(b));
        return this;
    }

    public function appendint(i : Int) : StringMaker {
        this.append(Std.string(i));
        return this;
    }

    public function appendlong(l : haxe.Int64) : StringMaker {
        this.append(Std.string(l));
        return this;
    }

    public function appendfloat(f : Float) : StringMaker {
        this.append(Std.string(f));
        return this;
    }

    public function appendboolean(bool : Bool) : StringMaker {
        if (bool) {
            this.ensureCapacity(this.currentLength + 4);
            this.charArray[this.currentLength++] = "t".code;
            this.charArray[this.currentLength++] = "r".code;
            this.charArray[this.currentLength++] = "u".code;
            this.charArray[this.currentLength++] = "e".code;
        } else {
            this.ensureCapacity(this.currentLength + 5);
            this.charArray[this.currentLength++] = "f".code;
            this.charArray[this.currentLength++] = "a".code;
            this.charArray[this.currentLength++] = "l".code;
            this.charArray[this.currentLength++] = "s".code;
            this.charArray[this.currentLength++] = "e".code;
        }
        return this;
    }

    public function ensureCapacity(minSize : Int) : Void {
        final oldCapacity : Int = this.charArray.length;
        if (minSize > oldCapacity) {
            var newCapacity : Int = oldCapacity * 3;
            if (newCapacity < minSize) {
                newCapacity = minSize;
            }
            final copy : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newCapacity) 0]);
            final min : Int = this.min(this.charArray.length, newCapacity);
            haxe.ds.Vector.blit(this.charArray, 0, copy, 0, min);
            this.charArray = copy;
        }
    }

    public function min(value : Int, value2 : Int) : Int {
        return ((value <= value2) ? value : value2);
    }

    public function delete(start : Int, end : Int) : StringMaker {
        this.currentLength -= (end - start);
        return this;
    }

    public function length() : Int {
        return this.currentLength;
    }

    public function toString() : String {
        return jre.lang.JavaString.fromChars(this.charArray, 0, this.currentLength);
    }

}

