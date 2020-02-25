#pragma once

#include <iostream>

class Bitmap
{
public:
	Bitmap() :
		number_(0)
	{}
	Bitmap(int number) :
		number_(number)
	{}
	~Bitmap()
	{
		std::cout << "Bitmap has destructed!" << std::endl;
	}
private:
	int number_;
};


class Widget
{
public:
	Widget() :
		pb(new Bitmap)
	{};
	Widget &operator=(const Widget& rhs);
	~Widget()
	{
		delete pb;
	}
private:
	Bitmap *pb;
};
