// Generated Code Do Not Modify
package org.allbinary.util;

import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;
import jsinterop.annotations.JsProperty;

//This is a very fast and simple resizable list.
class BasicArrayList {
    private static final SIZE : String = ", Size: ";
    private final arrayUtil : ArrayUtil = ArrayUtil.getInstance();
    public var objectArray : haxe.ds.Vector<Any>;
    private var currentIndex : Int = 0;
    public function new(objectArray : haxe.ds.Vector<Any>) {
        this.objectArray = objectArray;
    }

    public function addAt(index : Int, element : Any) : Void {
        if (index > this.currentIndex || index < 0) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(CommonLabels.getInstance().INDEX_LABEL);
            stringBuffer.appendint(index);
            stringBuffer.append(BasicArrayList.SIZE);
            stringBuffer.appendint(this.currentIndex);
            throw new IndexOutOfBoundsException(stringBuffer.toString());
        }
        this.ensureCapacity(this.currentIndex + 1);
        haxe.ds.Vector.blit(this.objectArray, index, this.objectArray, index + 1, this.currentIndex - index);
        this.objectArray[index] = element;
        this.currentIndex++;
    }

    public function add(anyType : Any) : Bool {
        this.ensureCapacity(this.currentIndex + 1);
        this.objectArray[this.currentIndex++] = anyType;
        return true;
    }

    public function removeAt(index : Int) : Any {
        if (index >= this.currentIndex) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(CommonLabels.getInstance().INDEX_LABEL);
            stringBuffer.appendint(index);
            stringBuffer.append(BasicArrayList.SIZE);
            stringBuffer.appendint(this.currentIndex);
            throw new IndexOutOfBoundsException(stringBuffer.toString());
        }
        var oldValue : Any = this.objectArray[index];
        final numMoved : Int = this.currentIndex - index - 1;
        if (numMoved > 0) {
            haxe.ds.Vector.blit(this.objectArray, index + 1, this.objectArray, index, numMoved);
        }
        this.objectArray[--this.currentIndex] = null;
        return oldValue;
    }

    public function remove(anyType : Any) : Bool {
        if (anyType == null) {
            for (index in 0...this.currentIndex) {
                if (this.objectArray[index] == null) {
                    final numMoved : Int = this.currentIndex - index - 1;
                    if (numMoved > 0) {
                        haxe.ds.Vector.blit(this.objectArray, index + 1, this.objectArray, index, numMoved);
                    }
                    this.objectArray[--this.currentIndex] = null;
                    return true;
                }
            }
        } else {
            for (index in 0...this.currentIndex) {
                if (anyType == this.objectArray[index] || anyType.equals(this.objectArray[index])) {
                    final numMoved : Int = this.currentIndex - index - 1;
                    if (numMoved > 0) {
                        haxe.ds.Vector.blit(this.objectArray, index + 1, this.objectArray, index, numMoved);
                    }
                    this.objectArray[--this.currentIndex] = null;
                    return true;
                }
            }
        }
        return false;
    }

    public function removeAll2(list : BasicArrayList) : Bool {
        var result : Bool = true;
        final size : Int = list.size();
        for (index in 0...size) {
            if (this.remove(list.get(index))) {
            } else {
                result = false;
            }
        }
        return result;
    }

    public function addAll2(list : BasicArrayList) : Bool {
        this.ensureCapacity(this.currentIndex + list.currentIndex);
        var listSize : Int = list.currentIndex;
        for (index in 0...listSize) {
            this.objectArray[this.currentIndex++] = list.objectArray[index];
        }
        return true;
    }

    public function addAllList(list : BasicArrayList) : Bool {
        final newObjectArray : haxe.ds.Vector<Any> = list.toArray();
        return this.addAll(newObjectArray);
    }

    public function addAll(newObjectArray : haxe.ds.Vector<Any>) : Bool {
        final numSize : Int = newObjectArray.length;
        this.ensureCapacity(this.currentIndex + numSize);
        haxe.ds.Vector.blit(newObjectArray, 0, this.objectArray, this.currentIndex, numSize);
        this.currentIndex += numSize;
        return numSize != 0;
    }

    public function ensureCapacity(minSize : Int) : Void {
        final oldCapacity : Int = this.objectArray.length;
        if (minSize > oldCapacity) {
            var newCapacity : Int = ((oldCapacity * 3) >> 1) + 1;
            if (newCapacity < minSize) {
                newCapacity = minSize;
            }
            this.objectArray = this.arrayUtil.copyOf(this.objectArray, newCapacity);
        }
    }

    public function trimToSize() : Void {
        final oldCapacity : Int = this.objectArray.length;
        if (this.currentIndex < oldCapacity) {
            this.objectArray = this.arrayUtil.copyOf(this.objectArray, this.currentIndex);
        }
    }

    public function indexOf(anyType : Any) : Int {
        if (anyType == null) {
            for (i in 0...this.currentIndex) {
                if (this.objectArray[i] == null) {
                    return i;
                }
            }
        } else {
            for (i in 0...this.currentIndex) {
                if (anyType.equals(this.objectArray[i])) {
                    return i;
                }
            }
        }
        return -1;
    }

    public function lastIndexOf(anyType : Any) : Int {
        if (anyType == null) {
            {
                var i : Int = this.currentIndex - 1;
                while (i >= 0) {
                if (this.objectArray[i] == null) {
                    return i;
                }
                    i--;
                }
            }
        } else {
            {
                var i : Int = this.currentIndex - 1;
                while (i >= 0) {
                if (anyType.equals(this.objectArray[i])) {
                    return i;
                }
                    i--;
                }
            }
        }
        return -1;
    }

    public function get(index : Int) : Any {
        if (index >= this.currentIndex) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(CommonLabels.getInstance().INDEX_LABEL);
            stringBuffer.appendint(index);
            stringBuffer.append(BasicArrayList.SIZE);
            stringBuffer.appendint(this.currentIndex);
            throw new IndexOutOfBoundsException(stringBuffer.toString());
        }
        return this.objectArray[index];
    }

    public function set(index : Int, element : Any) : Any {
        if (index >= this.currentIndex) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(CommonLabels.getInstance().INDEX_LABEL);
            stringBuffer.appendint(index);
            stringBuffer.append(BasicArrayList.SIZE);
            stringBuffer.appendint(this.currentIndex);
            throw new IndexOutOfBoundsException(stringBuffer.toString());
        }
        final oldValue : Any = this.objectArray[index];
        this.objectArray[index] = element;
        return oldValue;
    }

    public function clear() : Void {
        for (i in 0...this.currentIndex) {
            this.objectArray[i] = null;
        }
        this.currentIndex = 0;
    }

    public function size() : Int {
        return this.currentIndex;
    }

    public function isEmpty() : Bool {
        return this.currentIndex == 0;
    }

    public function contains(anyType : Any) : Bool {
        return this.indexOf(anyType) >= 0;
    }

    public function toArray() : haxe.ds.Vector<Any> {
        return this.arrayUtil.copyOf(this.objectArray, this.currentIndex);
    }

    public function toArrayType(objectArray : haxe.ds.Vector<Any>) : haxe.ds.Vector<Any> {
        if (objectArray.length < this.currentIndex) {
            return this.arrayUtil.copyOfType(this.objectArray, this.currentIndex, Type.getClass(objectArray));
        }
        haxe.ds.Vector.blit(this.objectArray, 0, objectArray, 0, this.currentIndex);
        if (objectArray.length > this.currentIndex) {
            objectArray[this.currentIndex] = null;
        }
        return objectArray;
    }

    public function clone() : Any {
        final size : Int = this.size();
        final list : BasicArrayList = new BasicArrayListS(size);
        var anyType : Any = null;
        for (index in 0...size) {
            anyType = this.objectArray[index];
            list.add(anyType);
        }
        return list;
    }

    public function toString() : String {
        final COMMA_SEP : String = CommonSeps.getInstance().COMMA_SEP;
        final stringBuffer : StringMaker = new StringMaker();
        for (index in 0...this.currentIndex) {
            stringBuffer.append(this.objectArray[index].toString());
            stringBuffer.append(COMMA_SEP);
        }
        return stringBuffer.toString();
    }

}

