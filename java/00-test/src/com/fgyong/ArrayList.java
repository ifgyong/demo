package com.fgyong;

import com.sun.org.apache.bcel.internal.generic.INEG;
import com.sun.org.apache.regexp.internal.recompile;

public class ArrayList {

	private int size;
	private int index = 0;
	private int[] elements;
	private static int DEFAULT_ARRAYLISY_SIZE=1;
	private static int DEFAULT_NOT_FOUND =-1;
	public ArrayList() {
		// TODO Auto-generated constructor stub
		size = DEFAULT_ARRAYLISY_SIZE;
		elements = new int[DEFAULT_ARRAYLISY_SIZE];
	}
	public ArrayList (int capaticy) {
		if (capaticy <DEFAULT_ARRAYLISY_SIZE) {
			capaticy = DEFAULT_ARRAYLISY_SIZE;
		}
		elements = new int[capaticy];
		size  = DEFAULT_ARRAYLISY_SIZE;
	}
	public int size () {
		return size;
	}
	public boolean isEmpty() {
		return size==0;
	}
	public void add(int val) {
//		if (index >=0 && index < size) {
//			elements[index++] = val;
//		}else {
//			throw new IndexOutOfBoundsException("Index:"+index+"超出范围了");
//		}
		insert(this.index++, val);
		
	}
	public void insert(int index,int val) {
		ensourceCapaticy(val);
		if (index < 0) {
			index = 0;
		}
		elements[index] = val;//赋值
//		this.index ++;
	}
	private void ensourceCapaticy(int size) {
		int old = elements.length;
		if (old >= size) return;
		int newCapacity = old + old>>1;//1.5倍
		int [] newElement = new int[newCapacity];
		for (int i = 0; i < elements.length; i++) {
			newElement[i] = elements[i];
		}
		elements = newElement;
	}
	public void set(int index,int val) {
		if (index >0 && index <size) {
			elements[index] = val;
		}else {
			throw new IndexOutOfBoundsException("Index:"+index+"超出范围了");
		}
	}
	public void clear() {
		size = 0;
	}
	public int get(int index) {
		if (index <0 ||index >size-1) {
			throw new IndexOutOfBoundsException("Index:"+index+" outofBounds");
		}else {
			return elements[index];
		}
	}
	public boolean contain(int t) {
		return indexOf(t) != DEFAULT_NOT_FOUND;
	}
	public int  indexOf(int t) {
		for (int i = 0; i < elements.length; i++) {
			if (elements[i] == t) {
				return i;
			}
		}
		return -1;
	}
	
	public String toString() {
		StringBuffer str = new StringBuffer("size:"+index+" [");
		
		for (int i = 0; i < index; i++) {
			str.append(this.get(i));
			if (i != index-1) {
				str.append(",");
			}
		}
		str.append("]");
		return str.toString();
	}
	public int remove(int index) {
		int val = get(index);
		if (index >=0 && index < size) {
			for (int i = index; i < this.index; i++) {
				set(index, get(index+1));
			}
			this.index --;
		}else {
			throw new IndexOutOfBoundsException("Index:"+index+"outofBounds");
		}
		return val;
	}

}
