package com.fgyong;

import javax.sound.midi.SysexMessage;


public class Main {

	public Main() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	ArrayList list = new ArrayList(10);
	list.add(12);
	list.add(0);
	list.add(2);
	list.add(5);
	list.insert(0, 10);
	Asserts.test(list.get(0) == 10);
		System.out.println(list.toString());
	}

}
